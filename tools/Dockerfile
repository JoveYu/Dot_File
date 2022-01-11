FROM golang:alpine AS build
WORKDIR /
COPY *.go ./
RUN CGO_ENABLED=0 go build -o transfile *.go

FROM alpine
WORKDIR /
COPY --from=build /transfile /
EXPOSE 80
CMD /transfile

