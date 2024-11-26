# Hometask #8 (24/10)

# start
0. run instance:
    - chmod +x create_instance.sh
    - ./create_instance.sh {KEY_NAME} {SECURITY_GROUP_ID} {SUBNET_ID} {IAM_PROFILE_NAME}

1. delete instance:
    - chmod +x delete_instance.sh
    - ./delete_instance.sh {instance-id} 

# run

- [HTTP](http://54.167.39.89) - Accessible without SSL (Apache is running).
- [HTTPS](https://54.167.39.89) - Secure connection with SSL (Note: may show a warning due to self-signed certificate).

# Add SSL Certificate

To add a Let's Encrypt certificate and configure HTTPS properly, run the following command:

```bash
certbot --apache --non-interactive --agree-tos -m your-email@example.com
```