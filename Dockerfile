FROM php:8.2-fpm

ARG user
ARG uid

# Update package list and install necessary packages including zip and unzip
RUN apt update && apt install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev

RUN pecl install redis \
    && docker-php-ext-enable redis

# Clean up apt cache
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Copy Composer binary from Composer image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Add user and set permissions
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

# Switch to the new user
USER $user
