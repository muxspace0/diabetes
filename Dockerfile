FROM zatonovo/r-base

COPY . /app/diabetes.3
WORKDIR /app/diabetes.3
RUN crant -SCi
