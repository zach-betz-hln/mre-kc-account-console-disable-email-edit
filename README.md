# mre-kc-account-console-disable-email-edit

## Summary

When does the Email field become disabled on the _Account Console_?

## Steps to reproduce

### Prereqs

1. Install Docker

### _Without_ feature flag

1. Build and up

        docker compose down ; docker compose up --build kc-a

1. Login to the account console
1. Notice how the **Email** field is **disabled**

### _With_ feature flag

1. Build and up

        docker compose down ; docker compose up --build kc-b

1. Login to the account console
1. Notice how the **Email** field is **disabled**

## Links

- Account console: http://localhost:8080/realms/master/account/
    - Username: `jane@example.com`
    - Password: `juggle-prance-shallot-wireless-outlet`
- Admin console: http://localhost:8080/admin/master/console/
    - Username: `admin`
    - Password: `juggle-prance-shallot-wireless-outlet`
