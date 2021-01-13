package main

// upload file
// > curl -T filename.txt 127.0.0.1:1234
// downlod file
// > curl 127.0.0.1:1234/filename.txt

import (
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"path/filepath"
)

var (
	port int
	base string
)

func FileHandler(w http.ResponseWriter, r *http.Request) {
	path := r.URL.Path
	filepath := filepath.Join(base, path)
	if r.Method == http.MethodGet {
		http.ServeFile(w, r, filepath)
		log.Printf("download file %s\n", filepath)
	} else {
		b, err := ioutil.ReadAll(r.Body)
		if err != nil {
			w.WriteHeader(500)
			_, _ = w.Write([]byte(fmt.Sprintf("%s", err)))
			return
		}

		err = ioutil.WriteFile(filepath, b, 0644)
		if err != nil {
			w.WriteHeader(500)
			_, _ = w.Write([]byte(fmt.Sprintf("%s", err)))
			return
		}

		w.WriteHeader(200)
		_, _ = w.Write([]byte(fmt.Sprintf("OK %s", filepath)))
		log.Printf("upload file %s\n", filepath)
	}
}

func main() {
	flag.IntVar(&port, "port", 1234, "set port")
	flag.StringVar(&base, "path", "/tmp/", "set path")
	flag.Parse()

	http.HandleFunc("/", FileHandler)

	log.Printf("starting server at port %d\n", port)
	err := http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
	if err != nil {
		log.Println(err)
	}
}
