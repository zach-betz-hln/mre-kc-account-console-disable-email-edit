--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	e9e8024f-b41d-43e0-95d6-8e98557ede41	1800	f	\N	t	f	f	f	0	1	30	6	HmacSHA1	totp	1941af51-4e61-4061-b56b-9a5335f035fb	436d2c3f-e06c-435c-a5ac-04b55c44e9ed	98b81575-4beb-4e21-949e-8ee93005b12d	def07c22-695b-4508-967f-ea758e453724	171382a2-d7f7-4975-8fcd-920d04d3f5a7	2592000	f	900	t	f	0ede3ea7-1001-432d-b7cf-98fa09995b29	0	f	0	0	45c47adb-8835-416d-ad37-255379c4d94b
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
1941af51-4e61-4061-b56b-9a5335f035fb	browser	browser based authentication	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	t	t
b3cdcf5a-0a10-4b5d-b226-6d825817e4ee	forms	Username, password, otp and other auth forms.	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
7c087a7c-a965-4c50-b8b2-7d523d1ab494	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
98b81575-4beb-4e21-949e-8ee93005b12d	direct grant	OpenID Connect Resource Owner Grant	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	t	t
b6516c03-c081-47d5-94cd-cc16f0b3f51c	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
436d2c3f-e06c-435c-a5ac-04b55c44e9ed	registration	registration flow	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	t	t
d4bfbfb1-6234-4829-b62b-e0b67213503f	registration form	registration form	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	form-flow	f	t
def07c22-695b-4508-967f-ea758e453724	reset credentials	Reset credentials for a user if they forgot their password or something	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	t	t
c416dbe9-79ef-4140-b25e-e3964a6bbcf1	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
171382a2-d7f7-4975-8fcd-920d04d3f5a7	clients	Base authentication for clients	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	client-flow	t	t
f52fe34a-1e1b-43a8-aced-35dd3988226c	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	t	t
32cc2d0c-b9de-48ae-9187-b2cb50c0fa18	User creation or linking	Flow for the existing/non-existing user alternatives	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
fa3ace53-f924-4ea6-adff-ea8fc780dbd0	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
2d42cc1d-708d-4097-8999-352f541c80ef	Account verification options	Method with which to verity the existing account	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
4059bd8f-5ea6-4988-88bc-47cc482b3a6a	Verify Existing Account by Re-authentication	Reauthentication of existing account	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
5527ee23-e4ad-48ac-be29-97ef48f6e866	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	f	t
207c9372-9c78-4be5-9117-6df676530b27	saml ecp	SAML ECP Profile Authentication Flow	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	t	t
0ede3ea7-1001-432d-b7cf-98fa09995b29	docker auth	Used by Docker clients to authenticate against the IDP	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	basic-flow	t	t
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
b91ffe8d-5e9a-467b-b2d8-e43df8897053	\N	auth-cookie	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	1941af51-4e61-4061-b56b-9a5335f035fb	2	10	f	\N	\N
893e30d0-8d1d-45b0-af54-c9614624c86c	\N	auth-spnego	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	1941af51-4e61-4061-b56b-9a5335f035fb	3	20	f	\N	\N
40a701ae-347f-4f3d-9360-48d8cb8b304f	\N	identity-provider-redirector	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	1941af51-4e61-4061-b56b-9a5335f035fb	2	25	f	\N	\N
2568f708-4bae-4e2c-ba21-23b5aa8fd4d6	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	1941af51-4e61-4061-b56b-9a5335f035fb	2	30	t	b3cdcf5a-0a10-4b5d-b226-6d825817e4ee	\N
10f03a0d-06b6-478d-8ac7-d807b7f75e2f	\N	auth-username-password-form	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	b3cdcf5a-0a10-4b5d-b226-6d825817e4ee	0	10	f	\N	\N
66ceafc3-2218-4bfe-b7e4-001d1d77be8f	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	b3cdcf5a-0a10-4b5d-b226-6d825817e4ee	1	20	t	7c087a7c-a965-4c50-b8b2-7d523d1ab494	\N
cc7c7734-72b7-4a90-99a5-f07cc56cefcc	\N	conditional-user-configured	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	7c087a7c-a965-4c50-b8b2-7d523d1ab494	0	10	f	\N	\N
ac7373b4-94ac-4d18-bdfa-5283c7043719	\N	auth-otp-form	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	7c087a7c-a965-4c50-b8b2-7d523d1ab494	0	20	f	\N	\N
6660fa9a-d4ec-41e9-883f-5a6f49a14593	\N	direct-grant-validate-username	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	98b81575-4beb-4e21-949e-8ee93005b12d	0	10	f	\N	\N
60a51e63-f617-4cf1-bfe8-f2cb31eb06de	\N	direct-grant-validate-password	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	98b81575-4beb-4e21-949e-8ee93005b12d	0	20	f	\N	\N
b17f1eac-7224-4427-a103-0ee795afbe3c	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	98b81575-4beb-4e21-949e-8ee93005b12d	1	30	t	b6516c03-c081-47d5-94cd-cc16f0b3f51c	\N
799186d5-4702-4ca3-a755-fed02fd39cdd	\N	conditional-user-configured	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	b6516c03-c081-47d5-94cd-cc16f0b3f51c	0	10	f	\N	\N
bfb97f59-2880-4076-a24c-f7f7d32108ff	\N	direct-grant-validate-otp	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	b6516c03-c081-47d5-94cd-cc16f0b3f51c	0	20	f	\N	\N
b588ec54-2e1f-468b-b214-363d70106629	\N	registration-page-form	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	436d2c3f-e06c-435c-a5ac-04b55c44e9ed	0	10	t	d4bfbfb1-6234-4829-b62b-e0b67213503f	\N
e782c799-34b8-4965-a2d6-28aa9e83e66c	\N	registration-user-creation	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	d4bfbfb1-6234-4829-b62b-e0b67213503f	0	20	f	\N	\N
644d5ee7-fec7-4a4a-b50d-6cdaa2fbcfd3	\N	registration-password-action	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	d4bfbfb1-6234-4829-b62b-e0b67213503f	0	50	f	\N	\N
d46aeccb-5fa0-4e36-8458-d664dae3a4c1	\N	registration-recaptcha-action	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	d4bfbfb1-6234-4829-b62b-e0b67213503f	3	60	f	\N	\N
f33918fa-7fa3-487e-866b-8e07dc647c5d	\N	registration-terms-and-conditions	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	d4bfbfb1-6234-4829-b62b-e0b67213503f	3	70	f	\N	\N
00aee542-43b5-4c78-ae76-e3a30d723207	\N	reset-credentials-choose-user	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	def07c22-695b-4508-967f-ea758e453724	0	10	f	\N	\N
420f045b-ab5f-4467-bb7c-0e83c3f01b2e	\N	reset-credential-email	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	def07c22-695b-4508-967f-ea758e453724	0	20	f	\N	\N
5668bcc3-bc82-48bc-a8de-0cfa152a031c	\N	reset-password	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	def07c22-695b-4508-967f-ea758e453724	0	30	f	\N	\N
6725d45b-bd4c-4f02-a255-98786db93aac	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	def07c22-695b-4508-967f-ea758e453724	1	40	t	c416dbe9-79ef-4140-b25e-e3964a6bbcf1	\N
61b9d47d-e99e-433c-8091-e05ef3c1bb3f	\N	conditional-user-configured	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	c416dbe9-79ef-4140-b25e-e3964a6bbcf1	0	10	f	\N	\N
e40f3072-8934-4da6-a9d5-2ff2d9dbc9e3	\N	reset-otp	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	c416dbe9-79ef-4140-b25e-e3964a6bbcf1	0	20	f	\N	\N
01a3d8d4-361e-4ad7-8669-7f0aa6d3ccae	\N	client-secret	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	171382a2-d7f7-4975-8fcd-920d04d3f5a7	2	10	f	\N	\N
a4f5d1d8-7c11-48b6-837c-4a7d069d6c55	\N	client-jwt	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	171382a2-d7f7-4975-8fcd-920d04d3f5a7	2	20	f	\N	\N
03b112ec-40bd-4d6b-8805-09c1a480c426	\N	client-secret-jwt	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	171382a2-d7f7-4975-8fcd-920d04d3f5a7	2	30	f	\N	\N
78fa56c5-dd6b-4831-b602-caf1afde80a1	\N	client-x509	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	171382a2-d7f7-4975-8fcd-920d04d3f5a7	2	40	f	\N	\N
332ad4b8-6f17-4471-9bf1-a7b6ca7eb181	\N	idp-review-profile	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f52fe34a-1e1b-43a8-aced-35dd3988226c	0	10	f	\N	8efcbfa0-edac-4a82-bb32-b7207ee76e58
c10e6c84-ae86-41be-ad66-52a9e88fe4c3	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f52fe34a-1e1b-43a8-aced-35dd3988226c	0	20	t	32cc2d0c-b9de-48ae-9187-b2cb50c0fa18	\N
1ace7962-9789-44cc-9af0-78837c030f0f	\N	idp-create-user-if-unique	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	32cc2d0c-b9de-48ae-9187-b2cb50c0fa18	2	10	f	\N	b9ad0fcd-d2ba-49c8-95ce-1ea7428f5046
608a40a7-645f-4cff-a2ea-b068a60c19dc	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	32cc2d0c-b9de-48ae-9187-b2cb50c0fa18	2	20	t	fa3ace53-f924-4ea6-adff-ea8fc780dbd0	\N
a9067c87-c898-4957-9f97-094be83a14e5	\N	idp-confirm-link	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	fa3ace53-f924-4ea6-adff-ea8fc780dbd0	0	10	f	\N	\N
82c7a96c-a227-40d0-ac75-b911b225ea0e	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	fa3ace53-f924-4ea6-adff-ea8fc780dbd0	0	20	t	2d42cc1d-708d-4097-8999-352f541c80ef	\N
aefdbf3a-4e42-4967-bc3c-437811a504b1	\N	idp-email-verification	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	2d42cc1d-708d-4097-8999-352f541c80ef	2	10	f	\N	\N
550c7a33-04dd-4061-a1bf-9d24a521c8c6	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	2d42cc1d-708d-4097-8999-352f541c80ef	2	20	t	4059bd8f-5ea6-4988-88bc-47cc482b3a6a	\N
663aaa8e-d668-476c-9adb-8c654485ec6f	\N	idp-username-password-form	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	4059bd8f-5ea6-4988-88bc-47cc482b3a6a	0	10	f	\N	\N
d5a9ba38-4578-4a54-a7a6-8d4a2e8b592e	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	4059bd8f-5ea6-4988-88bc-47cc482b3a6a	1	20	t	5527ee23-e4ad-48ac-be29-97ef48f6e866	\N
0d7c84e5-f7bf-47be-a712-9e50860d63a7	\N	conditional-user-configured	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	5527ee23-e4ad-48ac-be29-97ef48f6e866	0	10	f	\N	\N
a097215a-5975-4ed3-8621-b1366d2f3007	\N	auth-otp-form	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	5527ee23-e4ad-48ac-be29-97ef48f6e866	0	20	f	\N	\N
db0c4384-86a7-477e-976a-43bc30e800f4	\N	http-basic-authenticator	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	207c9372-9c78-4be5-9117-6df676530b27	0	10	f	\N	\N
a0ffaedb-7245-45e2-8939-a2270ac7aed3	\N	docker-http-basic-authenticator	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0ede3ea7-1001-432d-b7cf-98fa09995b29	0	10	f	\N	\N
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
8efcbfa0-edac-4a82-bb32-b7207ee76e58	review profile config	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d
b9ad0fcd-d2ba-49c8-95ce-1ea7428f5046	create unique user config	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
8efcbfa0-edac-4a82-bb32-b7207ee76e58	missing	update.profile.on.first.login
b9ad0fcd-d2ba-49c8-95ce-1ea7428f5046	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
e9e8024f-b41d-43e0-95d6-8e98557ede41	t	f	master-realm	0	f	\N	\N	t	\N	f	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
b6a57285-224c-4f9e-843c-8bbf73995434	t	f	broker	0	f	\N	\N	t	\N	f	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
acb05ca4-09b1-4c16-9ff1-be65474c10df	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	t	f	admin-cli	0	t	\N	\N	f	\N	f	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
ef185f42-ba9b-415a-babc-c20a04e9c7b1	post.logout.redirect.uris	+
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	post.logout.redirect.uris	+
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	pkce.code.challenge.method	S256
acb05ca4-09b1-4c16-9ff1-be65474c10df	post.logout.redirect.uris	+
acb05ca4-09b1-4c16-9ff1-be65474c10df	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
e27b00b1-5e97-4c07-bb7e-af4f1806a975	offline_access	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect built-in scope: offline_access	openid-connect
1ee040f3-009b-4365-bd1a-458fbb30a7f2	role_list	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	SAML role list	saml
f3a68324-a46e-4065-8584-bd450e3b7f0b	profile	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect built-in scope: profile	openid-connect
69634309-a0bb-4254-bcc4-f2914405e2b7	email	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect built-in scope: email	openid-connect
6140188c-b6e6-4c6c-915d-7ab860175127	address	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect built-in scope: address	openid-connect
57371052-85c8-4a66-bdd3-451d0f29f6a0	phone	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect built-in scope: phone	openid-connect
fec51e78-0db2-4c5e-b391-b443effb761d	roles	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect scope for add user roles to the access token	openid-connect
47ce0c40-f57b-449b-98af-ce8585403016	web-origins	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect scope for add allowed web origins to the access token	openid-connect
6261e3f8-7435-4643-90e9-f98ee7ebcaa5	microprofile-jwt	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	Microprofile - JWT built-in scope	openid-connect
0d19a96c-371d-457f-a996-09edac1ca837	acr	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
e27b00b1-5e97-4c07-bb7e-af4f1806a975	true	display.on.consent.screen
e27b00b1-5e97-4c07-bb7e-af4f1806a975	${offlineAccessScopeConsentText}	consent.screen.text
1ee040f3-009b-4365-bd1a-458fbb30a7f2	true	display.on.consent.screen
1ee040f3-009b-4365-bd1a-458fbb30a7f2	${samlRoleListScopeConsentText}	consent.screen.text
f3a68324-a46e-4065-8584-bd450e3b7f0b	true	display.on.consent.screen
f3a68324-a46e-4065-8584-bd450e3b7f0b	${profileScopeConsentText}	consent.screen.text
f3a68324-a46e-4065-8584-bd450e3b7f0b	true	include.in.token.scope
69634309-a0bb-4254-bcc4-f2914405e2b7	true	display.on.consent.screen
69634309-a0bb-4254-bcc4-f2914405e2b7	${emailScopeConsentText}	consent.screen.text
69634309-a0bb-4254-bcc4-f2914405e2b7	true	include.in.token.scope
6140188c-b6e6-4c6c-915d-7ab860175127	true	display.on.consent.screen
6140188c-b6e6-4c6c-915d-7ab860175127	${addressScopeConsentText}	consent.screen.text
6140188c-b6e6-4c6c-915d-7ab860175127	true	include.in.token.scope
57371052-85c8-4a66-bdd3-451d0f29f6a0	true	display.on.consent.screen
57371052-85c8-4a66-bdd3-451d0f29f6a0	${phoneScopeConsentText}	consent.screen.text
57371052-85c8-4a66-bdd3-451d0f29f6a0	true	include.in.token.scope
fec51e78-0db2-4c5e-b391-b443effb761d	true	display.on.consent.screen
fec51e78-0db2-4c5e-b391-b443effb761d	${rolesScopeConsentText}	consent.screen.text
fec51e78-0db2-4c5e-b391-b443effb761d	false	include.in.token.scope
47ce0c40-f57b-449b-98af-ce8585403016	false	display.on.consent.screen
47ce0c40-f57b-449b-98af-ce8585403016		consent.screen.text
47ce0c40-f57b-449b-98af-ce8585403016	false	include.in.token.scope
6261e3f8-7435-4643-90e9-f98ee7ebcaa5	false	display.on.consent.screen
6261e3f8-7435-4643-90e9-f98ee7ebcaa5	true	include.in.token.scope
0d19a96c-371d-457f-a996-09edac1ca837	false	display.on.consent.screen
0d19a96c-371d-457f-a996-09edac1ca837	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
ef185f42-ba9b-415a-babc-c20a04e9c7b1	f3a68324-a46e-4065-8584-bd450e3b7f0b	t
ef185f42-ba9b-415a-babc-c20a04e9c7b1	47ce0c40-f57b-449b-98af-ce8585403016	t
ef185f42-ba9b-415a-babc-c20a04e9c7b1	0d19a96c-371d-457f-a996-09edac1ca837	t
ef185f42-ba9b-415a-babc-c20a04e9c7b1	69634309-a0bb-4254-bcc4-f2914405e2b7	t
ef185f42-ba9b-415a-babc-c20a04e9c7b1	fec51e78-0db2-4c5e-b391-b443effb761d	t
ef185f42-ba9b-415a-babc-c20a04e9c7b1	57371052-85c8-4a66-bdd3-451d0f29f6a0	f
ef185f42-ba9b-415a-babc-c20a04e9c7b1	e27b00b1-5e97-4c07-bb7e-af4f1806a975	f
ef185f42-ba9b-415a-babc-c20a04e9c7b1	6261e3f8-7435-4643-90e9-f98ee7ebcaa5	f
ef185f42-ba9b-415a-babc-c20a04e9c7b1	6140188c-b6e6-4c6c-915d-7ab860175127	f
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	f3a68324-a46e-4065-8584-bd450e3b7f0b	t
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	47ce0c40-f57b-449b-98af-ce8585403016	t
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	0d19a96c-371d-457f-a996-09edac1ca837	t
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	69634309-a0bb-4254-bcc4-f2914405e2b7	t
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	fec51e78-0db2-4c5e-b391-b443effb761d	t
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	57371052-85c8-4a66-bdd3-451d0f29f6a0	f
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	e27b00b1-5e97-4c07-bb7e-af4f1806a975	f
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	6261e3f8-7435-4643-90e9-f98ee7ebcaa5	f
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	6140188c-b6e6-4c6c-915d-7ab860175127	f
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	f3a68324-a46e-4065-8584-bd450e3b7f0b	t
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	47ce0c40-f57b-449b-98af-ce8585403016	t
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	0d19a96c-371d-457f-a996-09edac1ca837	t
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	69634309-a0bb-4254-bcc4-f2914405e2b7	t
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	fec51e78-0db2-4c5e-b391-b443effb761d	t
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	57371052-85c8-4a66-bdd3-451d0f29f6a0	f
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	e27b00b1-5e97-4c07-bb7e-af4f1806a975	f
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	6261e3f8-7435-4643-90e9-f98ee7ebcaa5	f
49cf40c2-ba07-49c4-a975-bbdfcd47aaa3	6140188c-b6e6-4c6c-915d-7ab860175127	f
b6a57285-224c-4f9e-843c-8bbf73995434	f3a68324-a46e-4065-8584-bd450e3b7f0b	t
b6a57285-224c-4f9e-843c-8bbf73995434	47ce0c40-f57b-449b-98af-ce8585403016	t
b6a57285-224c-4f9e-843c-8bbf73995434	0d19a96c-371d-457f-a996-09edac1ca837	t
b6a57285-224c-4f9e-843c-8bbf73995434	69634309-a0bb-4254-bcc4-f2914405e2b7	t
b6a57285-224c-4f9e-843c-8bbf73995434	fec51e78-0db2-4c5e-b391-b443effb761d	t
b6a57285-224c-4f9e-843c-8bbf73995434	57371052-85c8-4a66-bdd3-451d0f29f6a0	f
b6a57285-224c-4f9e-843c-8bbf73995434	e27b00b1-5e97-4c07-bb7e-af4f1806a975	f
b6a57285-224c-4f9e-843c-8bbf73995434	6261e3f8-7435-4643-90e9-f98ee7ebcaa5	f
b6a57285-224c-4f9e-843c-8bbf73995434	6140188c-b6e6-4c6c-915d-7ab860175127	f
e9e8024f-b41d-43e0-95d6-8e98557ede41	f3a68324-a46e-4065-8584-bd450e3b7f0b	t
e9e8024f-b41d-43e0-95d6-8e98557ede41	47ce0c40-f57b-449b-98af-ce8585403016	t
e9e8024f-b41d-43e0-95d6-8e98557ede41	0d19a96c-371d-457f-a996-09edac1ca837	t
e9e8024f-b41d-43e0-95d6-8e98557ede41	69634309-a0bb-4254-bcc4-f2914405e2b7	t
e9e8024f-b41d-43e0-95d6-8e98557ede41	fec51e78-0db2-4c5e-b391-b443effb761d	t
e9e8024f-b41d-43e0-95d6-8e98557ede41	57371052-85c8-4a66-bdd3-451d0f29f6a0	f
e9e8024f-b41d-43e0-95d6-8e98557ede41	e27b00b1-5e97-4c07-bb7e-af4f1806a975	f
e9e8024f-b41d-43e0-95d6-8e98557ede41	6261e3f8-7435-4643-90e9-f98ee7ebcaa5	f
e9e8024f-b41d-43e0-95d6-8e98557ede41	6140188c-b6e6-4c6c-915d-7ab860175127	f
acb05ca4-09b1-4c16-9ff1-be65474c10df	f3a68324-a46e-4065-8584-bd450e3b7f0b	t
acb05ca4-09b1-4c16-9ff1-be65474c10df	47ce0c40-f57b-449b-98af-ce8585403016	t
acb05ca4-09b1-4c16-9ff1-be65474c10df	0d19a96c-371d-457f-a996-09edac1ca837	t
acb05ca4-09b1-4c16-9ff1-be65474c10df	69634309-a0bb-4254-bcc4-f2914405e2b7	t
acb05ca4-09b1-4c16-9ff1-be65474c10df	fec51e78-0db2-4c5e-b391-b443effb761d	t
acb05ca4-09b1-4c16-9ff1-be65474c10df	57371052-85c8-4a66-bdd3-451d0f29f6a0	f
acb05ca4-09b1-4c16-9ff1-be65474c10df	e27b00b1-5e97-4c07-bb7e-af4f1806a975	f
acb05ca4-09b1-4c16-9ff1-be65474c10df	6261e3f8-7435-4643-90e9-f98ee7ebcaa5	f
acb05ca4-09b1-4c16-9ff1-be65474c10df	6140188c-b6e6-4c6c-915d-7ab860175127	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
e27b00b1-5e97-4c07-bb7e-af4f1806a975	6d4a7b30-de64-492f-9cfb-d9fffa05ca36
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
2a13b5c3-c77b-462f-84f8-da1a2e3776f6	Trusted Hosts	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	anonymous
45e0d75a-5d02-45ef-813e-31d8d5b7f639	Consent Required	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	anonymous
3617376a-9691-4218-9117-9af75c47ae99	Full Scope Disabled	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	anonymous
746468e9-a379-4ffb-8c69-a6d1f08f40df	Max Clients Limit	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	anonymous
ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	Allowed Protocol Mapper Types	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	anonymous
efce85bc-16c0-471d-aef9-b4f78c8657cd	Allowed Client Scopes	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	anonymous
387d621d-573d-47e0-829c-a3d606204207	Allowed Protocol Mapper Types	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	authenticated
c6eb1945-3bb6-4a9a-a4dd-514380c1e8ee	Allowed Client Scopes	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	authenticated
765912ff-7c06-432c-9a53-086f824b92fe	rsa-generated	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	rsa-generated	org.keycloak.keys.KeyProvider	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N
8fd6a14f-d038-481f-999b-ccca35103d20	rsa-enc-generated	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	rsa-enc-generated	org.keycloak.keys.KeyProvider	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N
5af33b72-c0a5-45be-a4db-1fbbd7d97b70	hmac-generated-hs512	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	hmac-generated	org.keycloak.keys.KeyProvider	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N
fab246fb-22c1-4260-b504-8b3a27f620ef	aes-generated	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	aes-generated	org.keycloak.keys.KeyProvider	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N
cdadbe14-3f84-4c40-95cf-5daff50f096c	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
b4b14048-abcc-4a1e-8265-fb1534e8f3b2	2a13b5c3-c77b-462f-84f8-da1a2e3776f6	host-sending-registration-request-must-match	true
c2e315ac-ff89-4280-987b-c711f4979a85	2a13b5c3-c77b-462f-84f8-da1a2e3776f6	client-uris-must-match	true
b8ab738f-2e72-42c3-88cd-1ab9ea20edce	efce85bc-16c0-471d-aef9-b4f78c8657cd	allow-default-scopes	true
e5cbf169-d6ab-40d0-a414-8e6c8fa56be3	c6eb1945-3bb6-4a9a-a4dd-514380c1e8ee	allow-default-scopes	true
cf9c4458-bd95-4d07-b775-e59bc9bb7e80	746468e9-a379-4ffb-8c69-a6d1f08f40df	max-clients	200
f104ef5e-5226-4ad3-a6f0-ee82bd965bc8	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	saml-user-property-mapper
51a3ec92-0b16-4acb-8895-bfed04ba983a	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	oidc-full-name-mapper
28061f0c-a405-4cdd-9458-dd87cdaace78	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d364a404-fcab-4c40-96c8-cb642c69dc30	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	oidc-address-mapper
272e81ff-ba2f-4b84-bc9b-5270d86f4661	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	saml-user-attribute-mapper
44e74957-ea3e-4240-98b9-bb1d722c709a	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
74a1a672-03eb-45b9-99c1-194af8e973ab	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
361f9313-5efa-435a-9723-9336cd2af7dd	387d621d-573d-47e0-829c-a3d606204207	allowed-protocol-mapper-types	saml-role-list-mapper
47cf0eef-07f8-4cc2-bf24-c80ec13271f2	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	oidc-full-name-mapper
cfdade3d-c1c7-4cad-ba0e-d011ed9530aa	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	saml-user-attribute-mapper
f0d3000c-352e-4ed8-99bc-9e516caa8635	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
add55311-b0f0-49c6-87a0-3a87336c0a49	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	oidc-address-mapper
9b0837b2-f776-4a79-9357-307062cc2d26	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b673e7fe-6b61-45ef-8928-89228a7200ed	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
dc024f58-4146-4d11-90c6-410e17cc175b	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	saml-role-list-mapper
ecf2b535-da4b-4677-aa17-04c0d83e9ae7	ce45eec4-9c8b-4d53-8fb9-ca4f1909d92d	allowed-protocol-mapper-types	saml-user-property-mapper
872b4833-1b1e-4479-b656-81fd8d62b152	765912ff-7c06-432c-9a53-086f824b92fe	privateKey	MIIEowIBAAKCAQEAl+E8l/opo7BQSjwYFxE7/i0MFdr/lyp3Utw/maiCrnEuqU6M8KTvkUmqn1QBwzCNXo6w0YpNLDd8zbg2yfulPyqNYo/WrBJ0IWSB3ejNiF1RgxqOpB3Z8kqkBu5XISycRhwuQac2K9oA5TGnIedIExvA3Zh9GQJca6QFGKvp1VufEsUmrkMXxhN9x7yxx9QcfMFB/lKChCBNo7jZ5oGoAquTjfsvwPRnFfIQ3SWNG7F5NOB3T831egObZeq+3c+Paqx0DAUi3QVBOUE6p6+sRksbvYA/zcSkiNyWF+Qt6UBmxnsGJ7055m79EQkUhc6Qp1vUH9M2WHhbU8FV+zAIrwIDAQABAoIBAAV5DZihhPLiogRRpcG5Uov2V063cxczimaisNiV63njKVltWDFiAmrU2JdE6GY1NBwOUIkaKf++5UNnVYWEUgcP9Z7fdXNL5TjS0jPB4xvX1rkZ+uK5pKZ1v4ViIZDFv8EAt9Fr0zrmJyital1c0cFYzazJ8ubrqZLn+JZ4k2k5vHCaEHKxBWpqsc2TFsIyccXKogasko5awfiQxr3PBtHCSeNYiC2yzsZjB9Aoywo+QLgfMmJ2SHxYyz0ehYT844JkIW0LzqVvS0zxzty796dsohLBkKke0ST/7co8H8CRVXkYzJuFmwfejVAEa1+h/10fQRVYn5dsv2HtLMQj33kCgYEA04V2Oq9nOJTDHgrFRBEffJNvj+be2i+IXhW0Y5tJsFOOkcbSBDmmQunU1ry7Z34J3l95BEc1ui0qCYpu7FKKtsD++YgUnDH6mYITF7/dCPHxhteJSYzdh6wFYERG1mXQ2m0EbF3bCa+Am3mOL4bdKFlnpRP4/IjOYa9SBg6oef0CgYEAt9Es7LAbncdMydHGqGfj+ARYRBt5qBsnFaV5qIN9NwuVlrNW77o1m0UdQHiGyj6B8mHTRTNrLEHDNNOYpnJKyRmWhGBXwiuZDBH+gbbf1iSrD9C91cxBqXcHAe46nqC53IVCYgEFk3Wt8INE0kCIXasJFUozOx9Nj03OrXzORxsCgYAHwXYDUtkjDvlUiaqQA1y3MaS+jwWO1H1Yjc0udcwu5fFtUO/0bbS18WL3eLYaZlmwSKnkSUQkDnHjJatJiQFDEDKJLb8rtv1sUYOntEZDhLOJcS+8fajFx73uuLIsPFF7INIvswVMBp5dlQhsn7JOP3D4cZIImG+Qz1/fjvwIdQKBgQCvFT88JrX3P7kFVplpGKOMPd8w6Balp09AEABkIPIodxFBnIqHBo8+2ML3AJYqlwVBMCqC9Gn1mqHrdEwm5iATkhrK9dVBLjO1yoHnXZ+wofaJtuLKfKZiWuxCy33sT90YjZlgLeb4wJMvzmjD9xGsXlflfmpzuuouQAdHOeRk1wKBgA2/Se9F02teMiZOg7YHKMUlaOJVEqbaPlEyOdcY+nnPT9zxwsznp6MYyMsPCj3ICUMkHieoAnhCks6oIL721+8cJpE3URg5atQRwJc0Bx0EgbnrxyHrH8GtkRaNNuU9Vpd5GhDW+NMcvXUbSgijFfogBEXjnwZVxPgKrWuL/b83
afe4b992-90d4-421e-a106-c979e6986db7	765912ff-7c06-432c-9a53-086f824b92fe	keyUse	SIG
759e1c53-6893-4686-9970-76eddba45592	765912ff-7c06-432c-9a53-086f824b92fe	certificate	MIICmzCCAYMCBgGPNZ6bRTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTAxMTkyMzU3WhcNMzQwNTAxMTkyNTM3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCX4TyX+imjsFBKPBgXETv+LQwV2v+XKndS3D+ZqIKucS6pTozwpO+RSaqfVAHDMI1ejrDRik0sN3zNuDbJ+6U/Ko1ij9asEnQhZIHd6M2IXVGDGo6kHdnySqQG7lchLJxGHC5BpzYr2gDlMach50gTG8DdmH0ZAlxrpAUYq+nVW58SxSauQxfGE33HvLHH1Bx8wUH+UoKEIE2juNnmgagCq5ON+y/A9GcV8hDdJY0bsXk04HdPzfV6A5tl6r7dz49qrHQMBSLdBUE5QTqnr6xGSxu9gD/NxKSI3JYX5C3pQGbGewYnvTnmbv0RCRSFzpCnW9Qf0zZYeFtTwVX7MAivAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABFuAxARBV9fiM7wa5nrKAozku8p0LXRx/EX0FnyWm/rwHmMwaQFJYyr/f9fUUrKHcq1mBvUQUvfAC97pQfoR+36oz+IeaUNlQP4kTM6j9HZjNeKWOrmYgPlb2Qvq/9eyGFVOW269u74IB5B0HAA5ZH3ZbC3ACHpZkyCH5RHoSqE9QOU/Pn0rx5Zax+OyWx3IcQ/rM7slUAusDOx41waSpEAFSI1w6q1+kNZb7XLZ7O4Z1M8B3x1LE3xIsXs2TkFt/hXrGTgQCFbtuK/oVgUEigBav8tGr3HvQl1fdFlkXKOIowuJl+AER2pTgtIbJmwKJQhQ5uV4lxp253aF20U4lA=
15797269-335e-462c-93b6-5bc88c7c5c2e	765912ff-7c06-432c-9a53-086f824b92fe	priority	100
2a4483a0-6684-4410-8030-623e7be6311b	5af33b72-c0a5-45be-a4db-1fbbd7d97b70	secret	2ZyNwEFNQVE00hjO_PwJafygbaxexorahwYJWsmEADvmfr_Xz6HWsG7NsuBYVj2uUDP6EqkHlTK8b45HR-ue2Ws6BDWz9tnmYUmU5qyVegGEktoAq3dOk4Uf0Y44Xe6LIlud67_ko5_tyeCi6I04b3HDf4RlWgVJiYsoRJ62WKE
9e44e26c-4295-4cb4-bf4c-d82fc8f1a62b	5af33b72-c0a5-45be-a4db-1fbbd7d97b70	priority	100
76def110-5ff0-4506-9946-72b92d939fa0	5af33b72-c0a5-45be-a4db-1fbbd7d97b70	algorithm	HS512
1a6d63ad-673c-43a2-af10-87d9fa7e67d2	5af33b72-c0a5-45be-a4db-1fbbd7d97b70	kid	c7fe8e89-d0f4-4c08-a305-568d957db5b3
4aa7fe07-ba07-4afd-af76-8d927a19ba9c	cdadbe14-3f84-4c40-95cf-5daff50f096c	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
e514d4a3-6aff-40a6-8e02-409b3693032e	8fd6a14f-d038-481f-999b-ccca35103d20	priority	100
4e7f58a4-5aec-4e3b-8b65-f330ca0ac633	8fd6a14f-d038-481f-999b-ccca35103d20	privateKey	MIIEowIBAAKCAQEAtji3nQlT2yH4RNU5JSQ/5CRH+coXYpDHWsnXvwIZp8TuJU3e3ogBfdJMU81vkM7KGA1FECG5wni/ifmjl0okJQhARw1eZ0JKDRp2Uczq1Ct3x4CreMYcOlDHCuo/h89u32Bnf7ZtjiEQ6/yR5gZpCIJY7TzHjHR3juIpQMsNuyp/BcB3ddhvbc20YqL7hWpCFmYVoAoBJdlqMSGhPDUUAubP2WSr9phTdC8oVyxZ44lNWLPcO4XQFyWVDjlRGnKrKtvsBOGBHNol9TqHSNFbHeG++iQCR8YTRNzTHkhZ/5Z8xkG5AUG6WQsaz4dNR97Kg6SvLg9bRGHOQD+TDKOYiQIDAQABAoIBAETh79b3HbHqh3VNvQpjR5uwc1zjni9uV03kmx/jZVtcQEHty+AHPbkYdC4BrLjq0s6Axaixdw0ipBU+Py8DoeI12kaBsTwLfP6zECMf+W02+VJ7O1auXSFWQ8fGgTmPmnPqd3V5urRNn531nhl8Ntw2mfMkVLKtnDxxFfMeTxR++jbM2PPRPhiJkMdl0DUw4GP/b+wYaZO3gG/IljZd4+Tp4e06tFw7s5qgOuLQKDILt5wOctuWE875/P//v78eQMXX6tnw/ttvcjRrq8XRexe6gc8ZAQSXjfOndkihey0u2qIRKISR8ac/81MBwK7dH/o7nDf64wrQxApzdgfSJRkCgYEA6YrV1shoIUEwxlqYeERsNw9B6j3Tmh+YhfSU5Q3thtAcYS24VSklCkdmlTRA28f1Fx0T2aAwcb1XabQkJEvJpO4myqmXi28S4myP3f+hr2Bc1Us+glpfvova5mq2nl+ok4fVLpu350yKX/4uI7NzIfEb5x3IFQAr6Q7Rl4VYkwMCgYEAx76BubK6NfnGrxH/ET7KXBL8M12pj7dQ0vdonAi0xeZd/BpWaR/T4l/vhB8bPkQLpiVoWE/OpdOTjvdUMNlYUk+Mbh1aHOZnAF434C6oYFsbnr/Vus+yEbqgJoa5hL9XtN1VWKzQQTDRjUIYapyl3kV+HN0jI2eSzfN0d4lwyoMCgYEA1NIJ8EKMcdGAayFf1Ck2HC6xOI7C565nRZsOnHVGwRWg5wXM9v4ZnPZYCxulByN+u2NqFWWe/+c1Y0Qfs1vFE6FahFBro0rDAMdBi2JKqxC7SDvbaNqGaZP1FQimBkjRzC96G5EX05Wye6ubzDjZcFLRxJklHc4cNbOlV9jSUJUCgYAhx2LSz5nUBPCHrMhw1yiLl55U5XMGXd7qPnLPaF2B1ipwtteEIaDIeKbdthD6X7GEoHDb9msg+f3LQKJZPHhGOzOpb4dMud4TXtueKuXInb+3AgQX+oXHn8LzoPcArwcbDA8h1t/FFodplxLf/KvEQgZIxVDq7NoTwCcjC/gqFwKBgHt03op6yvSM0wshHG1peSqhlOJ5tUUNXakRDwbAY24ZSQoAa/D32Ty6icJO/gvbg1vEuwGBw6ELk2l4cjAFFIbiYblq31fFlqkDpQymw9wSKlFrhZuw34TlbzemVqW08h/87hLvvlzVhjNRwyXU0rRRO88YVet0m1hlaJTBcBq1
6ddb9087-5c57-4083-863f-aa383ebe255b	8fd6a14f-d038-481f-999b-ccca35103d20	keyUse	ENC
32d265cf-3e86-4fc3-ad82-d5a807bc3ad8	8fd6a14f-d038-481f-999b-ccca35103d20	certificate	MIICmzCCAYMCBgGPNZ6bnzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTAxMTkyMzU4WhcNMzQwNTAxMTkyNTM4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2OLedCVPbIfhE1TklJD/kJEf5yhdikMdayde/AhmnxO4lTd7eiAF90kxTzW+QzsoYDUUQIbnCeL+J+aOXSiQlCEBHDV5nQkoNGnZRzOrUK3fHgKt4xhw6UMcK6j+Hz27fYGd/tm2OIRDr/JHmBmkIgljtPMeMdHeO4ilAyw27Kn8FwHd12G9tzbRiovuFakIWZhWgCgEl2WoxIaE8NRQC5s/ZZKv2mFN0LyhXLFnjiU1Ys9w7hdAXJZUOOVEacqsq2+wE4YEc2iX1OodI0Vsd4b76JAJHxhNE3NMeSFn/lnzGQbkBQbpZCxrPh01H3sqDpK8uD1tEYc5AP5MMo5iJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG+MxvVt1UFeuWuRgoiRFWEnOR72POGQhRygLyaPoGHG+ZZvryFHt/fkp3mRk8w/jDssYPckRntdyrubxsSSZwH9ZJphwLLMWhUFiMW3eNYmPC08kOMTCJuNsZMo3ByREEbesSrCezWPKSTfO43Q9a1ER1cOO9BnSjTBPCB/bL4b/l7lWKtEkrzCon3ATmNBkmOUwmsmnaVyTluv64dewo/ky/WBY8icRYkIIAEuLg5v+2+Ee0IZEyRUn+CdA5PV4OJ990/AbHe3xDxOTYhU7ysyIlI8raaSd9mljGV3yzBf1ISCBxxxKpi/mb2mzghaglmHqrpnM/gzXlo47u3fawo=
e20bc54d-58a1-43ce-9816-8d9ff0131103	8fd6a14f-d038-481f-999b-ccca35103d20	algorithm	RSA-OAEP
54561331-7fce-454e-9e35-a2175ba13a38	fab246fb-22c1-4260-b504-8b3a27f620ef	kid	a8c3c7c0-554c-4dec-ab26-644a7dda25dc
d3cd3c43-2041-4c32-973d-63fc7c0fdedd	fab246fb-22c1-4260-b504-8b3a27f620ef	priority	100
2b5ab05e-df4d-4c57-a4df-5c3f25909161	fab246fb-22c1-4260-b504-8b3a27f620ef	secret	Nvc6aV1RMwznHw-U3yNNdw
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
45c47adb-8835-416d-ad37-255379c4d94b	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f	${role_default-roles}	default-roles-master	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N	\N
4881e1b4-9ed6-4493-9234-414c56ab8701	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f	${role_admin}	admin	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N	\N
900150b8-4d98-4361-97e1-743fbe8d7733	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f	${role_create-realm}	create-realm	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N	\N
63636be4-5847-42f4-a286-83424657033a	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_create-client}	create-client	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
f90651ef-be3e-4bdc-b3dd-373036ef02f4	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_view-realm}	view-realm	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
cbc30d86-26e0-4e74-be9b-2030c2376e5f	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_view-users}	view-users	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
acf0b0e3-c9a3-4fad-83da-34fd52d61fec	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_view-clients}	view-clients	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
238c2997-ea7f-4d5b-8a81-18b5351aaeda	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_view-events}	view-events	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
97b73d58-ceb9-4b04-93a8-114bb8c8aa81	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_view-identity-providers}	view-identity-providers	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
9d35d304-89fe-4204-a4e8-63ed6ea9d5d4	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_view-authorization}	view-authorization	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
31dfb0b4-feff-4cbf-9152-eded5aa30d64	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_manage-realm}	manage-realm	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
403467aa-35ad-43c5-a15b-204d80574470	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_manage-users}	manage-users	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
b806b45d-f57a-4515-a9ae-dc1f80fd7b96	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_manage-clients}	manage-clients	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
a22500e3-1433-4ec4-ac3d-a1bf63416971	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_manage-events}	manage-events	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
26dd9656-f75a-4bc6-a9a9-93a9dc30bd92	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_manage-identity-providers}	manage-identity-providers	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
4895af64-269e-443d-b778-f10ddda3278f	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_manage-authorization}	manage-authorization	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
75071786-1a96-44cd-b45e-6a09a84e3e40	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_query-users}	query-users	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
5548c387-0e02-4b2d-b2e5-9a42b7abcff3	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_query-clients}	query-clients	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
eff038e7-5a27-4c06-858c-538a3649cc8b	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_query-realms}	query-realms	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
728b53a4-a4c3-4e6f-ba40-84173eef74d8	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_query-groups}	query-groups	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
81ef704d-7f3f-4104-bc77-7ac82b9202ce	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_view-profile}	view-profile	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
5b8874ff-199a-47f8-8050-eb1d386b1052	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_manage-account}	manage-account	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
ca3a7555-2860-4851-b688-a90ba0e06fa9	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_manage-account-links}	manage-account-links	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
f84bf67a-3070-4972-bb3c-c53c80122616	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_view-applications}	view-applications	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
d7c484d6-6309-43ec-bc61-3bb877dab0cc	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_view-consent}	view-consent	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
4d1d3a52-2643-4bf2-8b83-8549412eb30c	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_manage-consent}	manage-consent	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
5879482a-a869-4a8b-a5ff-d872c58aefe6	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_view-groups}	view-groups	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
54c2de90-2126-43ae-a7f9-bca5a128c552	ef185f42-ba9b-415a-babc-c20a04e9c7b1	t	${role_delete-account}	delete-account	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ef185f42-ba9b-415a-babc-c20a04e9c7b1	\N
8b09b929-2287-4a97-add0-d10c6fa4c44b	b6a57285-224c-4f9e-843c-8bbf73995434	t	${role_read-token}	read-token	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	b6a57285-224c-4f9e-843c-8bbf73995434	\N
8a30e362-3264-4da6-a8cb-28db1b6f3245	e9e8024f-b41d-43e0-95d6-8e98557ede41	t	${role_impersonation}	impersonation	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e9e8024f-b41d-43e0-95d6-8e98557ede41	\N
6d4a7b30-de64-492f-9cfb-d9fffa05ca36	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f	${role_offline-access}	offline_access	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N	\N
2a6e9658-1f02-4936-bcc5-d2034748d7d2	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f	${role_uma_authorization}	uma_authorization	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	\N	\N
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
4881e1b4-9ed6-4493-9234-414c56ab8701	900150b8-4d98-4361-97e1-743fbe8d7733
4881e1b4-9ed6-4493-9234-414c56ab8701	63636be4-5847-42f4-a286-83424657033a
4881e1b4-9ed6-4493-9234-414c56ab8701	f90651ef-be3e-4bdc-b3dd-373036ef02f4
4881e1b4-9ed6-4493-9234-414c56ab8701	cbc30d86-26e0-4e74-be9b-2030c2376e5f
4881e1b4-9ed6-4493-9234-414c56ab8701	acf0b0e3-c9a3-4fad-83da-34fd52d61fec
4881e1b4-9ed6-4493-9234-414c56ab8701	238c2997-ea7f-4d5b-8a81-18b5351aaeda
4881e1b4-9ed6-4493-9234-414c56ab8701	97b73d58-ceb9-4b04-93a8-114bb8c8aa81
4881e1b4-9ed6-4493-9234-414c56ab8701	9d35d304-89fe-4204-a4e8-63ed6ea9d5d4
4881e1b4-9ed6-4493-9234-414c56ab8701	31dfb0b4-feff-4cbf-9152-eded5aa30d64
4881e1b4-9ed6-4493-9234-414c56ab8701	403467aa-35ad-43c5-a15b-204d80574470
4881e1b4-9ed6-4493-9234-414c56ab8701	b806b45d-f57a-4515-a9ae-dc1f80fd7b96
4881e1b4-9ed6-4493-9234-414c56ab8701	a22500e3-1433-4ec4-ac3d-a1bf63416971
4881e1b4-9ed6-4493-9234-414c56ab8701	26dd9656-f75a-4bc6-a9a9-93a9dc30bd92
4881e1b4-9ed6-4493-9234-414c56ab8701	4895af64-269e-443d-b778-f10ddda3278f
4881e1b4-9ed6-4493-9234-414c56ab8701	75071786-1a96-44cd-b45e-6a09a84e3e40
4881e1b4-9ed6-4493-9234-414c56ab8701	5548c387-0e02-4b2d-b2e5-9a42b7abcff3
4881e1b4-9ed6-4493-9234-414c56ab8701	eff038e7-5a27-4c06-858c-538a3649cc8b
4881e1b4-9ed6-4493-9234-414c56ab8701	728b53a4-a4c3-4e6f-ba40-84173eef74d8
45c47adb-8835-416d-ad37-255379c4d94b	81ef704d-7f3f-4104-bc77-7ac82b9202ce
acf0b0e3-c9a3-4fad-83da-34fd52d61fec	5548c387-0e02-4b2d-b2e5-9a42b7abcff3
cbc30d86-26e0-4e74-be9b-2030c2376e5f	75071786-1a96-44cd-b45e-6a09a84e3e40
cbc30d86-26e0-4e74-be9b-2030c2376e5f	728b53a4-a4c3-4e6f-ba40-84173eef74d8
45c47adb-8835-416d-ad37-255379c4d94b	5b8874ff-199a-47f8-8050-eb1d386b1052
5b8874ff-199a-47f8-8050-eb1d386b1052	ca3a7555-2860-4851-b688-a90ba0e06fa9
4d1d3a52-2643-4bf2-8b83-8549412eb30c	d7c484d6-6309-43ec-bc61-3bb877dab0cc
4881e1b4-9ed6-4493-9234-414c56ab8701	8a30e362-3264-4da6-a8cb-28db1b6f3245
45c47adb-8835-416d-ad37-255379c4d94b	6d4a7b30-de64-492f-9cfb-d9fffa05ca36
45c47adb-8835-416d-ad37-255379c4d94b	2a6e9658-1f02-4936-bcc5-d2034748d7d2
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
f1d149c5-36a4-48e0-8bed-0e7d60f4c194	admin@example.com	admin@example.com	f	t	\N	\N	\N	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	admin	1714591538356	\N	0
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
d2874a70-3751-4372-86a6-b925a3763233	\N	password	f1d149c5-36a4-48e0-8bed-0e7d60f4c194	1714591538626	\N	{"value":"ib820mjK2dKOJMG7qI/0K0/ROeCWHmpqcft3HioS0MJJYfyGF7eZMhQhBVYoV9M7zURKJULYBQ1qKXuEiPkMGQ==","salt":"DhdJqLpbOL9JI6kDcftqMQ==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-05-01 19:25:36.550307	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	4591536352
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-05-01 19:25:36.557417	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	4591536352
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-05-01 19:25:36.581587	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.25.1	\N	\N	4591536352
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-05-01 19:25:36.583691	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	4591536352
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-05-01 19:25:36.622731	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	4591536352
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-05-01 19:25:36.62539	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	4591536352
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-05-01 19:25:36.660567	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	4591536352
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-05-01 19:25:36.662734	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	4591536352
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-05-01 19:25:36.665496	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.25.1	\N	\N	4591536352
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-05-01 19:25:36.701392	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.25.1	\N	\N	4591536352
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-05-01 19:25:36.72586	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	4591536352
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-05-01 19:25:36.727783	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	4591536352
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-05-01 19:25:36.736322	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	4591536352
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:25:36.745181	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.25.1	\N	\N	4591536352
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:25:36.746018	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4591536352
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:25:36.747305	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.25.1	\N	\N	4591536352
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:25:36.748593	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.25.1	\N	\N	4591536352
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-05-01 19:25:36.767948	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.25.1	\N	\N	4591536352
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-05-01 19:25:36.787914	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	4591536352
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-05-01 19:25:36.789947	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	4591536352
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:25:37.164201	119	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.25.1	\N	\N	4591536352
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-05-01 19:25:36.791262	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	4591536352
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-05-01 19:25:36.792814	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	4591536352
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-05-01 19:25:36.804873	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.25.1	\N	\N	4591536352
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-05-01 19:25:36.807701	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	4591536352
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-05-01 19:25:36.808475	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	4591536352
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-05-01 19:25:36.819271	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.25.1	\N	\N	4591536352
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-05-01 19:25:36.846836	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.25.1	\N	\N	4591536352
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-05-01 19:25:36.849093	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	4591536352
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-05-01 19:25:36.870438	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.25.1	\N	\N	4591536352
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-05-01 19:25:36.875241	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.25.1	\N	\N	4591536352
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-05-01 19:25:36.882205	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.25.1	\N	\N	4591536352
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-05-01 19:25:36.885024	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.25.1	\N	\N	4591536352
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:25:36.888033	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4591536352
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:25:36.888875	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	4591536352
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:25:36.899057	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	4591536352
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:25:36.900797	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.25.1	\N	\N	4591536352
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:25:36.903126	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4591536352
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-05-01 19:25:36.904651	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.25.1	\N	\N	4591536352
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-05-01 19:25:36.906384	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.25.1	\N	\N	4591536352
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:25:36.906992	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	4591536352
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:25:36.907892	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	4591536352
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:25:36.910838	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.25.1	\N	\N	4591536352
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:25:36.944734	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.25.1	\N	\N	4591536352
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-05-01 19:25:36.94657	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.25.1	\N	\N	4591536352
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:25:36.948254	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	4591536352
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:25:36.950981	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.25.1	\N	\N	4591536352
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:25:36.951854	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	4591536352
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:25:36.964351	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.25.1	\N	\N	4591536352
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:25:36.96582	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.25.1	\N	\N	4591536352
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-05-01 19:25:36.979166	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.25.1	\N	\N	4591536352
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-05-01 19:25:36.988624	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.25.1	\N	\N	4591536352
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-05-01 19:25:36.989849	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-05-01 19:25:36.99087	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.25.1	\N	\N	4591536352
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-05-01 19:25:36.991885	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.25.1	\N	\N	4591536352
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:25:36.99381	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.25.1	\N	\N	4591536352
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:25:36.995356	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.25.1	\N	\N	4591536352
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:25:37.001749	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.25.1	\N	\N	4591536352
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:25:37.029725	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.25.1	\N	\N	4591536352
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-05-01 19:25:37.037074	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.25.1	\N	\N	4591536352
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-05-01 19:25:37.039035	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	4591536352
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-05-01 19:25:37.043098	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.25.1	\N	\N	4591536352
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-05-01 19:25:37.044967	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.25.1	\N	\N	4591536352
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-05-01 19:25:37.046223	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	4591536352
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-05-01 19:25:37.047308	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	4591536352
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-05-01 19:25:37.048364	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.25.1	\N	\N	4591536352
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-05-01 19:25:37.05234	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.25.1	\N	\N	4591536352
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-05-01 19:25:37.054075	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.25.1	\N	\N	4591536352
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-05-01 19:25:37.055852	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.25.1	\N	\N	4591536352
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-05-01 19:25:37.060706	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.25.1	\N	\N	4591536352
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-05-01 19:25:37.06285	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.25.1	\N	\N	4591536352
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-05-01 19:25:37.064461	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	4591536352
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:25:37.066632	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	4591536352
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:25:37.068994	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	4591536352
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:25:37.069684	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	4591536352
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:25:37.075416	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.25.1	\N	\N	4591536352
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:25:37.077797	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.25.1	\N	\N	4591536352
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:25:37.079063	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.25.1	\N	\N	4591536352
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:25:37.079527	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.25.1	\N	\N	4591536352
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:25:37.085485	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.25.1	\N	\N	4591536352
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:25:37.086161	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.25.1	\N	\N	4591536352
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:25:37.088136	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.25.1	\N	\N	4591536352
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:25:37.088657	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4591536352
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:25:37.090193	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4591536352
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:25:37.090611	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4591536352
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:25:37.092229	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	4591536352
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-05-01 19:25:37.093997	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.25.1	\N	\N	4591536352
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-05-01 19:25:37.096173	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.25.1	\N	\N	4591536352
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-05-01 19:25:37.098739	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.25.1	\N	\N	4591536352
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.101742	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.25.1	\N	\N	4591536352
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.103757	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.25.1	\N	\N	4591536352
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.105507	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4591536352
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.107734	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.25.1	\N	\N	4591536352
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.108212	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	4591536352
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.11076	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	4591536352
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.111371	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.25.1	\N	\N	4591536352
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:25:37.113418	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.25.1	\N	\N	4591536352
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:25:37.116461	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4591536352
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:25:37.116987	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:25:37.12208	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:25:37.124433	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:25:37.125047	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:25:37.127027	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.25.1	\N	\N	4591536352
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:25:37.129844	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.25.1	\N	\N	4591536352
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-05-01 19:25:37.132123	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.25.1	\N	\N	4591536352
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-05-01 19:25:37.133954	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.25.1	\N	\N	4591536352
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-05-01 19:25:37.135725	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.25.1	\N	\N	4591536352
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-05-01 19:25:37.138172	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.25.1	\N	\N	4591536352
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-01 19:25:37.140062	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	4591536352
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-01 19:25:37.140604	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	4591536352
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-01 19:25:37.142405	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-05-01 19:25:37.144558	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.25.1	\N	\N	4591536352
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-05-01 19:25:37.150789	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	4591536352
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-05-01 19:25:37.151512	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.25.1	\N	\N	4591536352
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-05-01 19:25:37.15403	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.25.1	\N	\N	4591536352
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-05-01 19:25:37.154622	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.25.1	\N	\N	4591536352
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-05-01 19:25:37.156589	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.25.1	\N	\N	4591536352
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-05-01 19:25:37.157553	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	4591536352
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:25:37.161917	118	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.25.1	\N	\N	4591536352
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:25:37.166353	120	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:25:37.16834	121	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-01 19:25:37.17033	122	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.25.1	\N	\N	4591536352
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-01 19:25:37.170745	123	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-01 19:25:37.171337	124	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4591536352
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	e27b00b1-5e97-4c07-bb7e-af4f1806a975	f
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	1ee040f3-009b-4365-bd1a-458fbb30a7f2	t
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f3a68324-a46e-4065-8584-bd450e3b7f0b	t
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	69634309-a0bb-4254-bcc4-f2914405e2b7	t
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	6140188c-b6e6-4c6c-915d-7ab860175127	f
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	57371052-85c8-4a66-bdd3-451d0f29f6a0	f
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	fec51e78-0db2-4c5e-b391-b443effb761d	t
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	47ce0c40-f57b-449b-98af-ce8585403016	t
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	6261e3f8-7435-4643-90e9-f98ee7ebcaa5	f
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0d19a96c-371d-457f-a996-09edac1ca837	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
gn5en	24.0.3	1714591537
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
05cf7fb0-51f7-456f-9182-25e1cd453980	audience resolve	openid-connect	oidc-audience-resolve-mapper	6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	\N
4aa1b39c-33f2-4319-8d0c-02fb2f229663	locale	openid-connect	oidc-usermodel-attribute-mapper	acb05ca4-09b1-4c16-9ff1-be65474c10df	\N
dd2250f6-c03f-4298-84f2-5c42ef555e06	role list	saml	saml-role-list-mapper	\N	1ee040f3-009b-4365-bd1a-458fbb30a7f2
85f6b377-1948-4e74-91ee-ce61128375cb	full name	openid-connect	oidc-full-name-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
a6183a21-43b9-4822-9b1f-048a6ba428f2	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
effbf15b-914a-468d-8108-b18cc73eb257	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
483c4f81-c896-4d5c-86e5-ffb09d06171d	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	username	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
fa95b9e8-7ed7-4037-848b-94cf24740130	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
e95abf00-282b-493a-88d4-3f6c44ef1087	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	website	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
734fc129-13eb-40a0-b517-bfad14ac8023	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
0f837908-aaf4-42de-b734-a1f3cf4339e5	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	f3a68324-a46e-4065-8584-bd450e3b7f0b
b6783221-2185-4dfd-8490-f488cf20a9ad	email	openid-connect	oidc-usermodel-attribute-mapper	\N	69634309-a0bb-4254-bcc4-f2914405e2b7
c4a65faf-ebe5-47a1-895e-567d3781990e	email verified	openid-connect	oidc-usermodel-property-mapper	\N	69634309-a0bb-4254-bcc4-f2914405e2b7
641c008f-666f-4b16-ae50-d75cfd7d13b8	address	openid-connect	oidc-address-mapper	\N	6140188c-b6e6-4c6c-915d-7ab860175127
63ab6eaa-898d-4eb8-814d-7d6b33b599da	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	57371052-85c8-4a66-bdd3-451d0f29f6a0
851c3a66-f729-469c-8cb6-7fcf2c19e05a	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	57371052-85c8-4a66-bdd3-451d0f29f6a0
af93450e-8194-41c0-a0a7-b0d6301c9788	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	fec51e78-0db2-4c5e-b391-b443effb761d
1ae4312a-9fc6-49eb-ab56-8b20accb0d49	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	fec51e78-0db2-4c5e-b391-b443effb761d
a154e0aa-653d-46d3-87ec-086e60d58a64	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	fec51e78-0db2-4c5e-b391-b443effb761d
2ef07a86-a7d1-4dc7-adc5-650aa9416e7d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	47ce0c40-f57b-449b-98af-ce8585403016
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	6261e3f8-7435-4643-90e9-f98ee7ebcaa5
b8e0e0f3-048d-4418-89a6-b769d606c7e5	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	6261e3f8-7435-4643-90e9-f98ee7ebcaa5
6db9cdda-1581-4e5f-879b-40d117b99a7f	acr loa level	openid-connect	oidc-acr-mapper	\N	0d19a96c-371d-457f-a996-09edac1ca837
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
4aa1b39c-33f2-4319-8d0c-02fb2f229663	true	introspection.token.claim
4aa1b39c-33f2-4319-8d0c-02fb2f229663	true	userinfo.token.claim
4aa1b39c-33f2-4319-8d0c-02fb2f229663	locale	user.attribute
4aa1b39c-33f2-4319-8d0c-02fb2f229663	true	id.token.claim
4aa1b39c-33f2-4319-8d0c-02fb2f229663	true	access.token.claim
4aa1b39c-33f2-4319-8d0c-02fb2f229663	locale	claim.name
4aa1b39c-33f2-4319-8d0c-02fb2f229663	String	jsonType.label
dd2250f6-c03f-4298-84f2-5c42ef555e06	false	single
dd2250f6-c03f-4298-84f2-5c42ef555e06	Basic	attribute.nameformat
dd2250f6-c03f-4298-84f2-5c42ef555e06	Role	attribute.name
0f837908-aaf4-42de-b734-a1f3cf4339e5	true	introspection.token.claim
0f837908-aaf4-42de-b734-a1f3cf4339e5	true	userinfo.token.claim
0f837908-aaf4-42de-b734-a1f3cf4339e5	updatedAt	user.attribute
0f837908-aaf4-42de-b734-a1f3cf4339e5	true	id.token.claim
0f837908-aaf4-42de-b734-a1f3cf4339e5	true	access.token.claim
0f837908-aaf4-42de-b734-a1f3cf4339e5	updated_at	claim.name
0f837908-aaf4-42de-b734-a1f3cf4339e5	long	jsonType.label
483c4f81-c896-4d5c-86e5-ffb09d06171d	true	introspection.token.claim
483c4f81-c896-4d5c-86e5-ffb09d06171d	true	userinfo.token.claim
483c4f81-c896-4d5c-86e5-ffb09d06171d	middleName	user.attribute
483c4f81-c896-4d5c-86e5-ffb09d06171d	true	id.token.claim
483c4f81-c896-4d5c-86e5-ffb09d06171d	true	access.token.claim
483c4f81-c896-4d5c-86e5-ffb09d06171d	middle_name	claim.name
483c4f81-c896-4d5c-86e5-ffb09d06171d	String	jsonType.label
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	true	introspection.token.claim
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	true	userinfo.token.claim
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	zoneinfo	user.attribute
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	true	id.token.claim
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	true	access.token.claim
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	zoneinfo	claim.name
4d7a1dff-a88e-400a-b9cb-1a0b99963ddb	String	jsonType.label
734fc129-13eb-40a0-b517-bfad14ac8023	true	introspection.token.claim
734fc129-13eb-40a0-b517-bfad14ac8023	true	userinfo.token.claim
734fc129-13eb-40a0-b517-bfad14ac8023	birthdate	user.attribute
734fc129-13eb-40a0-b517-bfad14ac8023	true	id.token.claim
734fc129-13eb-40a0-b517-bfad14ac8023	true	access.token.claim
734fc129-13eb-40a0-b517-bfad14ac8023	birthdate	claim.name
734fc129-13eb-40a0-b517-bfad14ac8023	String	jsonType.label
85f6b377-1948-4e74-91ee-ce61128375cb	true	introspection.token.claim
85f6b377-1948-4e74-91ee-ce61128375cb	true	userinfo.token.claim
85f6b377-1948-4e74-91ee-ce61128375cb	true	id.token.claim
85f6b377-1948-4e74-91ee-ce61128375cb	true	access.token.claim
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	true	introspection.token.claim
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	true	userinfo.token.claim
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	locale	user.attribute
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	true	id.token.claim
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	true	access.token.claim
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	locale	claim.name
87afbd6c-4f4b-4999-9136-a5d0a0f5a1ae	String	jsonType.label
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	true	introspection.token.claim
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	true	userinfo.token.claim
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	nickname	user.attribute
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	true	id.token.claim
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	true	access.token.claim
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	nickname	claim.name
a2afc5a4-05c6-4eb3-a669-a116cb9d8854	String	jsonType.label
a6183a21-43b9-4822-9b1f-048a6ba428f2	true	introspection.token.claim
a6183a21-43b9-4822-9b1f-048a6ba428f2	true	userinfo.token.claim
a6183a21-43b9-4822-9b1f-048a6ba428f2	lastName	user.attribute
a6183a21-43b9-4822-9b1f-048a6ba428f2	true	id.token.claim
a6183a21-43b9-4822-9b1f-048a6ba428f2	true	access.token.claim
a6183a21-43b9-4822-9b1f-048a6ba428f2	family_name	claim.name
a6183a21-43b9-4822-9b1f-048a6ba428f2	String	jsonType.label
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	true	introspection.token.claim
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	true	userinfo.token.claim
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	username	user.attribute
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	true	id.token.claim
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	true	access.token.claim
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	preferred_username	claim.name
aa4081d9-3577-41d4-a0ad-ce1ecb3e583d	String	jsonType.label
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	true	introspection.token.claim
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	true	userinfo.token.claim
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	website	user.attribute
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	true	id.token.claim
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	true	access.token.claim
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	website	claim.name
c628ebf0-91b9-49c5-bee4-0c5d3865dd98	String	jsonType.label
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	true	introspection.token.claim
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	true	userinfo.token.claim
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	gender	user.attribute
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	true	id.token.claim
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	true	access.token.claim
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	gender	claim.name
d8ba561d-8f0c-40d8-a47f-2aa2b65ae9f5	String	jsonType.label
e95abf00-282b-493a-88d4-3f6c44ef1087	true	introspection.token.claim
e95abf00-282b-493a-88d4-3f6c44ef1087	true	userinfo.token.claim
e95abf00-282b-493a-88d4-3f6c44ef1087	picture	user.attribute
e95abf00-282b-493a-88d4-3f6c44ef1087	true	id.token.claim
e95abf00-282b-493a-88d4-3f6c44ef1087	true	access.token.claim
e95abf00-282b-493a-88d4-3f6c44ef1087	picture	claim.name
e95abf00-282b-493a-88d4-3f6c44ef1087	String	jsonType.label
effbf15b-914a-468d-8108-b18cc73eb257	true	introspection.token.claim
effbf15b-914a-468d-8108-b18cc73eb257	true	userinfo.token.claim
effbf15b-914a-468d-8108-b18cc73eb257	firstName	user.attribute
effbf15b-914a-468d-8108-b18cc73eb257	true	id.token.claim
effbf15b-914a-468d-8108-b18cc73eb257	true	access.token.claim
effbf15b-914a-468d-8108-b18cc73eb257	given_name	claim.name
effbf15b-914a-468d-8108-b18cc73eb257	String	jsonType.label
fa95b9e8-7ed7-4037-848b-94cf24740130	true	introspection.token.claim
fa95b9e8-7ed7-4037-848b-94cf24740130	true	userinfo.token.claim
fa95b9e8-7ed7-4037-848b-94cf24740130	profile	user.attribute
fa95b9e8-7ed7-4037-848b-94cf24740130	true	id.token.claim
fa95b9e8-7ed7-4037-848b-94cf24740130	true	access.token.claim
fa95b9e8-7ed7-4037-848b-94cf24740130	profile	claim.name
fa95b9e8-7ed7-4037-848b-94cf24740130	String	jsonType.label
b6783221-2185-4dfd-8490-f488cf20a9ad	true	introspection.token.claim
b6783221-2185-4dfd-8490-f488cf20a9ad	true	userinfo.token.claim
b6783221-2185-4dfd-8490-f488cf20a9ad	email	user.attribute
b6783221-2185-4dfd-8490-f488cf20a9ad	true	id.token.claim
b6783221-2185-4dfd-8490-f488cf20a9ad	true	access.token.claim
b6783221-2185-4dfd-8490-f488cf20a9ad	email	claim.name
b6783221-2185-4dfd-8490-f488cf20a9ad	String	jsonType.label
c4a65faf-ebe5-47a1-895e-567d3781990e	true	introspection.token.claim
c4a65faf-ebe5-47a1-895e-567d3781990e	true	userinfo.token.claim
c4a65faf-ebe5-47a1-895e-567d3781990e	emailVerified	user.attribute
c4a65faf-ebe5-47a1-895e-567d3781990e	true	id.token.claim
c4a65faf-ebe5-47a1-895e-567d3781990e	true	access.token.claim
c4a65faf-ebe5-47a1-895e-567d3781990e	email_verified	claim.name
c4a65faf-ebe5-47a1-895e-567d3781990e	boolean	jsonType.label
641c008f-666f-4b16-ae50-d75cfd7d13b8	formatted	user.attribute.formatted
641c008f-666f-4b16-ae50-d75cfd7d13b8	country	user.attribute.country
641c008f-666f-4b16-ae50-d75cfd7d13b8	true	introspection.token.claim
641c008f-666f-4b16-ae50-d75cfd7d13b8	postal_code	user.attribute.postal_code
641c008f-666f-4b16-ae50-d75cfd7d13b8	true	userinfo.token.claim
641c008f-666f-4b16-ae50-d75cfd7d13b8	street	user.attribute.street
641c008f-666f-4b16-ae50-d75cfd7d13b8	true	id.token.claim
641c008f-666f-4b16-ae50-d75cfd7d13b8	region	user.attribute.region
641c008f-666f-4b16-ae50-d75cfd7d13b8	true	access.token.claim
641c008f-666f-4b16-ae50-d75cfd7d13b8	locality	user.attribute.locality
63ab6eaa-898d-4eb8-814d-7d6b33b599da	true	introspection.token.claim
63ab6eaa-898d-4eb8-814d-7d6b33b599da	true	userinfo.token.claim
63ab6eaa-898d-4eb8-814d-7d6b33b599da	phoneNumber	user.attribute
63ab6eaa-898d-4eb8-814d-7d6b33b599da	true	id.token.claim
63ab6eaa-898d-4eb8-814d-7d6b33b599da	true	access.token.claim
63ab6eaa-898d-4eb8-814d-7d6b33b599da	phone_number	claim.name
63ab6eaa-898d-4eb8-814d-7d6b33b599da	String	jsonType.label
851c3a66-f729-469c-8cb6-7fcf2c19e05a	true	introspection.token.claim
851c3a66-f729-469c-8cb6-7fcf2c19e05a	true	userinfo.token.claim
851c3a66-f729-469c-8cb6-7fcf2c19e05a	phoneNumberVerified	user.attribute
851c3a66-f729-469c-8cb6-7fcf2c19e05a	true	id.token.claim
851c3a66-f729-469c-8cb6-7fcf2c19e05a	true	access.token.claim
851c3a66-f729-469c-8cb6-7fcf2c19e05a	phone_number_verified	claim.name
851c3a66-f729-469c-8cb6-7fcf2c19e05a	boolean	jsonType.label
1ae4312a-9fc6-49eb-ab56-8b20accb0d49	true	introspection.token.claim
1ae4312a-9fc6-49eb-ab56-8b20accb0d49	true	multivalued
1ae4312a-9fc6-49eb-ab56-8b20accb0d49	foo	user.attribute
1ae4312a-9fc6-49eb-ab56-8b20accb0d49	true	access.token.claim
1ae4312a-9fc6-49eb-ab56-8b20accb0d49	resource_access.${client_id}.roles	claim.name
1ae4312a-9fc6-49eb-ab56-8b20accb0d49	String	jsonType.label
a154e0aa-653d-46d3-87ec-086e60d58a64	true	introspection.token.claim
a154e0aa-653d-46d3-87ec-086e60d58a64	true	access.token.claim
af93450e-8194-41c0-a0a7-b0d6301c9788	true	introspection.token.claim
af93450e-8194-41c0-a0a7-b0d6301c9788	true	multivalued
af93450e-8194-41c0-a0a7-b0d6301c9788	foo	user.attribute
af93450e-8194-41c0-a0a7-b0d6301c9788	true	access.token.claim
af93450e-8194-41c0-a0a7-b0d6301c9788	realm_access.roles	claim.name
af93450e-8194-41c0-a0a7-b0d6301c9788	String	jsonType.label
2ef07a86-a7d1-4dc7-adc5-650aa9416e7d	true	introspection.token.claim
2ef07a86-a7d1-4dc7-adc5-650aa9416e7d	true	access.token.claim
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	true	introspection.token.claim
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	true	userinfo.token.claim
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	username	user.attribute
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	true	id.token.claim
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	true	access.token.claim
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	upn	claim.name
6b2ed901-a3e1-4e7b-9159-c3f4a6eef98c	String	jsonType.label
b8e0e0f3-048d-4418-89a6-b769d606c7e5	true	introspection.token.claim
b8e0e0f3-048d-4418-89a6-b769d606c7e5	true	multivalued
b8e0e0f3-048d-4418-89a6-b769d606c7e5	foo	user.attribute
b8e0e0f3-048d-4418-89a6-b769d606c7e5	true	id.token.claim
b8e0e0f3-048d-4418-89a6-b769d606c7e5	true	access.token.claim
b8e0e0f3-048d-4418-89a6-b769d606c7e5	groups	claim.name
b8e0e0f3-048d-4418-89a6-b769d606c7e5	String	jsonType.label
6db9cdda-1581-4e5f-879b-40d117b99a7f	true	introspection.token.claim
6db9cdda-1581-4e5f-879b-40d117b99a7f	true	id.token.claim
6db9cdda-1581-4e5f-879b-40d117b99a7f	true	access.token.claim
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
bruteForceProtected	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	false
permanentLockout	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	false
maxTemporaryLockouts	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0
maxFailureWaitSeconds	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	900
minimumQuickLoginWaitSeconds	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	60
waitIncrementSeconds	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	60
quickLoginCheckMilliSeconds	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	1000
maxDeltaTimeSeconds	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	43200
failureFactor	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	30
realmReusableOtpCode	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	false
firstBrokerLoginFlowId	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f52fe34a-1e1b-43a8-aced-35dd3988226c
displayName	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	Keycloak
displayNameHtml	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	RS256
offlineSessionMaxLifespanEnabled	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	false
offlineSessionMaxLifespan	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	5184000
cibaBackchannelTokenDeliveryMode	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	poll
cibaExpiresIn	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	120
cibaAuthRequestedUserHint	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	login_hint
parRequestUriLifespan	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	60
cibaInterval	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	5
actionTokenGeneratedByAdminLifespan	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	43200
actionTokenGeneratedByUserLifespan	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	300
oauth2DeviceCodeLifespan	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	600
oauth2DevicePollingInterval	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	5
clientSessionIdleTimeout	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0
clientSessionMaxLifespan	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0
clientOfflineSessionIdleTimeout	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0
clientOfflineSessionMaxLifespan	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0
webAuthnPolicyRpEntityName	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	keycloak
webAuthnPolicySignatureAlgorithms	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ES256
webAuthnPolicyRpId	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	
webAuthnPolicyAttestationConveyancePreference	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyAuthenticatorAttachment	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyRequireResidentKey	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyUserVerificationRequirement	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyCreateTimeout	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0
webAuthnPolicyAvoidSameAuthenticatorRegister	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	false
webAuthnPolicyRpEntityNamePasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	ES256
webAuthnPolicyRpIdPasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	
webAuthnPolicyAttestationConveyancePreferencePasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyRequireResidentKeyPasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	not specified
webAuthnPolicyCreateTimeoutPasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	false
client-policies.profiles	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	{"profiles":[]}
client-policies.policies	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	
_browser_header.xContentTypeOptions	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	nosniff
_browser_header.referrerPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	no-referrer
_browser_header.xRobotsTag	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	none
_browser_header.xFrameOptions	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	SAMEORIGIN
_browser_header.xXSSProtection	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	1; mode=block
_browser_header.contentSecurityPolicy	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.redirect_uris (client_id, value) FROM stdin;
ef185f42-ba9b-415a-babc-c20a04e9c7b1	/realms/master/account/*
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	/realms/master/account/*
acb05ca4-09b1-4c16-9ff1-be65474c10df	/admin/master/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
ee7d75a1-65d8-4dcf-9a75-568109ce2a3d	VERIFY_EMAIL	Verify Email	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	VERIFY_EMAIL	50
7177a441-2bc0-42cf-a5fb-a43b28c56c52	UPDATE_PROFILE	Update Profile	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	UPDATE_PROFILE	40
6299afae-ffcf-4ee6-97a4-06c00929fd36	CONFIGURE_TOTP	Configure OTP	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	CONFIGURE_TOTP	10
27ab547a-0c32-499a-bb23-2b2f172f5518	UPDATE_PASSWORD	Update Password	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	UPDATE_PASSWORD	30
e5527234-29d2-47f6-b36b-6994ef46e621	TERMS_AND_CONDITIONS	Terms and Conditions	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f	f	TERMS_AND_CONDITIONS	20
d830bce1-c321-4b97-b2d2-5b90745b33c0	delete_account	Delete Account	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	f	f	delete_account	60
c0460679-1572-4aec-94e1-56e7d5731c90	delete_credential	Delete Credential	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	delete_credential	100
b26afb94-1d4b-47e9-9e1e-e43c6b446621	update_user_locale	Update User Locale	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	update_user_locale	1000
362caf94-c9e5-4420-afe9-81b80a6d9d02	UPDATE_EMAIL	Update Email	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	UPDATE_EMAIL	70
652bc3dc-2f51-4eed-91b3-b91593617632	webauthn-register	Webauthn Register	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	webauthn-register	70
0af7af3f-2101-447b-883f-33a79e3ee769	webauthn-register-passwordless	Webauthn Register Passwordless	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	webauthn-register-passwordless	80
4b8756a6-095f-46b7-87c7-3be7fea57bcf	VERIFY_PROFILE	Verify Profile	f3ebbfe9-e1d7-4b65-83bd-7b756f02921d	t	f	VERIFY_PROFILE	90
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	5b8874ff-199a-47f8-8050-eb1d386b1052
6c8f2d8a-30aa-4e42-90d0-0b460b4ba8bd	5879482a-a869-4a8b-a5ff-d872c58aefe6
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
45c47adb-8835-416d-ad37-255379c4d94b	f1d149c5-36a4-48e0-8bed-0e7d60f4c194
4881e1b4-9ed6-4493-9234-414c56ab8701	f1d149c5-36a4-48e0-8bed-0e7d60f4c194
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.web_origins (client_id, value) FROM stdin;
acb05ca4-09b1-4c16-9ff1-be65474c10df	+
\.


--
-- PostgreSQL database dump complete
--

