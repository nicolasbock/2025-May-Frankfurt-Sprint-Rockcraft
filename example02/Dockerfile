FROM ubuntu:24.04 AS build

RUN apt-get update
RUN apt-get install --yes --no-install-recommends python3-venv python3-build python3-pip

COPY . /app
WORKDIR /app

RUN python3 -m venv /venv
RUN /venv/bin/pip install --upgrade pip
RUN /venv/bin/pip install .

FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install --yes --no-install-recommends python3-venv

COPY --from=build /venv /venv

ENV PATH="/venv/bin:$PATH"
ENV PYTHONPATH="/venv/lib/python3.12/site-packages"

CMD ["hello-world"]
