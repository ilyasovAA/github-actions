FROM openjdk:13-alpine as unpack
LABEL org.opencontainers.image.source=https://github.com/lyasovAA/github-actions
ADD target target
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM openjdk:13-alpine
ENV JAVA_OPTS="-Xmx128M"
# Set default timezone
ENV TZ=Europe/Moscow
ARG buildDir=target/dependency
COPY --from=unpack ${buildDir}/BOOT-INF/lib /app/BOOT-INF/lib
COPY --from=unpack ${buildDir}/META-INF /app/META-INF
COPY --from=unpack ${buildDir}/org /app/org
COPY --from=unpack ${buildDir}/BOOT-INF/classes /app/BOOT-INF/classes
WORKDIR /app
CMD java --enable-preview $JAVA_OPTS org.springframework.boot.loader.JarLauncher
