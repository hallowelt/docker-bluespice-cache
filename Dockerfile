FROM memcached:1.6.45-alpine
USER root
# Build info: value of build arg BUILDINFO, falls back to the UTC build timestamp (YmdHis)
ARG BUILDINFO
RUN mkdir -p /image && echo "${BUILDINFO:-$(date -u +%Y%m%d%H%M%S)}" > /image/BUILDINFO
USER memcache

CMD ["memcached", "-m", "512", "-o", "slab_reassign,slab_automove=2"]
