FROM golang AS build

COPY . /app
WORKDIR /app
RUN go build -o hello-world main.go

FROM scratch
COPY --from=build /app/hello-world /hello-world
CMD ["/hello-world"]
