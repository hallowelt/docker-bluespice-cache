FROM memcached:1.6.42-alpine
USER root
# Build info: value of build arg BUILDINFO, `-` if not set
ARG BUILDINFO
RUN mkdir -p /image && echo "${BUILDINFO:--}" > /image/BUILDINFO
USER memcache

CMD ["memcached", "-m", "512", "-o", "slab_reassign,slab_automove=2"]
