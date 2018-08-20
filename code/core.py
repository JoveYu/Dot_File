# coding: utf-8
import os
import sys
import logging

from qfcommon.web import template
from qfcommon.base import dbpool

from bottle import Bottle,Route,request,response,run,static_file

log = logging.getLogger()

class Handler(object):
    def __init__(self):
        self.request = request
        self.response = response


class Application(object):
    def __init__(self, settings):
        '''
        settings:
            DOCUMENT_ROOT: web root path
            DEBUG: True/False
            CHARSET: utf-8
            LOGGER: log file
            HOME: project home path
            TEMPLATE: {'path':xx,'tmp':xx,'cache':True}
            DATABASE: database config
            APPS: app
            URLS: (('/', index.Index), )
            STATICS
            SESSION
            MIDDLEWARE
        '''
        self.method_allowed = ['GET','POST','PUT','DELETE']
        self.bottle = Bottle()
        self.settings = settings
        self.add_urls(self.settings.URLS)
        self.debug = settings.DEBUG
        self.charset = settings.CHARSET
        if not self.settings.DOCUMENT_ROOT:
            self.document_root = os.getcwd()
        else:
            self.document_root = self.settings.DOCUMENT_ROOT

        self.install()

    def add_url(self, rule, handler):
        for m in self.method_allowed:
            h = handler()
            if m in dir(h):
                func = getattr(h, m)
                r = Route(app = self.bottle, rule = rule, method = m, callback = func)
                self.bottle.add_route(r)

    def add_urls(self, urls, appname=''):
        for item in urls:
            if appname:
                self.add_url('/' + appname + item[0], item[1])
            else:
                self.add_url(item[0], item[1])

    def install(self):

        if self.settings.HOME not in sys.path:
            sys.path.insert(0, self.settings.HOME)

        tplcf = self.settings.TEMPLATE
        if tplcf['tmp'] and not os.path.isdir(tplcf['tmp']):
            os.mkdir(tplcf['tmp'])
        if tplcf['path']:
            template.install(tplcf['path'], tplcf['tmp'], tplcf['cache'],
                             self.settings.CHARSET)

        for s in self.settings.STATICS:
            log.info('add static')
            static_root = self.document_root + s

            def server_static(filepath):
                return static_file(filepath, root=static_root)

            r = Route(app = self.bottle, rule = s+ '<filepath:path>', method = 'GET', callback = server_static)
            self.bottle.add_route(r)

        if self.settings.DATABASE:
            dbpool.install(self.settings.DATABASE)

        for appname in self.settings.APPS:
            self.add_app(appname)

    def add_app(self, appname):
        log.debug('add app:%s', appname)
        m = __import__(appname)
        self.add_urls(m.URLS, appname)

    def __call__(self, environ, start_response):
        ret = self.bottle.wsgi(environ, start_response)
        return ret


def run_server(app, server = 'tornado', host = '', port = 8080, *args, **kwargs):
    run(app = app, server = server, host = host, port = port, *args, **kwargs)
