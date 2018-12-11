#!/bin/bash
set -e
puma -C /app/server/config/config.ru
