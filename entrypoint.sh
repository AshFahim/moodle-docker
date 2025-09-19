#!/bin/bash
# Start the cron service
service cron start

# Start Apache in the foreground
exec apache2-foreground