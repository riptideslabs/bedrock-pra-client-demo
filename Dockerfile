# syntax=docker/dockerfile:1

FROM python:3-slim AS builder
WORKDIR /app

COPY product-review-agent/requirements.txt ./

RUN pip install --upgrade pip && \
    pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3-slim

RUN groupadd --gid 1000 appuser \
    && useradd --uid 1000 --gid 1000 -ms /bin/bash appuser

USER appuser
WORKDIR /home/appuser

EXPOSE 8501

COPY --from=builder /install /usr/local

COPY product-review-agent/ ./app

COPY --chmod=755 scripts/run.sh ./

ARG AGENT_ID
ARG AGENT_ALIAS
ENV AGENT_ID=${AGENT_ID}
ENV AGENT_ALIAS=${AGENT_ALIAS}

ENTRYPOINT ["./run.sh"]
