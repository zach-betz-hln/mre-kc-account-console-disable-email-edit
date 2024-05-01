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
cd46632c-69f1-497f-9031-bf38463e0408	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	a040f4c6-9ecb-4df9-8040-58922ebbac94	1800	f	\N	t	f	f	f	0	1	30	6	HmacSHA1	totp	9d481905-3aad-4ae3-ac2e-3dcb80b4c29f	38a527f6-ec1a-44d6-96ea-b5c6f020416b	dd0c64e9-a88b-491e-88fb-3fad98b3c3bc	98fd1da4-2aba-40c6-b395-b6b1ebc3f634	cbd2c3eb-b1c4-4f66-a07c-857442c2da40	2592000	f	900	t	f	96f32fae-07a8-43fe-abdf-5f1589bd3a95	0	f	0	0	81b8ee1e-d296-4fea-bd12-21fd04fbfcdc
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
9d481905-3aad-4ae3-ac2e-3dcb80b4c29f	browser	browser based authentication	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	t	t
29c6d8ee-b64f-435d-87a3-01f3d2fce805	forms	Username, password, otp and other auth forms.	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
fb95fa95-244c-496c-a9c7-3175886e3a84	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
dd0c64e9-a88b-491e-88fb-3fad98b3c3bc	direct grant	OpenID Connect Resource Owner Grant	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	t	t
8911fed8-f802-4162-8340-fb700f937b0c	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
38a527f6-ec1a-44d6-96ea-b5c6f020416b	registration	registration flow	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	t	t
aa06d8a4-17d5-45f4-869e-869622e0f5a0	registration form	registration form	cd46632c-69f1-497f-9031-bf38463e0408	form-flow	f	t
98fd1da4-2aba-40c6-b395-b6b1ebc3f634	reset credentials	Reset credentials for a user if they forgot their password or something	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	t	t
4f58ffa8-b81c-41f6-a785-e6ba26afe936	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
cbd2c3eb-b1c4-4f66-a07c-857442c2da40	clients	Base authentication for clients	cd46632c-69f1-497f-9031-bf38463e0408	client-flow	t	t
f8179c2f-a9b7-4da6-a76a-a8bff3bc04f5	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	t	t
37cf63ee-c1ea-4090-9f92-b6b13e366699	User creation or linking	Flow for the existing/non-existing user alternatives	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
e3f92289-f6a8-4bfe-adb8-4602cfbc9be3	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
af517740-f1e2-4357-87be-f696ddd34851	Account verification options	Method with which to verity the existing account	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
88a6ecc2-51c2-4c32-98e0-ec2025afab7a	Verify Existing Account by Re-authentication	Reauthentication of existing account	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
f7849781-bb8c-4591-a14d-6abdabeb8a4a	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	f	t
449f50e0-ea1e-4d2c-983d-ff9caf39b77b	saml ecp	SAML ECP Profile Authentication Flow	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	t	t
96f32fae-07a8-43fe-abdf-5f1589bd3a95	docker auth	Used by Docker clients to authenticate against the IDP	cd46632c-69f1-497f-9031-bf38463e0408	basic-flow	t	t
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
8b35a787-4e32-47cf-bbfc-46c71da14d9e	\N	auth-cookie	cd46632c-69f1-497f-9031-bf38463e0408	9d481905-3aad-4ae3-ac2e-3dcb80b4c29f	2	10	f	\N	\N
5c689e33-0e8e-45d7-a7c1-e1835354034b	\N	auth-spnego	cd46632c-69f1-497f-9031-bf38463e0408	9d481905-3aad-4ae3-ac2e-3dcb80b4c29f	3	20	f	\N	\N
7925809a-d55f-4587-b9cb-2f85cb10eb45	\N	identity-provider-redirector	cd46632c-69f1-497f-9031-bf38463e0408	9d481905-3aad-4ae3-ac2e-3dcb80b4c29f	2	25	f	\N	\N
4ae67c9f-3401-4c1b-b232-194d3e9bb687	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	9d481905-3aad-4ae3-ac2e-3dcb80b4c29f	2	30	t	29c6d8ee-b64f-435d-87a3-01f3d2fce805	\N
e7c6f490-9e89-414e-a304-bea45855aa9a	\N	auth-username-password-form	cd46632c-69f1-497f-9031-bf38463e0408	29c6d8ee-b64f-435d-87a3-01f3d2fce805	0	10	f	\N	\N
1cdee94e-5411-46f1-a0fb-bfee9ccc433d	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	29c6d8ee-b64f-435d-87a3-01f3d2fce805	1	20	t	fb95fa95-244c-496c-a9c7-3175886e3a84	\N
b0b13df6-8e7d-48e5-9285-53b7ea12abf6	\N	conditional-user-configured	cd46632c-69f1-497f-9031-bf38463e0408	fb95fa95-244c-496c-a9c7-3175886e3a84	0	10	f	\N	\N
ae62db8d-54a7-41ca-b5d7-9eea9a509207	\N	auth-otp-form	cd46632c-69f1-497f-9031-bf38463e0408	fb95fa95-244c-496c-a9c7-3175886e3a84	0	20	f	\N	\N
d0b8b7c4-7541-450d-b662-c3c97735b1f9	\N	direct-grant-validate-username	cd46632c-69f1-497f-9031-bf38463e0408	dd0c64e9-a88b-491e-88fb-3fad98b3c3bc	0	10	f	\N	\N
5ec9e6bd-40fb-407e-bf24-119286c26c40	\N	direct-grant-validate-password	cd46632c-69f1-497f-9031-bf38463e0408	dd0c64e9-a88b-491e-88fb-3fad98b3c3bc	0	20	f	\N	\N
2ead0221-d063-425c-a3b8-1696148f453b	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	dd0c64e9-a88b-491e-88fb-3fad98b3c3bc	1	30	t	8911fed8-f802-4162-8340-fb700f937b0c	\N
e4740640-a038-4f16-bbc0-6a5c60572bc5	\N	conditional-user-configured	cd46632c-69f1-497f-9031-bf38463e0408	8911fed8-f802-4162-8340-fb700f937b0c	0	10	f	\N	\N
c3983aa3-0fea-451b-9323-263139fcc744	\N	direct-grant-validate-otp	cd46632c-69f1-497f-9031-bf38463e0408	8911fed8-f802-4162-8340-fb700f937b0c	0	20	f	\N	\N
c8ecf93a-3038-4692-a134-a3181fba0bb2	\N	registration-page-form	cd46632c-69f1-497f-9031-bf38463e0408	38a527f6-ec1a-44d6-96ea-b5c6f020416b	0	10	t	aa06d8a4-17d5-45f4-869e-869622e0f5a0	\N
db1ecad9-fa14-4653-a1f5-919454c4ef39	\N	registration-user-creation	cd46632c-69f1-497f-9031-bf38463e0408	aa06d8a4-17d5-45f4-869e-869622e0f5a0	0	20	f	\N	\N
c9923ae3-0fe6-46fe-bcb0-14966408e17a	\N	registration-password-action	cd46632c-69f1-497f-9031-bf38463e0408	aa06d8a4-17d5-45f4-869e-869622e0f5a0	0	50	f	\N	\N
2346e4d4-3021-432e-ae36-7ee81bef7c4f	\N	registration-recaptcha-action	cd46632c-69f1-497f-9031-bf38463e0408	aa06d8a4-17d5-45f4-869e-869622e0f5a0	3	60	f	\N	\N
e2517363-4131-4623-a7c7-72faff0bb7b5	\N	registration-terms-and-conditions	cd46632c-69f1-497f-9031-bf38463e0408	aa06d8a4-17d5-45f4-869e-869622e0f5a0	3	70	f	\N	\N
5e845c7c-7038-414c-99de-d962f6f421e1	\N	reset-credentials-choose-user	cd46632c-69f1-497f-9031-bf38463e0408	98fd1da4-2aba-40c6-b395-b6b1ebc3f634	0	10	f	\N	\N
5af843c3-0ceb-40dc-b6b9-d4cef5fb10fb	\N	reset-credential-email	cd46632c-69f1-497f-9031-bf38463e0408	98fd1da4-2aba-40c6-b395-b6b1ebc3f634	0	20	f	\N	\N
2d05a1ac-d963-41e5-ba4f-8d6e2bcd878b	\N	reset-password	cd46632c-69f1-497f-9031-bf38463e0408	98fd1da4-2aba-40c6-b395-b6b1ebc3f634	0	30	f	\N	\N
3ab8ec58-e10e-4c30-a37a-3cc94b6589f0	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	98fd1da4-2aba-40c6-b395-b6b1ebc3f634	1	40	t	4f58ffa8-b81c-41f6-a785-e6ba26afe936	\N
eab5ee4e-60da-4dc9-95fd-5f632f520759	\N	conditional-user-configured	cd46632c-69f1-497f-9031-bf38463e0408	4f58ffa8-b81c-41f6-a785-e6ba26afe936	0	10	f	\N	\N
fbb83fab-3a5d-410d-8139-119aa20a03eb	\N	reset-otp	cd46632c-69f1-497f-9031-bf38463e0408	4f58ffa8-b81c-41f6-a785-e6ba26afe936	0	20	f	\N	\N
473dee26-bd40-4785-a415-9b145f673925	\N	client-secret	cd46632c-69f1-497f-9031-bf38463e0408	cbd2c3eb-b1c4-4f66-a07c-857442c2da40	2	10	f	\N	\N
9c9f1ddd-3a3e-444b-971e-a93c2d12951f	\N	client-jwt	cd46632c-69f1-497f-9031-bf38463e0408	cbd2c3eb-b1c4-4f66-a07c-857442c2da40	2	20	f	\N	\N
9b6b1c82-6e6e-4c54-ba51-1fc6d0b915f0	\N	client-secret-jwt	cd46632c-69f1-497f-9031-bf38463e0408	cbd2c3eb-b1c4-4f66-a07c-857442c2da40	2	30	f	\N	\N
7dc35eba-1b80-47d3-aa8f-83c7967063cc	\N	client-x509	cd46632c-69f1-497f-9031-bf38463e0408	cbd2c3eb-b1c4-4f66-a07c-857442c2da40	2	40	f	\N	\N
e72aac94-62c4-4e23-8e58-818b4b99c41e	\N	idp-review-profile	cd46632c-69f1-497f-9031-bf38463e0408	f8179c2f-a9b7-4da6-a76a-a8bff3bc04f5	0	10	f	\N	7854a4a6-cfdd-4341-807c-7b2312d778cf
3d0191ee-e555-4e1d-9c54-3adf2d763858	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	f8179c2f-a9b7-4da6-a76a-a8bff3bc04f5	0	20	t	37cf63ee-c1ea-4090-9f92-b6b13e366699	\N
a0cfcef4-0d24-4609-8113-d26eaa0beabe	\N	idp-create-user-if-unique	cd46632c-69f1-497f-9031-bf38463e0408	37cf63ee-c1ea-4090-9f92-b6b13e366699	2	10	f	\N	d003ab84-15eb-4113-8a61-4a05e7613e18
fafeb24b-9837-4bb9-bce0-e78941536ff1	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	37cf63ee-c1ea-4090-9f92-b6b13e366699	2	20	t	e3f92289-f6a8-4bfe-adb8-4602cfbc9be3	\N
e7b4f6f1-c9c4-4fbc-8439-c397022472c5	\N	idp-confirm-link	cd46632c-69f1-497f-9031-bf38463e0408	e3f92289-f6a8-4bfe-adb8-4602cfbc9be3	0	10	f	\N	\N
5e251405-dd2d-4ad5-9423-a285a48f5f72	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	e3f92289-f6a8-4bfe-adb8-4602cfbc9be3	0	20	t	af517740-f1e2-4357-87be-f696ddd34851	\N
63514712-86d4-4ab8-ad7a-458b1f1db382	\N	idp-email-verification	cd46632c-69f1-497f-9031-bf38463e0408	af517740-f1e2-4357-87be-f696ddd34851	2	10	f	\N	\N
22907f34-49c8-4893-b7b7-dcae2d11f8d9	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	af517740-f1e2-4357-87be-f696ddd34851	2	20	t	88a6ecc2-51c2-4c32-98e0-ec2025afab7a	\N
2a0c0550-180f-4696-bc07-7050153aa2e0	\N	idp-username-password-form	cd46632c-69f1-497f-9031-bf38463e0408	88a6ecc2-51c2-4c32-98e0-ec2025afab7a	0	10	f	\N	\N
75982aa3-07fd-4feb-b528-734662695ea6	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	88a6ecc2-51c2-4c32-98e0-ec2025afab7a	1	20	t	f7849781-bb8c-4591-a14d-6abdabeb8a4a	\N
c0e6f135-975a-4be9-9361-6fd55a3bab5c	\N	conditional-user-configured	cd46632c-69f1-497f-9031-bf38463e0408	f7849781-bb8c-4591-a14d-6abdabeb8a4a	0	10	f	\N	\N
86ee5773-2f56-404e-951b-f8e0e72ea972	\N	auth-otp-form	cd46632c-69f1-497f-9031-bf38463e0408	f7849781-bb8c-4591-a14d-6abdabeb8a4a	0	20	f	\N	\N
f3829db4-0798-4af4-a2fc-d62d9296efae	\N	http-basic-authenticator	cd46632c-69f1-497f-9031-bf38463e0408	449f50e0-ea1e-4d2c-983d-ff9caf39b77b	0	10	f	\N	\N
4e92abd1-3100-4957-9565-9bac2c0a7fef	\N	docker-http-basic-authenticator	cd46632c-69f1-497f-9031-bf38463e0408	96f32fae-07a8-43fe-abdf-5f1589bd3a95	0	10	f	\N	\N
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
7854a4a6-cfdd-4341-807c-7b2312d778cf	review profile config	cd46632c-69f1-497f-9031-bf38463e0408
d003ab84-15eb-4113-8a61-4a05e7613e18	create unique user config	cd46632c-69f1-497f-9031-bf38463e0408
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
7854a4a6-cfdd-4341-807c-7b2312d778cf	missing	update.profile.on.first.login
d003ab84-15eb-4113-8a61-4a05e7613e18	false	require.password.update.after.registration
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
a040f4c6-9ecb-4df9-8040-58922ebbac94	t	f	master-realm	0	f	\N	\N	t	\N	f	cd46632c-69f1-497f-9031-bf38463e0408	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
521c195c-dd2d-4e62-8744-c182e43c4da6	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	cd46632c-69f1-497f-9031-bf38463e0408	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
8c6bafd8-48a1-4da8-94fc-25378e8733ab	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	cd46632c-69f1-497f-9031-bf38463e0408	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
dd92e899-9b9c-4ca2-8637-927a1e67153c	t	f	broker	0	f	\N	\N	t	\N	f	cd46632c-69f1-497f-9031-bf38463e0408	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
7664f82c-57ea-41d1-a5ee-3199b5893a2c	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	cd46632c-69f1-497f-9031-bf38463e0408	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	t	f	admin-cli	0	t	\N	\N	f	\N	f	cd46632c-69f1-497f-9031-bf38463e0408	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
521c195c-dd2d-4e62-8744-c182e43c4da6	post.logout.redirect.uris	+
8c6bafd8-48a1-4da8-94fc-25378e8733ab	post.logout.redirect.uris	+
8c6bafd8-48a1-4da8-94fc-25378e8733ab	pkce.code.challenge.method	S256
7664f82c-57ea-41d1-a5ee-3199b5893a2c	post.logout.redirect.uris	+
7664f82c-57ea-41d1-a5ee-3199b5893a2c	pkce.code.challenge.method	S256
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
32b2850f-16f2-437a-9784-e83a13869861	offline_access	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect built-in scope: offline_access	openid-connect
9be9eeaf-2d8b-47ae-a11c-2ac0f5099517	role_list	cd46632c-69f1-497f-9031-bf38463e0408	SAML role list	saml
2ba81a93-6b0a-4b11-ab3c-19a279528bff	profile	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect built-in scope: profile	openid-connect
1b0fe457-15f9-4155-bc8c-49dd2904ebfd	email	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect built-in scope: email	openid-connect
421d4db1-26a1-4c97-b94f-5443e863d64e	address	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect built-in scope: address	openid-connect
5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	phone	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect built-in scope: phone	openid-connect
7edb7d36-0bfd-467d-a7d1-119cb65e3d97	roles	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect scope for add user roles to the access token	openid-connect
ab53b5c3-41ac-4888-be12-c0c83e57a7b5	web-origins	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect scope for add allowed web origins to the access token	openid-connect
eeecb63d-ff33-4a26-99c3-72c23ec6b555	microprofile-jwt	cd46632c-69f1-497f-9031-bf38463e0408	Microprofile - JWT built-in scope	openid-connect
f85e1541-3228-479b-b938-19d0141e5d26	acr	cd46632c-69f1-497f-9031-bf38463e0408	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
32b2850f-16f2-437a-9784-e83a13869861	true	display.on.consent.screen
32b2850f-16f2-437a-9784-e83a13869861	${offlineAccessScopeConsentText}	consent.screen.text
9be9eeaf-2d8b-47ae-a11c-2ac0f5099517	true	display.on.consent.screen
9be9eeaf-2d8b-47ae-a11c-2ac0f5099517	${samlRoleListScopeConsentText}	consent.screen.text
2ba81a93-6b0a-4b11-ab3c-19a279528bff	true	display.on.consent.screen
2ba81a93-6b0a-4b11-ab3c-19a279528bff	${profileScopeConsentText}	consent.screen.text
2ba81a93-6b0a-4b11-ab3c-19a279528bff	true	include.in.token.scope
1b0fe457-15f9-4155-bc8c-49dd2904ebfd	true	display.on.consent.screen
1b0fe457-15f9-4155-bc8c-49dd2904ebfd	${emailScopeConsentText}	consent.screen.text
1b0fe457-15f9-4155-bc8c-49dd2904ebfd	true	include.in.token.scope
421d4db1-26a1-4c97-b94f-5443e863d64e	true	display.on.consent.screen
421d4db1-26a1-4c97-b94f-5443e863d64e	${addressScopeConsentText}	consent.screen.text
421d4db1-26a1-4c97-b94f-5443e863d64e	true	include.in.token.scope
5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	true	display.on.consent.screen
5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	${phoneScopeConsentText}	consent.screen.text
5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	true	include.in.token.scope
7edb7d36-0bfd-467d-a7d1-119cb65e3d97	true	display.on.consent.screen
7edb7d36-0bfd-467d-a7d1-119cb65e3d97	${rolesScopeConsentText}	consent.screen.text
7edb7d36-0bfd-467d-a7d1-119cb65e3d97	false	include.in.token.scope
ab53b5c3-41ac-4888-be12-c0c83e57a7b5	false	display.on.consent.screen
ab53b5c3-41ac-4888-be12-c0c83e57a7b5		consent.screen.text
ab53b5c3-41ac-4888-be12-c0c83e57a7b5	false	include.in.token.scope
eeecb63d-ff33-4a26-99c3-72c23ec6b555	false	display.on.consent.screen
eeecb63d-ff33-4a26-99c3-72c23ec6b555	true	include.in.token.scope
f85e1541-3228-479b-b938-19d0141e5d26	false	display.on.consent.screen
f85e1541-3228-479b-b938-19d0141e5d26	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
521c195c-dd2d-4e62-8744-c182e43c4da6	ab53b5c3-41ac-4888-be12-c0c83e57a7b5	t
521c195c-dd2d-4e62-8744-c182e43c4da6	2ba81a93-6b0a-4b11-ab3c-19a279528bff	t
521c195c-dd2d-4e62-8744-c182e43c4da6	1b0fe457-15f9-4155-bc8c-49dd2904ebfd	t
521c195c-dd2d-4e62-8744-c182e43c4da6	7edb7d36-0bfd-467d-a7d1-119cb65e3d97	t
521c195c-dd2d-4e62-8744-c182e43c4da6	f85e1541-3228-479b-b938-19d0141e5d26	t
521c195c-dd2d-4e62-8744-c182e43c4da6	421d4db1-26a1-4c97-b94f-5443e863d64e	f
521c195c-dd2d-4e62-8744-c182e43c4da6	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	f
521c195c-dd2d-4e62-8744-c182e43c4da6	32b2850f-16f2-437a-9784-e83a13869861	f
521c195c-dd2d-4e62-8744-c182e43c4da6	eeecb63d-ff33-4a26-99c3-72c23ec6b555	f
8c6bafd8-48a1-4da8-94fc-25378e8733ab	ab53b5c3-41ac-4888-be12-c0c83e57a7b5	t
8c6bafd8-48a1-4da8-94fc-25378e8733ab	2ba81a93-6b0a-4b11-ab3c-19a279528bff	t
8c6bafd8-48a1-4da8-94fc-25378e8733ab	1b0fe457-15f9-4155-bc8c-49dd2904ebfd	t
8c6bafd8-48a1-4da8-94fc-25378e8733ab	7edb7d36-0bfd-467d-a7d1-119cb65e3d97	t
8c6bafd8-48a1-4da8-94fc-25378e8733ab	f85e1541-3228-479b-b938-19d0141e5d26	t
8c6bafd8-48a1-4da8-94fc-25378e8733ab	421d4db1-26a1-4c97-b94f-5443e863d64e	f
8c6bafd8-48a1-4da8-94fc-25378e8733ab	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	f
8c6bafd8-48a1-4da8-94fc-25378e8733ab	32b2850f-16f2-437a-9784-e83a13869861	f
8c6bafd8-48a1-4da8-94fc-25378e8733ab	eeecb63d-ff33-4a26-99c3-72c23ec6b555	f
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	ab53b5c3-41ac-4888-be12-c0c83e57a7b5	t
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	2ba81a93-6b0a-4b11-ab3c-19a279528bff	t
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	1b0fe457-15f9-4155-bc8c-49dd2904ebfd	t
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	7edb7d36-0bfd-467d-a7d1-119cb65e3d97	t
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	f85e1541-3228-479b-b938-19d0141e5d26	t
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	421d4db1-26a1-4c97-b94f-5443e863d64e	f
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	f
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	32b2850f-16f2-437a-9784-e83a13869861	f
3dfb7809-8dfd-4c46-af7b-fb5bb081699e	eeecb63d-ff33-4a26-99c3-72c23ec6b555	f
dd92e899-9b9c-4ca2-8637-927a1e67153c	ab53b5c3-41ac-4888-be12-c0c83e57a7b5	t
dd92e899-9b9c-4ca2-8637-927a1e67153c	2ba81a93-6b0a-4b11-ab3c-19a279528bff	t
dd92e899-9b9c-4ca2-8637-927a1e67153c	1b0fe457-15f9-4155-bc8c-49dd2904ebfd	t
dd92e899-9b9c-4ca2-8637-927a1e67153c	7edb7d36-0bfd-467d-a7d1-119cb65e3d97	t
dd92e899-9b9c-4ca2-8637-927a1e67153c	f85e1541-3228-479b-b938-19d0141e5d26	t
dd92e899-9b9c-4ca2-8637-927a1e67153c	421d4db1-26a1-4c97-b94f-5443e863d64e	f
dd92e899-9b9c-4ca2-8637-927a1e67153c	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	f
dd92e899-9b9c-4ca2-8637-927a1e67153c	32b2850f-16f2-437a-9784-e83a13869861	f
dd92e899-9b9c-4ca2-8637-927a1e67153c	eeecb63d-ff33-4a26-99c3-72c23ec6b555	f
a040f4c6-9ecb-4df9-8040-58922ebbac94	ab53b5c3-41ac-4888-be12-c0c83e57a7b5	t
a040f4c6-9ecb-4df9-8040-58922ebbac94	2ba81a93-6b0a-4b11-ab3c-19a279528bff	t
a040f4c6-9ecb-4df9-8040-58922ebbac94	1b0fe457-15f9-4155-bc8c-49dd2904ebfd	t
a040f4c6-9ecb-4df9-8040-58922ebbac94	7edb7d36-0bfd-467d-a7d1-119cb65e3d97	t
a040f4c6-9ecb-4df9-8040-58922ebbac94	f85e1541-3228-479b-b938-19d0141e5d26	t
a040f4c6-9ecb-4df9-8040-58922ebbac94	421d4db1-26a1-4c97-b94f-5443e863d64e	f
a040f4c6-9ecb-4df9-8040-58922ebbac94	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	f
a040f4c6-9ecb-4df9-8040-58922ebbac94	32b2850f-16f2-437a-9784-e83a13869861	f
a040f4c6-9ecb-4df9-8040-58922ebbac94	eeecb63d-ff33-4a26-99c3-72c23ec6b555	f
7664f82c-57ea-41d1-a5ee-3199b5893a2c	ab53b5c3-41ac-4888-be12-c0c83e57a7b5	t
7664f82c-57ea-41d1-a5ee-3199b5893a2c	2ba81a93-6b0a-4b11-ab3c-19a279528bff	t
7664f82c-57ea-41d1-a5ee-3199b5893a2c	1b0fe457-15f9-4155-bc8c-49dd2904ebfd	t
7664f82c-57ea-41d1-a5ee-3199b5893a2c	7edb7d36-0bfd-467d-a7d1-119cb65e3d97	t
7664f82c-57ea-41d1-a5ee-3199b5893a2c	f85e1541-3228-479b-b938-19d0141e5d26	t
7664f82c-57ea-41d1-a5ee-3199b5893a2c	421d4db1-26a1-4c97-b94f-5443e863d64e	f
7664f82c-57ea-41d1-a5ee-3199b5893a2c	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	f
7664f82c-57ea-41d1-a5ee-3199b5893a2c	32b2850f-16f2-437a-9784-e83a13869861	f
7664f82c-57ea-41d1-a5ee-3199b5893a2c	eeecb63d-ff33-4a26-99c3-72c23ec6b555	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
32b2850f-16f2-437a-9784-e83a13869861	a0f5f6f9-1b5b-4191-b7a7-890e8bea62cb
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
1b0e48f2-5321-4535-8811-97a3d352e0ea	Trusted Hosts	cd46632c-69f1-497f-9031-bf38463e0408	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	anonymous
d4155d3e-cd11-490a-bbda-5104bc5f4420	Consent Required	cd46632c-69f1-497f-9031-bf38463e0408	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	anonymous
610295d4-60ca-4104-9e8a-9db3b66311ea	Full Scope Disabled	cd46632c-69f1-497f-9031-bf38463e0408	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	anonymous
d2bcf1b6-3b1e-42ca-a55f-fc7f32328188	Max Clients Limit	cd46632c-69f1-497f-9031-bf38463e0408	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	anonymous
fc098f78-5924-4613-9b57-64a327a4c3ad	Allowed Protocol Mapper Types	cd46632c-69f1-497f-9031-bf38463e0408	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	anonymous
2d230373-f05d-423d-8af1-a637f95a6fac	Allowed Client Scopes	cd46632c-69f1-497f-9031-bf38463e0408	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	anonymous
f42ad4c5-90a6-4581-bd43-42ad10f4d62a	Allowed Protocol Mapper Types	cd46632c-69f1-497f-9031-bf38463e0408	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	authenticated
3e6c3f0c-582e-45c2-94e0-62986879209e	Allowed Client Scopes	cd46632c-69f1-497f-9031-bf38463e0408	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cd46632c-69f1-497f-9031-bf38463e0408	authenticated
75286181-ad8f-489c-8212-084959ef2b8d	rsa-generated	cd46632c-69f1-497f-9031-bf38463e0408	rsa-generated	org.keycloak.keys.KeyProvider	cd46632c-69f1-497f-9031-bf38463e0408	\N
f6719a42-739d-441a-83af-3f17706fbc6a	rsa-enc-generated	cd46632c-69f1-497f-9031-bf38463e0408	rsa-enc-generated	org.keycloak.keys.KeyProvider	cd46632c-69f1-497f-9031-bf38463e0408	\N
cc540252-8ccc-45a7-b14f-4b56ae5e8f03	hmac-generated-hs512	cd46632c-69f1-497f-9031-bf38463e0408	hmac-generated	org.keycloak.keys.KeyProvider	cd46632c-69f1-497f-9031-bf38463e0408	\N
52a937f6-f67d-41c4-827f-80cf632f6dbe	aes-generated	cd46632c-69f1-497f-9031-bf38463e0408	aes-generated	org.keycloak.keys.KeyProvider	cd46632c-69f1-497f-9031-bf38463e0408	\N
f412e837-b971-480e-905e-99aca03d4671	\N	cd46632c-69f1-497f-9031-bf38463e0408	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	cd46632c-69f1-497f-9031-bf38463e0408	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
c09653e2-c14a-401b-aa65-faed4a8dbff8	d2bcf1b6-3b1e-42ca-a55f-fc7f32328188	max-clients	200
9035e73a-b4d4-4a95-be50-45109d4ae3f5	1b0e48f2-5321-4535-8811-97a3d352e0ea	host-sending-registration-request-must-match	true
07164ac8-3d80-447c-8021-0f00c4096f75	1b0e48f2-5321-4535-8811-97a3d352e0ea	client-uris-must-match	true
e73ba783-b6d9-4890-b157-4d3d46a2c35c	3e6c3f0c-582e-45c2-94e0-62986879209e	allow-default-scopes	true
0941b062-16fb-4d3b-b3f4-90b124054d9e	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c66afb07-3b13-4bc6-bdfb-2312d4900dcf	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
23ba6ff1-84f9-44f9-938c-41d0be2d2920	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	saml-user-property-mapper
3848b48a-0fe2-46de-a3f8-5212fcd2d108	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
13662e36-5deb-4522-abe7-3fdee32bd4ee	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	saml-role-list-mapper
c31080c3-a3c8-48b4-a62e-db2df8499cb1	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	oidc-address-mapper
be2837d9-2f19-475f-8e43-69b5f10c984f	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	saml-user-attribute-mapper
14037544-abfe-42df-a74b-7b4d5c14ab54	fc098f78-5924-4613-9b57-64a327a4c3ad	allowed-protocol-mapper-types	oidc-full-name-mapper
2498f1bc-74eb-4af9-b782-38254144da09	2d230373-f05d-423d-8af1-a637f95a6fac	allow-default-scopes	true
cf95b6ec-a8f1-4b24-a7f5-734468e964cd	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	saml-user-property-mapper
602021b7-7be5-48af-b9de-0b0449ff6ffc	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8f2738b5-2f15-4571-b4db-ed97b551444c	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	oidc-full-name-mapper
c8e072d1-ba83-465c-9bdc-e143269ead71	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	oidc-address-mapper
d67ebd37-24c5-42e9-9db8-2d480fccfe15	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
bd9218eb-ca4b-4764-9bf2-7c696d18bdc8	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
639d9406-0fa5-4224-a4d3-56308ae28238	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	saml-user-attribute-mapper
fb2b412d-d9fe-4219-b549-1cac6768c3d0	f42ad4c5-90a6-4581-bd43-42ad10f4d62a	allowed-protocol-mapper-types	saml-role-list-mapper
55a34cc5-e81d-4097-8992-4dc5ca1ee2a9	52a937f6-f67d-41c4-827f-80cf632f6dbe	secret	KmW4y9e6hQD1hThLHfadMg
dac275c9-ab33-4bc8-905e-c0db1f93eefb	52a937f6-f67d-41c4-827f-80cf632f6dbe	priority	100
fc10b4c2-4fc6-4a40-85bc-7eb29847bffe	52a937f6-f67d-41c4-827f-80cf632f6dbe	kid	98b6abc6-773d-43aa-a5ca-ff4d6a15a24c
286fdc85-05cb-4bc1-bc5a-76dc33404110	75286181-ad8f-489c-8212-084959ef2b8d	priority	100
66636a3e-148c-444d-b21f-413fb7523d3f	75286181-ad8f-489c-8212-084959ef2b8d	privateKey	MIIEpAIBAAKCAQEAmQJDvV34XfiuBTYe8jQM8t7v6bKh6uYnzIRz0U6eERZynoX8Cge1vqEFx2QCFgsjm2ZyZoLCbPsdjzzDDr2qFx/q4L2l8ogEksm8BLgTpzYR24QxqxNN6Q5TB1fgfj0OWfMyJpcD8kGF2WiwPngu30YViSmkIwsSzYbC+Tyi9NRcseEG+D6dsQmRwg5rkFD6mN7xwl4loh4I6+Mp52BN2phnFpSjbE9HhwOagyvHpvFcD7k47jC2HK4dJ073AlZyqo+e+U33E7jse838R11F7vyQzCWOCFYrbWrrkJQXkya/OCSEquUT8gbcrGOdM8DTTaptkv/XJyMNZBjQiYpFLwIDAQABAoIBABe6767rZ400zSchbSxANq/mM+GT+E5vkprtV0Rjg9qqQhg5jHeGbuwD74WsijGervo3fyT3QQMuRmKELcutTmIWwP1JEcyAcZZ4c3tsjHPBoYRg8g5nyIy4JtgRNiUt//n4YKihLECtY9PDoO3srXb9rh0J7cXCPmYiG+lpZkE/1EHHdmpeujOxw5+3O0do579/NrSQpYOG6XjODew731T43rxfOZ4CG1XF5MnEK9kj/sJc1HhIdDtFO7uZ/Ac7cR4nzO2zqGizzZZcJ+Iv5d7MN7fZmO17GD3GHw22LlkpGawCexGZ76CyO+fgUy9kro0vsNLIKAWkbu9Mt12wapECgYEAyh1DvK1S/8UXRw87K1FZJ9ED2dSJ6sfdG4gvOi+zzw3JkCZbKyumJRTY+BpxLSlT+NnP5nA/zJUzzWc8Mfddvt0mYc74Bx6YSvdBVelp9y/kb7hd+314NmZsUq5AbskjvfYfeHGBHL8TVSKcLMDA5KSgj3/rj93iaDNBgkIFAtECgYEAwc1yS83KRsljH6Nz1Ps9tkSPOO3OvLwtt+m7dzN7unVODkElRCcPs8ROfokHB3K3mL1e5JeIUQGvBLg30euZJgIadSNek+Va+O+i6a6S41EbUJ14dXIjMpuDtloyNcqb7uxsdi13//tJ0fHegArmF6AUIXhb4m12pb5DhQqcx/8CgYAbZE/z2EGxbFK1TLkmK8Y7gTZWZVmzuhabTp+n8SMbYrD4mlosxaOkzuiA54SDLGC3Dz3/6yKaZXY51k3wL6hC39H924D95gWZ01zFefbki1cYVRJXrS+Hn+X6ZqdQ3G29pweo2Sk4biT+mswzvIPn+O/RwvJ38whmOtwb/TqUoQKBgQCgvRlTLffbBiUklJj5yPfCONLhULvrZdg1dbJ6h0TTvX9j6zxRbmRjoSnJYTVnRApqsIYH6naxWUgkDfaeMV3wXEY9aXyEBfKSDY99acGCsD6Lek/yeRwgWUPA9sY2PzldzNGYotWohm8Pph/46xEz/x0zNXRgNJH3nfq6Wbb3WQKBgQCNyRWqRTa86nJdTNLCJ4wzpuvlZrSDgdLG9rM8ECuPwgNEaxvkodvw9TD2n5LakQWPtWLq9crpXXylvR9NYPAPHs3irkizmFMeeqszrhWZLtU9JCl1IZg8YzetiLxKYHG07C3Vm8ATk2YSXClI46V5Mpyc4ai/GsoRcqN9eNwPgg==
c31a971c-062e-4cb9-813a-a2828e011de3	75286181-ad8f-489c-8212-084959ef2b8d	keyUse	SIG
1451e46b-79d7-47d3-8124-c8641f16bcd0	75286181-ad8f-489c-8212-084959ef2b8d	certificate	MIICmzCCAYMCBgGPNbQskzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTAxMTk0NzMxWhcNMzQwNTAxMTk0OTExWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZAkO9Xfhd+K4FNh7yNAzy3u/psqHq5ifMhHPRTp4RFnKehfwKB7W+oQXHZAIWCyObZnJmgsJs+x2PPMMOvaoXH+rgvaXyiASSybwEuBOnNhHbhDGrE03pDlMHV+B+PQ5Z8zImlwPyQYXZaLA+eC7fRhWJKaQjCxLNhsL5PKL01Fyx4Qb4Pp2xCZHCDmuQUPqY3vHCXiWiHgjr4ynnYE3amGcWlKNsT0eHA5qDK8em8VwPuTjuMLYcrh0nTvcCVnKqj575TfcTuOx7zfxHXUXu/JDMJY4IVittauuQlBeTJr84JISq5RPyBtysY50zwNNNqm2S/9cnIw1kGNCJikUvAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAC3q4PsxN+jH7x00G03EoAmfvXkj9bG2ry+ILcf3KxPuGTdLDpf3ADo2XJ3RQOrPY+Fgyy7m1a5w+9b3P5FeNJlWfiAQAxtv/DNxQRPpiJNmOKohKyiZOLg3pnK4bzFNBjJVgLF+hhhtuRJjQPpXdT5jSQ8k99N6BJsIXjkiJWu5/pV+bOvXkiubk37Qw9NMPlOmvWXoqsCDQuzeDVTVfVdpDbCzph5w4rt0CGVJleX2Oe1CI9shC3daFx7/A36uPNCMQvrJ9XXssYZAEplA998bM1d4dEnPoEr/+oBp2gZKkaHZyfhhh9VhiExLXq2Fdpqlw7ulHafUPKpqFzQq9QI=
b62c8821-9627-4d19-b8c3-fb1ff9d37c41	f6719a42-739d-441a-83af-3f17706fbc6a	algorithm	RSA-OAEP
8cdf2a9a-4243-4c86-8133-d7fc3e78d3dc	f6719a42-739d-441a-83af-3f17706fbc6a	priority	100
e05ea5c8-262d-4a01-a452-9d49838debfb	f6719a42-739d-441a-83af-3f17706fbc6a	certificate	MIICmzCCAYMCBgGPNbQtDTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNTAxMTk0NzMxWhcNMzQwNTAxMTk0OTExWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCxMxbjQep7iyyT2uq2Qk9VS6ZZkZ5zNjmT77Y3HEVLMkUZnx0WNad7ycKz/7PsF1ojiXfxQeXXv3FqWX9YATyQMcrywG5zji9UZv0O1aL20bDta4E+d4nxiSrvNQBjRWPZqWoaNOLi1k6/l//ksX1ad6iswfeHqUJW7P4+ML2URMt91r0AGPWEO4svWr4c+Wg5Fz/LIAo+JbGF3WlQlwgELgbUGuWlBU7FRDFmpRh9C9OPpLBcBKk/tswCXmbCwehCEIrnbtYWX2yTn/XVX5HO0NSX6egKHIfOvuHHBii7rp8MkKY05bBxmcSKgHchj6ZM9WUOoLoT+GQ+of/ATKp3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHAfxu8/JIeijlER81wjFcqY4KvLK4e1wC6sDGP5PWUOr5tl3P2OQMbxrbVsYpnC1xi/rwf4q20k0X7O4hxeZ7XiluI7+G0q01Xn5Chtz/0BGXGNUgxK22ikFC0Qw35tOS46QPTzm+8E7Wqnpp3kRJQ8Y6+nikA21FILPtpBaj0j9q1DtQ9I4drFKV2zYqPB8ZJJGcMTyHhguTomzKLgdvVC5fY8SP7lkuB7NbpYqJ/rwwAuPnwt5L33dWGwcdTUq9L5Tp8glrld8vj2FUQRBHjWU3xc8Ftlj2EbN28NOGyMB7rTrd7x4eL4PPfz0XPo3HZ3PyeBgQDJZgpfGQe40Sc=
dd819749-e0f2-4953-941b-8781ec34e14c	f6719a42-739d-441a-83af-3f17706fbc6a	privateKey	MIIEowIBAAKCAQEAsTMW40Hqe4ssk9rqtkJPVUumWZGeczY5k++2NxxFSzJFGZ8dFjWne8nCs/+z7BdaI4l38UHl179xall/WAE8kDHK8sBuc44vVGb9DtWi9tGw7WuBPneJ8Ykq7zUAY0Vj2alqGjTi4tZOv5f/5LF9WneorMH3h6lCVuz+PjC9lETLfda9ABj1hDuLL1q+HPloORc/yyAKPiWxhd1pUJcIBC4G1BrlpQVOxUQxZqUYfQvTj6SwXASpP7bMAl5mwsHoQhCK527WFl9sk5/11V+RztDUl+noChyHzr7hxwYou66fDJCmNOWwcZnEioB3IY+mTPVlDqC6E/hkPqH/wEyqdwIDAQABAoIBAFg91Nv+60HyoJRQpCl3BAK51XEtLva4vhuJd/ghv/AebILB1b5Foc3nP2pbn8GmL2EbB/vAkTDLSTNoth2hIAO+iA4y/c3VtIQXdVV51dmLusvAiXAOH0eEwziz8Cl/WKX/07KRO5sylaybiPbd3Eq84+aEATwxcbPP+RwHMaEvelO0BSMWxDg/2wOhRlTqesUz0+29ueBoVCxJFMMGefi+lUfTU5hAQQOFqroDVQz+ySRDaoNDofmZDjduiNdxluPk1m4/nghjMQjeDfebrDU0G3wSgJnJH3F3HIrdJrnEru61fvSHWAR63ovFxKw2v2gVKbOmfQb4FG48yQmYLKECgYEA+UpQJ7luFBQUWUWz0yMmoP5V7GTQ62RoQmY8WDnuHeW3J7BBSJN89Sw/RSf2PDAE08k38HVhy3vZ9VUoV1M/tlqSE5AyWyZl3ryCnh23TOMLBWKMJPnxU9oSzMOO2idm4AFNDrNxVZubbs65pcBCEUuQUsC0+KCil/I2cKIGqBMCgYEAtfgMjcCw6Qn1qEzEjZ0pmWQeyYT7cVKFlFzNpPbxuzenvXxTpBGYt/LEHOmC6NlP/sdMiSDKjDVLwW5TtXbE0fGRZjdnjsxyd7Am+/29Qu/5gyaSiCLS/ohnUhZ/i+Ws3exS0+OtDDVCzkrRs7a+2pN6lOr9Wj38kXshS/xIiI0CgYA7SzWtfSl1lSER6sZO3fl+KYB+baxTkNpLkM2hnoXIjq71vbKJdKswFYonBM5ImpNLXHz1sLXGFHtPIyYpPx/UW86K4K1ZiNSKGgRnX2IN46LncP0sflasPx5hndIIiX6qoSSW7o9ycUSTIpB9oDEWtAZr6HIjAPIree0A9UjoCQKBgAltLyFMwR1hYbN1Pp1jbds/X4Tq+aeWMctMv25zSHR9XpgnT6HpM3McBWLGCf0L/OPi6SkVZMi8ng8IKxf0bh++Ft0ns5qnJqrimjJlo59LFS7hGagpvapn4IpVFghmPn1El8nYOoeuXqaXI6PerKZgC3KZdcRt/559tWzdRdilAoGBANgtOtpGv2gUCU9mAfn1DABoN43TBZoUgJ2sJ4wjZjnLk+g8vrzZhh1ICv0vyF1aBeW+WbHxfnjaQ9l1etFi40aRYdae5IStYrlVEXOOGZF/L34dSc1tBeGqyhTHf3YvaHKNkgKpU6BA9q0JNnHP3LGbV9eTE5unfPmVbSNrtwMq
8c840644-bb58-431e-a18c-7634d7229a2b	f6719a42-739d-441a-83af-3f17706fbc6a	keyUse	ENC
4a4809b1-bbbc-4809-a57b-de5f29992de1	cc540252-8ccc-45a7-b14f-4b56ae5e8f03	priority	100
82c6b893-db64-41d4-8cba-d72b94a5f8b4	cc540252-8ccc-45a7-b14f-4b56ae5e8f03	algorithm	HS512
6d283a57-ef15-47cc-9b5a-2165d7837004	cc540252-8ccc-45a7-b14f-4b56ae5e8f03	secret	Doc2V8zWp8VXIybSELMpzG0y_5gNsYK4nUvfEv_s0urqESBwO0I-CRajOY2PWX9RqP5DmoJyNpgnxx8_NqZZ5ryQD8O_JRAJ2FN72RSx9MRomBuomeJIinJZn-jKM959VbbOnKWVd0gF6mEWrbHNKOqU76Mlx6VFF8G4IKSW3T0
463b8a14-2756-4aaa-bd00-c63f7a890ac6	cc540252-8ccc-45a7-b14f-4b56ae5e8f03	kid	490d34e3-d804-4af2-a887-0e4cd8d12111
dba67548-dd74-4414-9ce5-5e7172b6bf9a	f412e837-b971-480e-905e-99aca03d4671	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}],"unmanagedAttributePolicy":"ENABLED"}
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
81b8ee1e-d296-4fea-bd12-21fd04fbfcdc	cd46632c-69f1-497f-9031-bf38463e0408	f	${role_default-roles}	default-roles-master	cd46632c-69f1-497f-9031-bf38463e0408	\N	\N
09837d60-dd9c-455b-b83f-ac2b33509562	cd46632c-69f1-497f-9031-bf38463e0408	f	${role_create-realm}	create-realm	cd46632c-69f1-497f-9031-bf38463e0408	\N	\N
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	cd46632c-69f1-497f-9031-bf38463e0408	f	${role_admin}	admin	cd46632c-69f1-497f-9031-bf38463e0408	\N	\N
1fb46438-c9ad-4aa8-bb56-8ecc1bbbc932	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_create-client}	create-client	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
98a86a72-46e8-4f56-857c-6bf2b5278d09	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_view-realm}	view-realm	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
46bcb255-c3d1-426a-be67-1feb2bbe10b2	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_view-users}	view-users	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
75b43702-2a70-4b66-95f3-f5ff6fc5bef5	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_view-clients}	view-clients	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
6021131b-cf68-4a6f-b530-5e370a63deef	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_view-events}	view-events	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
55baa13f-bfe0-4f9d-93ae-eef726480f29	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_view-identity-providers}	view-identity-providers	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
e49f74df-86bb-4384-a3b7-a95bdb7a423e	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_view-authorization}	view-authorization	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
91cadc22-8466-4e6d-8130-b44e2087863a	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_manage-realm}	manage-realm	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
ed539b29-1f7f-4665-91e8-10bd20ec420c	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_manage-users}	manage-users	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
144e470c-8387-44b6-931c-dfba02367e94	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_manage-clients}	manage-clients	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
6ad0cb17-b6b5-4835-a658-6e3882b828db	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_manage-events}	manage-events	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
7e9118d2-5c38-4a01-a133-144a4490b1e0	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_manage-identity-providers}	manage-identity-providers	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
60e74c66-34fc-4267-8af3-4320907285ce	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_manage-authorization}	manage-authorization	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
80763aa8-804e-4a04-ae5c-120617faa943	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_query-users}	query-users	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
2f2fb271-7dd2-4fd3-8e08-5c9d091db2af	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_query-clients}	query-clients	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
b8124c45-6397-40b2-96cf-4ca1e5095038	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_query-realms}	query-realms	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
d354ae41-8552-4c34-9aaa-bb53d6b1f1c5	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_query-groups}	query-groups	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
f5c4df63-fc5e-4c1d-ae55-485f80773689	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_view-profile}	view-profile	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
1cc34ee1-4b68-4cdc-8fdd-2b34cd995980	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_manage-account}	manage-account	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
dbfb2134-93c9-4b36-a924-c9b49cf965a4	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_manage-account-links}	manage-account-links	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
327bf0ea-0f34-4922-ba8b-306b9d8fa663	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_view-applications}	view-applications	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
a0eca6bd-e8ec-452a-b2c1-6b7f58683c25	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_view-consent}	view-consent	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
f8ae2501-449c-4da2-86c9-4372eb08d487	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_manage-consent}	manage-consent	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
249ffc42-1157-4674-a780-19367a1ef17e	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_view-groups}	view-groups	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
45f5ba79-2df6-4501-b7a3-c38f51e5b3ea	521c195c-dd2d-4e62-8744-c182e43c4da6	t	${role_delete-account}	delete-account	cd46632c-69f1-497f-9031-bf38463e0408	521c195c-dd2d-4e62-8744-c182e43c4da6	\N
86e43f44-a153-45b1-bed1-86825381db56	dd92e899-9b9c-4ca2-8637-927a1e67153c	t	${role_read-token}	read-token	cd46632c-69f1-497f-9031-bf38463e0408	dd92e899-9b9c-4ca2-8637-927a1e67153c	\N
6b4e3db0-fb9b-44b6-aa1a-9569b619e61e	a040f4c6-9ecb-4df9-8040-58922ebbac94	t	${role_impersonation}	impersonation	cd46632c-69f1-497f-9031-bf38463e0408	a040f4c6-9ecb-4df9-8040-58922ebbac94	\N
a0f5f6f9-1b5b-4191-b7a7-890e8bea62cb	cd46632c-69f1-497f-9031-bf38463e0408	f	${role_offline-access}	offline_access	cd46632c-69f1-497f-9031-bf38463e0408	\N	\N
3bc377a0-1593-457b-b3cc-23d9d19a6eb5	cd46632c-69f1-497f-9031-bf38463e0408	f	${role_uma_authorization}	uma_authorization	cd46632c-69f1-497f-9031-bf38463e0408	\N	\N
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	09837d60-dd9c-455b-b83f-ac2b33509562
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	1fb46438-c9ad-4aa8-bb56-8ecc1bbbc932
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	98a86a72-46e8-4f56-857c-6bf2b5278d09
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	46bcb255-c3d1-426a-be67-1feb2bbe10b2
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	75b43702-2a70-4b66-95f3-f5ff6fc5bef5
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	6021131b-cf68-4a6f-b530-5e370a63deef
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	55baa13f-bfe0-4f9d-93ae-eef726480f29
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	e49f74df-86bb-4384-a3b7-a95bdb7a423e
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	91cadc22-8466-4e6d-8130-b44e2087863a
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	ed539b29-1f7f-4665-91e8-10bd20ec420c
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	144e470c-8387-44b6-931c-dfba02367e94
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	6ad0cb17-b6b5-4835-a658-6e3882b828db
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	7e9118d2-5c38-4a01-a133-144a4490b1e0
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	60e74c66-34fc-4267-8af3-4320907285ce
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	80763aa8-804e-4a04-ae5c-120617faa943
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	2f2fb271-7dd2-4fd3-8e08-5c9d091db2af
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	b8124c45-6397-40b2-96cf-4ca1e5095038
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	d354ae41-8552-4c34-9aaa-bb53d6b1f1c5
46bcb255-c3d1-426a-be67-1feb2bbe10b2	80763aa8-804e-4a04-ae5c-120617faa943
46bcb255-c3d1-426a-be67-1feb2bbe10b2	d354ae41-8552-4c34-9aaa-bb53d6b1f1c5
75b43702-2a70-4b66-95f3-f5ff6fc5bef5	2f2fb271-7dd2-4fd3-8e08-5c9d091db2af
81b8ee1e-d296-4fea-bd12-21fd04fbfcdc	f5c4df63-fc5e-4c1d-ae55-485f80773689
81b8ee1e-d296-4fea-bd12-21fd04fbfcdc	1cc34ee1-4b68-4cdc-8fdd-2b34cd995980
1cc34ee1-4b68-4cdc-8fdd-2b34cd995980	dbfb2134-93c9-4b36-a924-c9b49cf965a4
f8ae2501-449c-4da2-86c9-4372eb08d487	a0eca6bd-e8ec-452a-b2c1-6b7f58683c25
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	6b4e3db0-fb9b-44b6-aa1a-9569b619e61e
81b8ee1e-d296-4fea-bd12-21fd04fbfcdc	a0f5f6f9-1b5b-4191-b7a7-890e8bea62cb
81b8ee1e-d296-4fea-bd12-21fd04fbfcdc	3bc377a0-1593-457b-b3cc-23d9d19a6eb5
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
67b968c8-2227-429c-9e97-8a7e93b6fd94	\N	19359ce2-8aa1-4489-9375-88df53405444	f	t	\N	\N	\N	cd46632c-69f1-497f-9031-bf38463e0408	admin	1714592951837	\N	0
e114598a-93aa-4aa1-b535-736ea1d85ff7	jane@example.com	jane@example.com	t	t	\N	Jane	Doe	cd46632c-69f1-497f-9031-bf38463e0408	jane@example.com	1714593122189	\N	0
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
46c4d9c2-22d5-461d-b0b1-5d485b4f3c20	\N	password	67b968c8-2227-429c-9e97-8a7e93b6fd94	1714592952068	\N	{"value":"QyMPCiM/NdW+1cQJ04Bsitska4MPfLLaiba7dgB7L9+9cySGFbS0WP7ElbzpwfdayYEqn+FT/wbEDk/T5SekpA==","salt":"nKYwJOoL1pXoFWVIOlQmuw==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
9a7832ad-a93e-4ae8-9d9b-afe29e91024e	\N	password	e114598a-93aa-4aa1-b535-736ea1d85ff7	1714593146854	My password	{"value":"t12zovule4EDCO4Noe1/7fM6JuLyhZbp2mYsMdc1LvPdGBBadILI7OEWB3Q7hHrZ0zSZbCGccTgvkM4uBZ/HRQ==","salt":"fZy0R0XAindsMutAFWgxeA==","additionalParameters":{}}	{"hashIterations":210000,"algorithm":"pbkdf2-sha512","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-05-01 19:49:09.919656	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	4592949724
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-05-01 19:49:09.926616	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.25.1	\N	\N	4592949724
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-05-01 19:49:09.947681	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.25.1	\N	\N	4592949724
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-05-01 19:49:09.949876	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	4592949724
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-05-01 19:49:09.990976	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	4592949724
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-05-01 19:49:09.993194	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.25.1	\N	\N	4592949724
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-05-01 19:49:10.025245	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	4592949724
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-05-01 19:49:10.027392	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.25.1	\N	\N	4592949724
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-05-01 19:49:10.02992	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.25.1	\N	\N	4592949724
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-05-01 19:49:10.069459	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.25.1	\N	\N	4592949724
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-05-01 19:49:10.096823	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	4592949724
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-05-01 19:49:10.098549	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	4592949724
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-05-01 19:49:10.10687	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.25.1	\N	\N	4592949724
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:49:10.114237	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.25.1	\N	\N	4592949724
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:49:10.114893	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4592949724
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:49:10.116249	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.25.1	\N	\N	4592949724
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-05-01 19:49:10.1178	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.25.1	\N	\N	4592949724
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-05-01 19:49:10.136001	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.25.1	\N	\N	4592949724
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-05-01 19:49:10.153778	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	4592949724
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-05-01 19:49:10.155812	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	4592949724
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:49:10.535532	119	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.25.1	\N	\N	4592949724
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-05-01 19:49:10.157042	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.25.1	\N	\N	4592949724
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-05-01 19:49:10.158149	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.25.1	\N	\N	4592949724
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-05-01 19:49:10.167776	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.25.1	\N	\N	4592949724
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-05-01 19:49:10.170169	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	4592949724
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-05-01 19:49:10.170855	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.25.1	\N	\N	4592949724
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-05-01 19:49:10.184693	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.25.1	\N	\N	4592949724
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-05-01 19:49:10.212972	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.25.1	\N	\N	4592949724
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-05-01 19:49:10.21446	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	4592949724
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-05-01 19:49:10.239117	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.25.1	\N	\N	4592949724
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-05-01 19:49:10.24397	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.25.1	\N	\N	4592949724
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-05-01 19:49:10.251646	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.25.1	\N	\N	4592949724
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-05-01 19:49:10.254692	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.25.1	\N	\N	4592949724
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:49:10.257917	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4592949724
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:49:10.258833	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	4592949724
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:49:10.269572	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.25.1	\N	\N	4592949724
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:49:10.271535	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.25.1	\N	\N	4592949724
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-05-01 19:49:10.273505	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4592949724
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-05-01 19:49:10.275063	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.25.1	\N	\N	4592949724
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-05-01 19:49:10.276336	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.25.1	\N	\N	4592949724
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:49:10.276809	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	4592949724
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:49:10.277603	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.25.1	\N	\N	4592949724
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:49:10.280409	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.25.1	\N	\N	4592949724
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-05-01 19:49:10.313551	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.25.1	\N	\N	4592949724
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-05-01 19:49:10.315155	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.25.1	\N	\N	4592949724
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:49:10.317392	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	4592949724
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:49:10.320522	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.25.1	\N	\N	4592949724
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:49:10.3216	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.25.1	\N	\N	4592949724
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:49:10.33396	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.25.1	\N	\N	4592949724
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-05-01 19:49:10.335471	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.25.1	\N	\N	4592949724
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-05-01 19:49:10.346603	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.25.1	\N	\N	4592949724
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-05-01 19:49:10.355578	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.25.1	\N	\N	4592949724
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-05-01 19:49:10.356736	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-05-01 19:49:10.357649	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.25.1	\N	\N	4592949724
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-05-01 19:49:10.358565	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.25.1	\N	\N	4592949724
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:49:10.360354	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.25.1	\N	\N	4592949724
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:49:10.361933	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.25.1	\N	\N	4592949724
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:49:10.368356	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.25.1	\N	\N	4592949724
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-05-01 19:49:10.395568	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.25.1	\N	\N	4592949724
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-05-01 19:49:10.404094	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.25.1	\N	\N	4592949724
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-05-01 19:49:10.406144	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.25.1	\N	\N	4592949724
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-05-01 19:49:10.41027	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.25.1	\N	\N	4592949724
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-05-01 19:49:10.41205	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.25.1	\N	\N	4592949724
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-05-01 19:49:10.413166	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	4592949724
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-05-01 19:49:10.414432	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.25.1	\N	\N	4592949724
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-05-01 19:49:10.416087	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.25.1	\N	\N	4592949724
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-05-01 19:49:10.421089	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.25.1	\N	\N	4592949724
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-05-01 19:49:10.422888	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.25.1	\N	\N	4592949724
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-05-01 19:49:10.424613	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.25.1	\N	\N	4592949724
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-05-01 19:49:10.430099	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.25.1	\N	\N	4592949724
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-05-01 19:49:10.432092	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.25.1	\N	\N	4592949724
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-05-01 19:49:10.433422	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	4592949724
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:49:10.435683	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	4592949724
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:49:10.438114	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	4592949724
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:49:10.438831	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.25.1	\N	\N	4592949724
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:49:10.445621	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.25.1	\N	\N	4592949724
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-05-01 19:49:10.448033	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.25.1	\N	\N	4592949724
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:49:10.449291	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.25.1	\N	\N	4592949724
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:49:10.449796	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.25.1	\N	\N	4592949724
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:49:10.455451	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.25.1	\N	\N	4592949724
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-05-01 19:49:10.456154	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.25.1	\N	\N	4592949724
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:49:10.458226	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.25.1	\N	\N	4592949724
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:49:10.458708	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4592949724
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:49:10.460461	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4592949724
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:49:10.460924	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.25.1	\N	\N	4592949724
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-05-01 19:49:10.462631	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	4592949724
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-05-01 19:49:10.464426	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.25.1	\N	\N	4592949724
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-05-01 19:49:10.466538	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.25.1	\N	\N	4592949724
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-05-01 19:49:10.469246	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.25.1	\N	\N	4592949724
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.472202	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.25.1	\N	\N	4592949724
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.474058	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.25.1	\N	\N	4592949724
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.475705	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4592949724
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.477882	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.25.1	\N	\N	4592949724
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.478285	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	4592949724
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.480725	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.25.1	\N	\N	4592949724
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.481327	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.25.1	\N	\N	4592949724
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-05-01 19:49:10.483279	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.25.1	\N	\N	4592949724
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:49:10.486247	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4592949724
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:49:10.486713	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:49:10.491626	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:49:10.494727	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:49:10.49536	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:49:10.497209	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.25.1	\N	\N	4592949724
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-05-01 19:49:10.499759	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.25.1	\N	\N	4592949724
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-05-01 19:49:10.501828	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.25.1	\N	\N	4592949724
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-05-01 19:49:10.504036	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.25.1	\N	\N	4592949724
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-05-01 19:49:10.506039	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.25.1	\N	\N	4592949724
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-05-01 19:49:10.508843	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.25.1	\N	\N	4592949724
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-01 19:49:10.511109	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	4592949724
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-01 19:49:10.51157	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.25.1	\N	\N	4592949724
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-05-01 19:49:10.513541	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-05-01 19:49:10.515796	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.25.1	\N	\N	4592949724
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-05-01 19:49:10.522237	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.25.1	\N	\N	4592949724
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-05-01 19:49:10.522955	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.25.1	\N	\N	4592949724
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-05-01 19:49:10.52542	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.25.1	\N	\N	4592949724
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-05-01 19:49:10.526079	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.25.1	\N	\N	4592949724
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-05-01 19:49:10.527998	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.25.1	\N	\N	4592949724
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-05-01 19:49:10.528931	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.25.1	\N	\N	4592949724
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:49:10.533344	118	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.25.1	\N	\N	4592949724
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:49:10.537523	120	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-05-01 19:49:10.539414	121	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-01 19:49:10.54137	122	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.25.1	\N	\N	4592949724
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-01 19:49:10.541788	123	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-05-01 19:49:10.542445	124	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4592949724
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
cd46632c-69f1-497f-9031-bf38463e0408	32b2850f-16f2-437a-9784-e83a13869861	f
cd46632c-69f1-497f-9031-bf38463e0408	9be9eeaf-2d8b-47ae-a11c-2ac0f5099517	t
cd46632c-69f1-497f-9031-bf38463e0408	2ba81a93-6b0a-4b11-ab3c-19a279528bff	t
cd46632c-69f1-497f-9031-bf38463e0408	1b0fe457-15f9-4155-bc8c-49dd2904ebfd	t
cd46632c-69f1-497f-9031-bf38463e0408	421d4db1-26a1-4c97-b94f-5443e863d64e	f
cd46632c-69f1-497f-9031-bf38463e0408	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b	f
cd46632c-69f1-497f-9031-bf38463e0408	7edb7d36-0bfd-467d-a7d1-119cb65e3d97	t
cd46632c-69f1-497f-9031-bf38463e0408	ab53b5c3-41ac-4888-be12-c0c83e57a7b5	t
cd46632c-69f1-497f-9031-bf38463e0408	eeecb63d-ff33-4a26-99c3-72c23ec6b555	f
cd46632c-69f1-497f-9031-bf38463e0408	f85e1541-3228-479b-b938-19d0141e5d26	t
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
bfdy4	24.0.3	1714592950
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
c33f8063-9aa9-49a6-9751-fb769cd2889f	audience resolve	openid-connect	oidc-audience-resolve-mapper	8c6bafd8-48a1-4da8-94fc-25378e8733ab	\N
8d83828a-a954-4558-bdc8-2bf874f32353	locale	openid-connect	oidc-usermodel-attribute-mapper	7664f82c-57ea-41d1-a5ee-3199b5893a2c	\N
ef24341d-3525-4ef0-b3e0-5bf3051305b9	role list	saml	saml-role-list-mapper	\N	9be9eeaf-2d8b-47ae-a11c-2ac0f5099517
7aba34c6-30ae-4efd-8b7a-b7bf5fac6b6a	full name	openid-connect	oidc-full-name-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
c890313e-4658-401b-be20-95f73756fd1e	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
eb6f146c-fcb4-4827-9b37-6dcec1754a52	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
423e2792-ec38-432c-819e-3edd5606793b	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
aff4f735-5fff-4c3d-9e81-e7983d942326	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
9e3147b3-ee78-43a7-8c39-d270829f772a	username	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
8328af08-e3b2-476d-a928-2c1ab43b3aeb	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
81724651-9a15-4419-af31-24dde715aac9	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	website	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
31d48819-4919-4864-896b-a4acab24c011	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
b01601c6-de69-4f12-835f-1fadaef95bff	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
cc708af4-ca24-4cb5-a049-5dbfd6be01da	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
e0f815ed-fa29-4de8-a769-f2a1117a2eec	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	2ba81a93-6b0a-4b11-ab3c-19a279528bff
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	email	openid-connect	oidc-usermodel-attribute-mapper	\N	1b0fe457-15f9-4155-bc8c-49dd2904ebfd
3bc595b9-49e3-4993-9aa9-ef428af98378	email verified	openid-connect	oidc-usermodel-property-mapper	\N	1b0fe457-15f9-4155-bc8c-49dd2904ebfd
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	address	openid-connect	oidc-address-mapper	\N	421d4db1-26a1-4c97-b94f-5443e863d64e
414413a8-f3f3-4d44-a545-76ea2adb93de	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	5bba72f3-dfac-4859-8d47-b4fc81ba8e0b
ac603a51-38be-4a31-af58-735ab22be727	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	7edb7d36-0bfd-467d-a7d1-119cb65e3d97
ca0f283a-d12d-4b9e-a6d0-95a93e17ac5f	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	7edb7d36-0bfd-467d-a7d1-119cb65e3d97
d42f3321-9b06-4440-ace5-0af754656f34	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	7edb7d36-0bfd-467d-a7d1-119cb65e3d97
5c430a4a-c380-4d64-8e3c-471dbe8043d9	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ab53b5c3-41ac-4888-be12-c0c83e57a7b5
ac4909fd-942a-46c9-9d38-27c15bfd0c07	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	eeecb63d-ff33-4a26-99c3-72c23ec6b555
c8eda691-733d-4b15-b128-9ee21a6b0188	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	eeecb63d-ff33-4a26-99c3-72c23ec6b555
1843800b-1880-462b-a4e5-9912a2871614	acr loa level	openid-connect	oidc-acr-mapper	\N	f85e1541-3228-479b-b938-19d0141e5d26
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
8d83828a-a954-4558-bdc8-2bf874f32353	true	introspection.token.claim
8d83828a-a954-4558-bdc8-2bf874f32353	true	userinfo.token.claim
8d83828a-a954-4558-bdc8-2bf874f32353	locale	user.attribute
8d83828a-a954-4558-bdc8-2bf874f32353	true	id.token.claim
8d83828a-a954-4558-bdc8-2bf874f32353	true	access.token.claim
8d83828a-a954-4558-bdc8-2bf874f32353	locale	claim.name
8d83828a-a954-4558-bdc8-2bf874f32353	String	jsonType.label
ef24341d-3525-4ef0-b3e0-5bf3051305b9	false	single
ef24341d-3525-4ef0-b3e0-5bf3051305b9	Basic	attribute.nameformat
ef24341d-3525-4ef0-b3e0-5bf3051305b9	Role	attribute.name
31d48819-4919-4864-896b-a4acab24c011	true	introspection.token.claim
31d48819-4919-4864-896b-a4acab24c011	true	userinfo.token.claim
31d48819-4919-4864-896b-a4acab24c011	gender	user.attribute
31d48819-4919-4864-896b-a4acab24c011	true	id.token.claim
31d48819-4919-4864-896b-a4acab24c011	true	access.token.claim
31d48819-4919-4864-896b-a4acab24c011	gender	claim.name
31d48819-4919-4864-896b-a4acab24c011	String	jsonType.label
423e2792-ec38-432c-819e-3edd5606793b	true	introspection.token.claim
423e2792-ec38-432c-819e-3edd5606793b	true	userinfo.token.claim
423e2792-ec38-432c-819e-3edd5606793b	middleName	user.attribute
423e2792-ec38-432c-819e-3edd5606793b	true	id.token.claim
423e2792-ec38-432c-819e-3edd5606793b	true	access.token.claim
423e2792-ec38-432c-819e-3edd5606793b	middle_name	claim.name
423e2792-ec38-432c-819e-3edd5606793b	String	jsonType.label
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	true	introspection.token.claim
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	true	userinfo.token.claim
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	website	user.attribute
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	true	id.token.claim
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	true	access.token.claim
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	website	claim.name
6083b330-e8e8-4ab8-b44f-0e458dcdfa74	String	jsonType.label
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	true	introspection.token.claim
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	true	userinfo.token.claim
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	updatedAt	user.attribute
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	true	id.token.claim
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	true	access.token.claim
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	updated_at	claim.name
6a0f7a01-d7b7-4c7a-b09d-bb571bc4bdc3	long	jsonType.label
7aba34c6-30ae-4efd-8b7a-b7bf5fac6b6a	true	introspection.token.claim
7aba34c6-30ae-4efd-8b7a-b7bf5fac6b6a	true	userinfo.token.claim
7aba34c6-30ae-4efd-8b7a-b7bf5fac6b6a	true	id.token.claim
7aba34c6-30ae-4efd-8b7a-b7bf5fac6b6a	true	access.token.claim
81724651-9a15-4419-af31-24dde715aac9	true	introspection.token.claim
81724651-9a15-4419-af31-24dde715aac9	true	userinfo.token.claim
81724651-9a15-4419-af31-24dde715aac9	picture	user.attribute
81724651-9a15-4419-af31-24dde715aac9	true	id.token.claim
81724651-9a15-4419-af31-24dde715aac9	true	access.token.claim
81724651-9a15-4419-af31-24dde715aac9	picture	claim.name
81724651-9a15-4419-af31-24dde715aac9	String	jsonType.label
8328af08-e3b2-476d-a928-2c1ab43b3aeb	true	introspection.token.claim
8328af08-e3b2-476d-a928-2c1ab43b3aeb	true	userinfo.token.claim
8328af08-e3b2-476d-a928-2c1ab43b3aeb	profile	user.attribute
8328af08-e3b2-476d-a928-2c1ab43b3aeb	true	id.token.claim
8328af08-e3b2-476d-a928-2c1ab43b3aeb	true	access.token.claim
8328af08-e3b2-476d-a928-2c1ab43b3aeb	profile	claim.name
8328af08-e3b2-476d-a928-2c1ab43b3aeb	String	jsonType.label
9e3147b3-ee78-43a7-8c39-d270829f772a	true	introspection.token.claim
9e3147b3-ee78-43a7-8c39-d270829f772a	true	userinfo.token.claim
9e3147b3-ee78-43a7-8c39-d270829f772a	username	user.attribute
9e3147b3-ee78-43a7-8c39-d270829f772a	true	id.token.claim
9e3147b3-ee78-43a7-8c39-d270829f772a	true	access.token.claim
9e3147b3-ee78-43a7-8c39-d270829f772a	preferred_username	claim.name
9e3147b3-ee78-43a7-8c39-d270829f772a	String	jsonType.label
aff4f735-5fff-4c3d-9e81-e7983d942326	true	introspection.token.claim
aff4f735-5fff-4c3d-9e81-e7983d942326	true	userinfo.token.claim
aff4f735-5fff-4c3d-9e81-e7983d942326	nickname	user.attribute
aff4f735-5fff-4c3d-9e81-e7983d942326	true	id.token.claim
aff4f735-5fff-4c3d-9e81-e7983d942326	true	access.token.claim
aff4f735-5fff-4c3d-9e81-e7983d942326	nickname	claim.name
aff4f735-5fff-4c3d-9e81-e7983d942326	String	jsonType.label
b01601c6-de69-4f12-835f-1fadaef95bff	true	introspection.token.claim
b01601c6-de69-4f12-835f-1fadaef95bff	true	userinfo.token.claim
b01601c6-de69-4f12-835f-1fadaef95bff	birthdate	user.attribute
b01601c6-de69-4f12-835f-1fadaef95bff	true	id.token.claim
b01601c6-de69-4f12-835f-1fadaef95bff	true	access.token.claim
b01601c6-de69-4f12-835f-1fadaef95bff	birthdate	claim.name
b01601c6-de69-4f12-835f-1fadaef95bff	String	jsonType.label
c890313e-4658-401b-be20-95f73756fd1e	true	introspection.token.claim
c890313e-4658-401b-be20-95f73756fd1e	true	userinfo.token.claim
c890313e-4658-401b-be20-95f73756fd1e	lastName	user.attribute
c890313e-4658-401b-be20-95f73756fd1e	true	id.token.claim
c890313e-4658-401b-be20-95f73756fd1e	true	access.token.claim
c890313e-4658-401b-be20-95f73756fd1e	family_name	claim.name
c890313e-4658-401b-be20-95f73756fd1e	String	jsonType.label
cc708af4-ca24-4cb5-a049-5dbfd6be01da	true	introspection.token.claim
cc708af4-ca24-4cb5-a049-5dbfd6be01da	true	userinfo.token.claim
cc708af4-ca24-4cb5-a049-5dbfd6be01da	zoneinfo	user.attribute
cc708af4-ca24-4cb5-a049-5dbfd6be01da	true	id.token.claim
cc708af4-ca24-4cb5-a049-5dbfd6be01da	true	access.token.claim
cc708af4-ca24-4cb5-a049-5dbfd6be01da	zoneinfo	claim.name
cc708af4-ca24-4cb5-a049-5dbfd6be01da	String	jsonType.label
e0f815ed-fa29-4de8-a769-f2a1117a2eec	true	introspection.token.claim
e0f815ed-fa29-4de8-a769-f2a1117a2eec	true	userinfo.token.claim
e0f815ed-fa29-4de8-a769-f2a1117a2eec	locale	user.attribute
e0f815ed-fa29-4de8-a769-f2a1117a2eec	true	id.token.claim
e0f815ed-fa29-4de8-a769-f2a1117a2eec	true	access.token.claim
e0f815ed-fa29-4de8-a769-f2a1117a2eec	locale	claim.name
e0f815ed-fa29-4de8-a769-f2a1117a2eec	String	jsonType.label
eb6f146c-fcb4-4827-9b37-6dcec1754a52	true	introspection.token.claim
eb6f146c-fcb4-4827-9b37-6dcec1754a52	true	userinfo.token.claim
eb6f146c-fcb4-4827-9b37-6dcec1754a52	firstName	user.attribute
eb6f146c-fcb4-4827-9b37-6dcec1754a52	true	id.token.claim
eb6f146c-fcb4-4827-9b37-6dcec1754a52	true	access.token.claim
eb6f146c-fcb4-4827-9b37-6dcec1754a52	given_name	claim.name
eb6f146c-fcb4-4827-9b37-6dcec1754a52	String	jsonType.label
3bc595b9-49e3-4993-9aa9-ef428af98378	true	introspection.token.claim
3bc595b9-49e3-4993-9aa9-ef428af98378	true	userinfo.token.claim
3bc595b9-49e3-4993-9aa9-ef428af98378	emailVerified	user.attribute
3bc595b9-49e3-4993-9aa9-ef428af98378	true	id.token.claim
3bc595b9-49e3-4993-9aa9-ef428af98378	true	access.token.claim
3bc595b9-49e3-4993-9aa9-ef428af98378	email_verified	claim.name
3bc595b9-49e3-4993-9aa9-ef428af98378	boolean	jsonType.label
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	true	introspection.token.claim
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	true	userinfo.token.claim
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	email	user.attribute
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	true	id.token.claim
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	true	access.token.claim
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	email	claim.name
c2faaed9-5bc3-4dae-bd4f-cca72778d1e4	String	jsonType.label
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	formatted	user.attribute.formatted
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	country	user.attribute.country
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	true	introspection.token.claim
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	postal_code	user.attribute.postal_code
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	true	userinfo.token.claim
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	street	user.attribute.street
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	true	id.token.claim
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	region	user.attribute.region
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	true	access.token.claim
0ec0853b-fb1a-4d32-a5cc-9f43eec84277	locality	user.attribute.locality
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	true	introspection.token.claim
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	true	userinfo.token.claim
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	phoneNumberVerified	user.attribute
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	true	id.token.claim
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	true	access.token.claim
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	phone_number_verified	claim.name
06f533bf-99e7-4e2b-8cb6-ccfc9b544501	boolean	jsonType.label
414413a8-f3f3-4d44-a545-76ea2adb93de	true	introspection.token.claim
414413a8-f3f3-4d44-a545-76ea2adb93de	true	userinfo.token.claim
414413a8-f3f3-4d44-a545-76ea2adb93de	phoneNumber	user.attribute
414413a8-f3f3-4d44-a545-76ea2adb93de	true	id.token.claim
414413a8-f3f3-4d44-a545-76ea2adb93de	true	access.token.claim
414413a8-f3f3-4d44-a545-76ea2adb93de	phone_number	claim.name
414413a8-f3f3-4d44-a545-76ea2adb93de	String	jsonType.label
ac603a51-38be-4a31-af58-735ab22be727	true	introspection.token.claim
ac603a51-38be-4a31-af58-735ab22be727	true	multivalued
ac603a51-38be-4a31-af58-735ab22be727	foo	user.attribute
ac603a51-38be-4a31-af58-735ab22be727	true	access.token.claim
ac603a51-38be-4a31-af58-735ab22be727	realm_access.roles	claim.name
ac603a51-38be-4a31-af58-735ab22be727	String	jsonType.label
ca0f283a-d12d-4b9e-a6d0-95a93e17ac5f	true	introspection.token.claim
ca0f283a-d12d-4b9e-a6d0-95a93e17ac5f	true	multivalued
ca0f283a-d12d-4b9e-a6d0-95a93e17ac5f	foo	user.attribute
ca0f283a-d12d-4b9e-a6d0-95a93e17ac5f	true	access.token.claim
ca0f283a-d12d-4b9e-a6d0-95a93e17ac5f	resource_access.${client_id}.roles	claim.name
ca0f283a-d12d-4b9e-a6d0-95a93e17ac5f	String	jsonType.label
d42f3321-9b06-4440-ace5-0af754656f34	true	introspection.token.claim
d42f3321-9b06-4440-ace5-0af754656f34	true	access.token.claim
5c430a4a-c380-4d64-8e3c-471dbe8043d9	true	introspection.token.claim
5c430a4a-c380-4d64-8e3c-471dbe8043d9	true	access.token.claim
ac4909fd-942a-46c9-9d38-27c15bfd0c07	true	introspection.token.claim
ac4909fd-942a-46c9-9d38-27c15bfd0c07	true	userinfo.token.claim
ac4909fd-942a-46c9-9d38-27c15bfd0c07	username	user.attribute
ac4909fd-942a-46c9-9d38-27c15bfd0c07	true	id.token.claim
ac4909fd-942a-46c9-9d38-27c15bfd0c07	true	access.token.claim
ac4909fd-942a-46c9-9d38-27c15bfd0c07	upn	claim.name
ac4909fd-942a-46c9-9d38-27c15bfd0c07	String	jsonType.label
c8eda691-733d-4b15-b128-9ee21a6b0188	true	introspection.token.claim
c8eda691-733d-4b15-b128-9ee21a6b0188	true	multivalued
c8eda691-733d-4b15-b128-9ee21a6b0188	foo	user.attribute
c8eda691-733d-4b15-b128-9ee21a6b0188	true	id.token.claim
c8eda691-733d-4b15-b128-9ee21a6b0188	true	access.token.claim
c8eda691-733d-4b15-b128-9ee21a6b0188	groups	claim.name
c8eda691-733d-4b15-b128-9ee21a6b0188	String	jsonType.label
1843800b-1880-462b-a4e5-9912a2871614	true	introspection.token.claim
1843800b-1880-462b-a4e5-9912a2871614	true	id.token.claim
1843800b-1880-462b-a4e5-9912a2871614	true	access.token.claim
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
bruteForceProtected	cd46632c-69f1-497f-9031-bf38463e0408	false
permanentLockout	cd46632c-69f1-497f-9031-bf38463e0408	false
maxTemporaryLockouts	cd46632c-69f1-497f-9031-bf38463e0408	0
maxFailureWaitSeconds	cd46632c-69f1-497f-9031-bf38463e0408	900
minimumQuickLoginWaitSeconds	cd46632c-69f1-497f-9031-bf38463e0408	60
waitIncrementSeconds	cd46632c-69f1-497f-9031-bf38463e0408	60
quickLoginCheckMilliSeconds	cd46632c-69f1-497f-9031-bf38463e0408	1000
maxDeltaTimeSeconds	cd46632c-69f1-497f-9031-bf38463e0408	43200
failureFactor	cd46632c-69f1-497f-9031-bf38463e0408	30
realmReusableOtpCode	cd46632c-69f1-497f-9031-bf38463e0408	false
firstBrokerLoginFlowId	cd46632c-69f1-497f-9031-bf38463e0408	f8179c2f-a9b7-4da6-a76a-a8bff3bc04f5
displayName	cd46632c-69f1-497f-9031-bf38463e0408	Keycloak
displayNameHtml	cd46632c-69f1-497f-9031-bf38463e0408	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	cd46632c-69f1-497f-9031-bf38463e0408	RS256
offlineSessionMaxLifespanEnabled	cd46632c-69f1-497f-9031-bf38463e0408	false
offlineSessionMaxLifespan	cd46632c-69f1-497f-9031-bf38463e0408	5184000
cibaBackchannelTokenDeliveryMode	cd46632c-69f1-497f-9031-bf38463e0408	poll
cibaExpiresIn	cd46632c-69f1-497f-9031-bf38463e0408	120
cibaAuthRequestedUserHint	cd46632c-69f1-497f-9031-bf38463e0408	login_hint
parRequestUriLifespan	cd46632c-69f1-497f-9031-bf38463e0408	60
cibaInterval	cd46632c-69f1-497f-9031-bf38463e0408	5
actionTokenGeneratedByAdminLifespan	cd46632c-69f1-497f-9031-bf38463e0408	43200
actionTokenGeneratedByUserLifespan	cd46632c-69f1-497f-9031-bf38463e0408	300
oauth2DeviceCodeLifespan	cd46632c-69f1-497f-9031-bf38463e0408	600
oauth2DevicePollingInterval	cd46632c-69f1-497f-9031-bf38463e0408	5
clientSessionIdleTimeout	cd46632c-69f1-497f-9031-bf38463e0408	0
clientSessionMaxLifespan	cd46632c-69f1-497f-9031-bf38463e0408	0
clientOfflineSessionIdleTimeout	cd46632c-69f1-497f-9031-bf38463e0408	0
clientOfflineSessionMaxLifespan	cd46632c-69f1-497f-9031-bf38463e0408	0
webAuthnPolicyRpEntityName	cd46632c-69f1-497f-9031-bf38463e0408	keycloak
webAuthnPolicySignatureAlgorithms	cd46632c-69f1-497f-9031-bf38463e0408	ES256
webAuthnPolicyRpId	cd46632c-69f1-497f-9031-bf38463e0408	
webAuthnPolicyAttestationConveyancePreference	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyAuthenticatorAttachment	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyRequireResidentKey	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyUserVerificationRequirement	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyCreateTimeout	cd46632c-69f1-497f-9031-bf38463e0408	0
webAuthnPolicyAvoidSameAuthenticatorRegister	cd46632c-69f1-497f-9031-bf38463e0408	false
webAuthnPolicyRpEntityNamePasswordless	cd46632c-69f1-497f-9031-bf38463e0408	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	cd46632c-69f1-497f-9031-bf38463e0408	ES256
webAuthnPolicyRpIdPasswordless	cd46632c-69f1-497f-9031-bf38463e0408	
webAuthnPolicyAttestationConveyancePreferencePasswordless	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyRequireResidentKeyPasswordless	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	cd46632c-69f1-497f-9031-bf38463e0408	not specified
webAuthnPolicyCreateTimeoutPasswordless	cd46632c-69f1-497f-9031-bf38463e0408	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	cd46632c-69f1-497f-9031-bf38463e0408	false
client-policies.profiles	cd46632c-69f1-497f-9031-bf38463e0408	{"profiles":[]}
client-policies.policies	cd46632c-69f1-497f-9031-bf38463e0408	{"policies":[]}
frontendUrl	cd46632c-69f1-497f-9031-bf38463e0408	
acr.loa.map	cd46632c-69f1-497f-9031-bf38463e0408	{}
_browser_header.contentSecurityPolicyReportOnly	cd46632c-69f1-497f-9031-bf38463e0408	
_browser_header.xContentTypeOptions	cd46632c-69f1-497f-9031-bf38463e0408	nosniff
_browser_header.referrerPolicy	cd46632c-69f1-497f-9031-bf38463e0408	no-referrer
_browser_header.xRobotsTag	cd46632c-69f1-497f-9031-bf38463e0408	none
_browser_header.xFrameOptions	cd46632c-69f1-497f-9031-bf38463e0408	SAMEORIGIN
_browser_header.contentSecurityPolicy	cd46632c-69f1-497f-9031-bf38463e0408	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	cd46632c-69f1-497f-9031-bf38463e0408	1; mode=block
_browser_header.strictTransportSecurity	cd46632c-69f1-497f-9031-bf38463e0408	max-age=31536000; includeSubDomains
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
cd46632c-69f1-497f-9031-bf38463e0408	jboss-logging
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
password	password	t	t	cd46632c-69f1-497f-9031-bf38463e0408
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
521c195c-dd2d-4e62-8744-c182e43c4da6	/realms/master/account/*
8c6bafd8-48a1-4da8-94fc-25378e8733ab	/realms/master/account/*
7664f82c-57ea-41d1-a5ee-3199b5893a2c	/admin/master/console/*
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
d3460d67-4ef0-4223-9725-30c1f7b3d895	VERIFY_EMAIL	Verify Email	cd46632c-69f1-497f-9031-bf38463e0408	t	f	VERIFY_EMAIL	50
ade4a7d5-470e-495f-a36e-7451f9a76be1	UPDATE_PROFILE	Update Profile	cd46632c-69f1-497f-9031-bf38463e0408	t	f	UPDATE_PROFILE	40
325b2ce7-5d29-4627-9133-7f45a0becfba	CONFIGURE_TOTP	Configure OTP	cd46632c-69f1-497f-9031-bf38463e0408	t	f	CONFIGURE_TOTP	10
8622896f-423b-4392-8516-7c7db6042255	UPDATE_PASSWORD	Update Password	cd46632c-69f1-497f-9031-bf38463e0408	t	f	UPDATE_PASSWORD	30
47ea909e-91cc-4c5f-ae77-3bd2d1fdcd09	TERMS_AND_CONDITIONS	Terms and Conditions	cd46632c-69f1-497f-9031-bf38463e0408	f	f	TERMS_AND_CONDITIONS	20
8d9a84e2-b586-4a12-9542-0efe9de77761	delete_account	Delete Account	cd46632c-69f1-497f-9031-bf38463e0408	f	f	delete_account	60
33051618-5817-436a-9ac9-baca1465f4fe	delete_credential	Delete Credential	cd46632c-69f1-497f-9031-bf38463e0408	t	f	delete_credential	100
60588ebb-0291-49e1-9a70-a22fd08008b3	update_user_locale	Update User Locale	cd46632c-69f1-497f-9031-bf38463e0408	t	f	update_user_locale	1000
80d127e4-5cd7-4f66-bdd5-0e5fa8519e83	UPDATE_EMAIL	Update Email	cd46632c-69f1-497f-9031-bf38463e0408	t	f	UPDATE_EMAIL	70
2be132ea-c298-430f-8ad5-6d0eb52622af	webauthn-register	Webauthn Register	cd46632c-69f1-497f-9031-bf38463e0408	t	f	webauthn-register	70
07d50b20-9da3-4268-922f-45c4dd19568a	webauthn-register-passwordless	Webauthn Register Passwordless	cd46632c-69f1-497f-9031-bf38463e0408	t	f	webauthn-register-passwordless	80
0efcf54b-e7c2-4c7c-9c8f-d1e09b642b06	VERIFY_PROFILE	Verify Profile	cd46632c-69f1-497f-9031-bf38463e0408	t	f	VERIFY_PROFILE	90
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
8c6bafd8-48a1-4da8-94fc-25378e8733ab	1cc34ee1-4b68-4cdc-8fdd-2b34cd995980
8c6bafd8-48a1-4da8-94fc-25378e8733ab	249ffc42-1157-4674-a780-19367a1ef17e
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
81b8ee1e-d296-4fea-bd12-21fd04fbfcdc	67b968c8-2227-429c-9e97-8a7e93b6fd94
db6c57fe-7761-41c6-9c6c-bb7d27bc2b6d	67b968c8-2227-429c-9e97-8a7e93b6fd94
81b8ee1e-d296-4fea-bd12-21fd04fbfcdc	e114598a-93aa-4aa1-b535-736ea1d85ff7
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
7664f82c-57ea-41d1-a5ee-3199b5893a2c	+
\.


--
-- PostgreSQL database dump complete
--

