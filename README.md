# mre-kc-account-console-disable-email-edit

## Summary

Minimal reproducible example for TODO.

When **Email as username** is enabled via the _Admin Console_, why does the `--features="update-email"` option cause the Email field to be disabled on the _Account Console_?

This seems unintuitive, as I thought `--features-disabled="update-email"` would be needed instead.

## Steps to reproduce

### _Without_ feature flag

1. Install Docker
1. Build images

        docker compose build

1. Up `kc-a`

        docker compose up kc-a

1. Go to the account console at http://localhost:8080/realms/master/account/
1. Login with
    - Username: `admin`
    - Password: `juggle-prance-shallot-wireless-outlet`
1. Notice how the **Email** field is **enabled**

### _With_ feature flag

1. Press `Ctrl` + `C`, then down containers

        docker compose down

1. Up `kc-b`

        docker compose up kc-b

1. Go to the account console again and login with the same credentials
1. Notice how the **Email** field is **disabled**
