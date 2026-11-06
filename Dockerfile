FROM memcached:1.6.45-alpine
USER root
# Build timestamp (UTC, YmdHis)
RUN mkdir -p /image && date -u +%Y%m%d%H%M%S > /image/BUILDINFO
USER memcache

CMD ["memcached", "-m", "512", "-o", "slab_reassign,slab_automove=2"]
