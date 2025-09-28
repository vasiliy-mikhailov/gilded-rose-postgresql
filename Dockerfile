FROM postgres:17

# Install pgTAP & pg_prove
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-17-pgtap \
       postgresql-client \
       libpq-dev \
       make \
       perl \
       rbenv \
       ruby-build \
       ruby-dev \
       libtap-parser-sourcehandler-pgtap-perl \
    && rm -rf /var/lib/apt/lists/*

RUN rbenv install 3.0.6 \
    && rbenv global 3.0.6 \
    && eval "$(rbenv init -)" \
    && gem install piggly \
    && rbenv rehash \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh \
    && echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# Copy SQL sources and tests
COPY src /src
COPY tests /tests
COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

# Make run_tests.sh executable
RUN chmod +x /tests/run_tests.sh
