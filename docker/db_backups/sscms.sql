--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO simple_site_cms;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO simple_site_cms;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: admins_roles; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.admins_roles (
    admin_id bigint,
    role_id bigint
);


ALTER TABLE public.admins_roles OWNER TO simple_site_cms;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO simple_site_cms;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.articles (
    id bigint NOT NULL,
    title character varying,
    status integer,
    content text,
    url_title character varying,
    author_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    published_at timestamp without time zone
);


ALTER TABLE public.articles OWNER TO simple_site_cms;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO simple_site_cms;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    name character varying,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text
);


ALTER TABLE public.authors OWNER TO simple_site_cms;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO simple_site_cms;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    visibility integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE public.categories OWNER TO simple_site_cms;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO simple_site_cms;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categorizations; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.categorizations (
    id bigint NOT NULL,
    category_id bigint,
    article_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categorizations OWNER TO simple_site_cms;

--
-- Name: categorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.categorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorizations_id_seq OWNER TO simple_site_cms;

--
-- Name: categorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.categorizations_id_seq OWNED BY public.categorizations.id;


--
-- Name: footer_sections; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.footer_sections (
    id bigint NOT NULL,
    content text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.footer_sections OWNER TO simple_site_cms;

--
-- Name: footer_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.footer_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.footer_sections_id_seq OWNER TO simple_site_cms;

--
-- Name: footer_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.footer_sections_id_seq OWNED BY public.footer_sections.id;


--
-- Name: header_sections; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.header_sections (
    id bigint NOT NULL,
    content text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.header_sections OWNER TO simple_site_cms;

--
-- Name: header_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.header_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.header_sections_id_seq OWNER TO simple_site_cms;

--
-- Name: header_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.header_sections_id_seq OWNED BY public.header_sections.id;


--
-- Name: nav_sections; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.nav_sections (
    id bigint NOT NULL,
    content text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.nav_sections OWNER TO simple_site_cms;

--
-- Name: nav_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.nav_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nav_sections_id_seq OWNER TO simple_site_cms;

--
-- Name: nav_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.nav_sections_id_seq OWNED BY public.nav_sections.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO simple_site_cms;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO simple_site_cms;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO simple_site_cms;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.sites (
    id bigint NOT NULL,
    title character varying,
    author character varying,
    description text,
    stylesheet_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sites OWNER TO simple_site_cms;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_id_seq OWNER TO simple_site_cms;

--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.sites_id_seq OWNED BY public.sites.id;


--
-- Name: stylesheets; Type: TABLE; Schema: public; Owner: simple_site_cms
--

CREATE TABLE public.stylesheets (
    id bigint NOT NULL,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.stylesheets OWNER TO simple_site_cms;

--
-- Name: stylesheets_id_seq; Type: SEQUENCE; Schema: public; Owner: simple_site_cms
--

CREATE SEQUENCE public.stylesheets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stylesheets_id_seq OWNER TO simple_site_cms;

--
-- Name: stylesheets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simple_site_cms
--

ALTER SEQUENCE public.stylesheets_id_seq OWNED BY public.stylesheets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.categorizations ALTER COLUMN id SET DEFAULT nextval('public.categorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.footer_sections ALTER COLUMN id SET DEFAULT nextval('public.footer_sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.header_sections ALTER COLUMN id SET DEFAULT nextval('public.header_sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.nav_sections ALTER COLUMN id SET DEFAULT nextval('public.nav_sections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.sites ALTER COLUMN id SET DEFAULT nextval('public.sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.stylesheets ALTER COLUMN id SET DEFAULT nextval('public.stylesheets_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	b.sielski@yandex.com	$2a$11$sOMsQ/UyPuFpbNVPPwnE.e.RP5dFQdEhjZLENKefA8NhPWtMk4gSK	\N	\N	2017-07-23 16:59:01.294361	10	2018-04-29 11:57:29.830013	2018-02-04 08:39:28.483813	159.205.162.37	185.140.120.146	2017-07-23 16:55:20.723197	2018-04-29 11:57:29.870082
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Data for Name: admins_roles; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.admins_roles (admin_id, role_id) FROM stdin;
1	1
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2017-07-23 16:06:42.589373	2017-07-23 16:06:42.589373
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.articles (id, title, status, content, url_title, author_id, created_at, updated_at, published_at) FROM stdin;
1	Welcome	1	<h1 id="hello-admin">Hello, Admin!</h1>\n<p>This is a demo of the betha version of a blog CMS called “Simple Blog CMS”.</p>\n<ol>\n  <li>Add go to the <a href="/admin">/admin</a> subpage and login.</li>\n  <li>Read more articles from <a href="/category/4/articles">“The Manual”</a> category.</li>\n</ol>	welcome	1	2017-07-23 16:55:21.066883	2017-07-23 16:55:21.082198	2017-07-23 16:55:21.082198
2	About the Admin Panel	1	<h1 id="the-most-important-page">The most important page</h1>\n<p>The most important page is the <a href="/admin">/admin</a> page. It is used to access log-in page and the Admin Panel page.</p>\n<h1 id="admin-panel-sub-sections">Admin Panel sub-sections</h1>\n<h2 id="create-a-new-category">Create a new category</h2>\n<ul>\n  <li><strong>Name</strong> - displayed name.</li>\n  <li><strong>Description</strong> - not used to anything important. It can be threated as a note about the category use.</li>\n  <li><strong>Visibility</strong> - is the category visible in the main menu or not.</li>\n  <li><strong>Position</strong> - position in the main menu.</li>\n</ul>\n<h2 id="manage-categories">Manage categories</h2>\n<p>It displays all categoies, visible and invisible. If an admin has a proper role (permissions)\nthen it can edit or delete categories. Deleting a category doesn’t delete articles in that category.</p>\n<h2 id="create-a-new-article">Create a new article</h2>\n<ul>\n  <li><strong>Title</strong> - the article title.</li>\n  <li><strong>Author</strong> - it is bugged now. It shouldn’;’t be possible to choose an author that doesn’t belong to you.</li>\n  <li><strong>Content</strong> - it should be wrote in <a href="https://en.wikipedia.org/wiki/Markdown">Markdown</a> language.</li>\n  <li><strong>Categories</strong> - each article can belong to zero, one or many categories.</li>\n</ul>\n<p>Articles are not published automatically after saving. They needs to be published manually.</p>\n<p>Articles can be in one of the two states: published or unpublished (never published or withdrawn).\nNot logged users can see only published articles.</p>\n<h2 id="manage-articles">Manage articles</h2>\n<p>Pretty same as “Manage categories” but about articles.</p>\n<h2 id="my-account-options">My account options</h2>\n<p>Here you can change your email or password. It is possible to delete your account too.</p>\n<h2 id="logout">Logout</h2>\n<p>Sign out. You don’t have to logout just for checking how the regular users see the site.\nThe admin see the regular pages (without /admin/ in the address) same as not logged user.\nThe only difference is the admin footer at the very bottom.</p>\n<h2 id="all-accounts">All accounts</h2>\n<p>It shows a list of admins and action you can make on them besed on your permissions.</p>\n<h2 id="manage-authors">Manage authors</h2>\n<p>Same as “All acounts” but about authors. Each admin should have one or more authors.\nEach author can have only one admin.</p>\n<h2 id="manage-styles">Manage styles</h2>\n<p>Here you can create, edit, activate and delete stylesheets.\nThose stylesheets are css documents that changes the look of the site.</p>\n<p>The first default stylesheet can’t be edited nor deleted.</p>\n<h2 id="site-settings">Site settings</h2>\n<p>Here are just HTML meta tags.</p>\n<ul>\n  <li><strong>Title</strong> - the HTML document title. It shows itself on the browser’s tab.</li>\n  <li><strong>Author</strong> - the HTML document author. It has no important usage.</li>\n  <li><strong>Keywords</strong> - it has no important usage.</li>\n  <li><strong>Description</strong> - some search engines can show this text as the site description.</li>\n</ul>\n<h2 id="page-header">Page header</h2>\n<p>Here you can create, edit and delete things that are displayed above the main menu.\nIt should be writen in Markdown language. Styling is made in <a href="/admin/stylesheets">Manage styles</a> subsection.</p>\n<h2 id="page-footer">Page footer</h2>\n<p>Same as “Page header” but for the page footer.</p>	about-the-admin-panel	1	2017-07-23 16:55:21.152909	2017-07-23 16:55:21.176845	2017-07-23 16:55:21.176845
3	Empty template (boilerplate)	1	<pre><code>&lt;!DOCTYPE HTML&gt;\n&lt;html lang="en"&gt;\n\n&lt;head&gt;\n  &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;\n  &lt;meta charset="utf-8"/&gt;\n  &lt;title&gt;Title Ipsum&lt;/title&gt;\n  &lt;meta name="description" content="Description ipsum."/&gt;\n  &lt;meta name="keywords" content="lorem, ipsum, foo, bar"/&gt;\n  &lt;!--- JS ------------------&gt;\n  &lt;script src="test.js"&gt;&lt;/script&gt;\n  &lt;script src="test2.js"&gt;&lt;/script&gt;\n  &lt;!--- JQUERY --------------&gt;\n  &lt;!-- &lt;script src="https://code.jquery.com/jquery-2.1.4.min.js"&gt;&lt;/script&gt; --&gt;\n  &lt;!--- CSS -----------------&gt;\n  &lt;!-- &lt;link rel="stylesheet" href="styles.css"&gt; --&gt;\n&lt;/head&gt;\n\n&lt;body&gt;\n  &lt;header&gt;\n  &lt;/header&gt;\n  &lt;main&gt;\n    &lt;section&gt;\n    &lt;/section&gt;\n    &lt;section&gt;\n    &lt;/section&gt;\n  &lt;/main&gt;\n  &lt;footer&gt;\n  &lt;/footer&gt;\n&lt;/body&gt;\n\n&lt;/html&gt;\n</code></pre>	\N	1	2017-07-23 18:27:34.711039	2017-07-23 18:29:54.895339	2017-07-23 18:28:00
4	Gemfile template	1	<pre><code>source 'https://rubygems.org'\nruby "2.3.0"\ngem 'rails', '4.2.6'\ngem 'rspec-rails', '3.4.2'\ngem 'sass-rails', '5.0.4'\ngem 'uglifier', '2.7.2'\ngem 'coffee-rails', '4.1.1'\ngem 'turbolinks', '2.5.3'\ngem 'bcrypt', '3.1.11'\ngem 'sqlite3', '1.3.11', group: [:test, :development]\ngem 'spring', '1.6.4', group: :development\ngem 'pg', '0.18.4', group: :production\ngem 'rails_12factor', '0.0.3', group: :production\n</code></pre>	\N	1	2017-07-23 18:31:29.150973	2017-07-23 18:31:34.340705	2017-07-23 18:31:34.340705
6	Tar	1	<p>Creating an archive from a directory.</p>\n<p><code>tar -czvf archive.tar.gz directory/</code></p>\n<p>Or just</p>\n<p><code>tar czf archive.tar.gz directory</code></p>\n<hr />\n<p>Extracting.</p>\n<p><code>tar -xzvf archive.tar.gz</code></p>\n<p>Or even without the file format option.</p>\n<p><code>tar xf archive.tar.gz</code></p>\n<hr />\n<p>To use bzip2 instead of gzip use <code>j</code> option instead of <code>z</code>. For bzip2 the file extension convention is “.bz2”.</p>\n<hr />\n<p>List (test) the content of the archive.</p>\n<p><code>tar tf archive.tar.gz</code></p>	\N	1	2017-07-23 18:53:18.199658	2017-07-25 10:38:53.001286	2017-07-23 18:53:00
5	Special characters	1	<table>\n  <thead>\n    <tr>\n      <th>Character</th>\n      <th>Definition</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>.</td>\n      <td>Any character.</td>\n    </tr>\n    <tr>\n      <td>\\w</td>\n      <td>Any English letter, digit or “_” (underscore).</td>\n    </tr>\n    <tr>\n      <td>\\W</td>\n      <td>Any character that is not \\w.</td>\n    </tr>\n    <tr>\n      <td>\\d</td>\n      <td>Any digit character (0-9).</td>\n    </tr>\n    <tr>\n      <td>\\D</td>\n      <td>Any character that is not a digit (0-9).</td>\n    </tr>\n    <tr>\n      <td>\\s</td>\n      <td>Any white space character.</td>\n    </tr>\n  </tbody>\n</table>	\N	1	2017-07-23 18:37:26.593225	2017-07-23 18:37:45.611362	2017-07-23 18:37:00
8	Debian/Ubuntu package management	1	<p>Show the package description and status (is it isntalled or not).</p>\n<p><code>dpkg -s &lt;packagename&gt;</code></p>	\N	1	2017-07-23 18:56:07.469044	2017-07-23 18:56:11.836971	2017-07-23 18:56:11.836971
7	Using 7z	1	<p>Split a file to 500 MB parts with no compression.</p>\n<p><code>7z a -v500m -mx0 movie.7z movie.mp4</code></p>	\N	1	2017-07-23 18:55:00.539655	2017-07-23 18:55:04.432413	2017-07-23 18:55:04.432413
9	Finding files	1	<p>List every files and directories (with relative paths) in the current directory and all its subdirectories.</p>\n<p><code>find .</code></p>\n<p>Or just</p>\n<p><code>find</code></p>\n<p>Same but just files.</p>\n<p><code>find -type f</code></p>\n<p>Just directiories.</p>\n<p><code>find -type d</code></p>\n<hr />\n<p>Search in the home directory (and all its subdirectories).</p>\n<p><code>find ~</code></p>\n<p>In the /mnt and /media directories.</p>\n<p><code>find /mnt /media</code></p>\n<hr />\n<p>Find something named “config”.</p>\n<p><code>find -name "config"</code></p>\n<p>Find all ruby files in the home directory.</p>\n<p><code>find ~ -type f -name "*.rb"</code></p>\n<p>Find all ruby files in the home directory, but not if they have letter “a” or “e” in their names.</p>\n<p><code>find ~ -type f -name "*.rb" -not -name "*a*" -not -name "*e*"</code></p>\n<p>Or</p>\n<p><code>find ~ -type f -name "*.rb" ! -name "*a*" ! -name "*e*"</code></p>	\N	1	2017-07-23 19:00:12.514374	2017-07-23 19:00:16.57268	2017-07-23 19:00:16.57268
27	Configuring Ubuntu server	0	<p>Upgrade the system</p>\n\n<pre><code>apt update\n</code></pre>\n\n<pre><code>apt upgrade\n</code></pre>\n\n<p>Show the current timezone ~~~timedatectl~~~</p>\n\n<p>Change it to UTC</p>\n\n<pre><code>timedatectl set-timezone UTC\n</code></pre>\n\n<p>Change root password</p>\n\n<pre><code>passwd\n</code></pre>\n\n<p>Delete user <code>ubuntu</code> created by who knows</p>\n\n<pre><code>deluser --remove-home ubuntu\n</code></pre>\n\n<p>Add a new regular user</p>\n\n<pre><code>adduser yournickname\n</code></pre>\n\n<p>Add it to the sudo group.</p>\n\n<pre><code>usermod -aG sudo yournickname\n</code></pre>\n\n<p>Switch to that user</p>\n\n<pre><code>su yournickname\n</code></pre>\n\n<p>Install your favourite text editor</p>\n\n<pre><code>sudo apt install emacs-nox\n</code></pre>\n\n<p>Install htop</p>\n\n<pre><code>sudo apt install htop\n</code></pre>\n\n<p>Create a ssh key for pulling source code from repositories</p>\n\n<pre><code>ssh-keygen -t rsa -b 4096 -C "user@host"\n</code></pre>\n\n<p>Add the public key to the repositories on github/bitbucket as a deploy/access key.</p>\n\n<p>No passphrase needed if it will be used only to clone and pull.</p>	\N	1	2018-05-16 17:12:53.998539	2018-05-18 17:10:50.587902	\N
11	Org mode: Outlines	1	<table>\n  <thead>\n    <tr>\n      <th>key</th>\n      <th>action</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>M-left/right</td>\n      <td>Change the headline’s level.</td>\n    </tr>\n    <tr>\n      <td>M-up/down</td>\n      <td>Move the entire section up or down. Only in the skope of the parent section.</td>\n    </tr>\n    <tr>\n      <td>S-left/right</td>\n      <td>Cycle through the todo states.</td>\n    </tr>\n  </tbody>\n</table>	\N	1	2017-07-25 19:11:51.672327	2017-07-25 19:11:56.224277	2017-07-25 19:11:56.224277
12	Org mode: Timestamps	0		\N	1	2017-07-25 19:14:44.748235	2017-07-25 19:14:44.748235	\N
10	Installation	1	<p>This installation description is for Ubuntu.</p>\n<hr />\n<p>Curl is needed to install RVM. In case the system doesn’t have it:</p>\n<pre><code>apt-get install curl\n</code></pre>\n<hr />\n<p>An installation of RVM doesn’t require root privileges. RVM will install itself in a hidden .rvm directory in user’s home directory.</p>\n<pre><code>gpg –keyserver hkp://keys.gnupg.net –recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB\n</code></pre>\n<pre><code>\\curl -sSL https://get.rvm.io | bash -s stable\n</code></pre>\n<hr />\n<p>Now add this line to the <code>~/.bashrc</code> file</p>\n<pre><code>source /.rvm/scripts/rvm\n</code></pre>\n<p>Then type that command (<code>source ~/.rvm/scripts/rvm</code>) or restart the terminal.</p>\n<hr />\n<p>Install requirements. The system will ask for the password.</p>\n<pre><code>rvm requirements\n</code></pre>\n<hr />\n<p>You have installed RVM, but you don’t have any Ruby installed inside RVM. You can check this with <code>rvm list</code> command.</p>\n<hr />\n<p>To remove RVM from your system just delete ~/.rvm directory. Then delete the lines <code>source ~/.rvm/scripts/rvm</code> and <code>export PATH="$PATH:$HOME/.rvm/bin"</code> (created by heroku?) from ~/.bashrc.</p>	\N	1	2017-07-25 10:45:04.43941	2017-07-25 10:49:51.444747	2017-07-25 10:45:00
28	Installing Docker	1	<h1 id="installing-docker-on-ubuntu-164">Installing Docker on Ubuntu 16.4</h1>\n\n<h5 id="source-httpsdocsdockercominstalllinuxdocker-ceubuntu">source: https://docs.docker.com/install/linux/docker-ce/ubuntu/</h5>\n\n<pre><code>sudo apt update\n</code></pre>\n\n<pre><code>sudo apt install apt-transport-https\n</code></pre>\n\n<pre><code>sudo apt install ca-certificates\n</code></pre>\n\n<pre><code>sudo apt install curl\n</code></pre>\n\n<pre><code>sudo apt install software-properties-common\n</code></pre>\n\n<pre><code>curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -\n</code></pre>\n\n<pre><code>sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"\n</code></pre>\n\n<pre><code>sudo apt update\n</code></pre>\n\n<pre><code>sudo apt install docker-ce\n</code></pre>\n\n<hr />\n\n<h1 id="configure-docker-to-run-without-sudo">Configure Docker to run without sudo.</h1>\n\n<h5 id="source-httpsdocsdockercominstalllinuxlinux-postinstall">source: https://docs.docker.com/install/linux/linux-postinstall/</h5>\n\n<pre><code>sudo groupadd docker\n</code></pre>\n\n<pre><code>sudo usermod -aG docker $USER\n</code></pre>\n\n<p>Log out and log in.</p>\n\n<p>Test</p>\n\n<pre><code>docker run hello-world\n</code></pre>\n\n<hr />\n\n<h1 id="install-docker-compose">Install Docker Compose</h1>\n\n<h5 id="source-httpsdocsdockercomcomposeinstall">source: https://docs.docker.com/compose/install/</h5>\n\n<p>Check the current version on this site <code>https://github.com/docker/compose/releases</code></p>\n\n<p>Install it using curl</p>\n\n<pre><code>sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose\n</code></pre>\n\n<pre><code>sudo chmod +x /usr/local/bin/docker-compose\n</code></pre>	\N	1	2018-05-18 08:51:57.789009	2018-05-18 12:00:35.334862	2018-05-18 09:26:00
13	Advanced parameters	1	<h1 id="parameters-made-of-hash">Parameters made of hash</h1>\n<p>Using <code>fetch</code> with default values.</p>\n<pre><code>def stats(args)\n  health = args.fetch(:health, 10)\n  mana = args.fetch(:mana, 5)\n  attack = args.fetch(:attack, 5)\n  defense = args.fetch(:defense, 5)\n  puts "Health: #{health}, Mana: #{mana}, Attack: #{attack}, Defense: #{defense}."\nend\n\nstats(attack: 30)\n</code></pre>\n<p>It prints: <code>Health: 10, Mana: 5, Attack: 30, Defense: 5.</code></p>\n<hr />\n<p>Using default arguments and <code>merge</code> method.</p>\n<pre><code>def stats(args)\n  defaults = {\n    health: 10,\n    mana: 5,\n    attack: 5,\n    defense: 5\n  }\n  args = defaults.merge args\n  health = args[:health]\n  mana = args[:mana]\n  attack = args[:attack]\n  defense = args[:defense]\n  puts "Health: #{health}, Mana: #{mana}, Attack: #{attack}, Defense: #{defense}."\nend\n\nstats(health: 30)\n</code></pre>\n<p>It prints: <code>Health: 30, Mana: 5, Attack: 5, Defense: 5.</code></p>\n<hr />\n<h1 id="keyword-arguments-since-ruby-20">Keyword arguments (since Ruby 2.0)</h1>\n<pre><code>def stats(health: 10, mana: 5, attack: 5, defense: 5)\n  puts "Health: #{health}, Mana: #{mana}, Attack: #{attack}, Defense: #{defense}."\nend\n\nstats(mana: 20)\n</code></pre>\n<p>It prints: <code>Health: 10, Mana: 20, Attack: 5, Defense: 5.</code></p>	\N	1	2017-07-29 15:40:25.922356	2017-07-29 15:52:42.323288	2017-07-29 15:40:00
14	public vs protected vs private	1	<h1 id="public">public</h1>\n<p>Can be called by any object. Default for methods.</p>\n<h1 id="protected">protected</h1>\n<p>Can be called by objects of the defining class and its subclasses.</p>\n<h1 id="private">private</h1>\n<p>Can be called only by current object. The object sends message to itself. The receiver is always <code>self</code> and it can’t be set explicitly even with <code>self</code> keyword. <code>initialize</code> method is always private.</p>	\N	1	2017-08-12 15:57:16.151017	2017-08-12 16:56:34.210377	2017-08-12 16:13:00
29	Sending files by SCP (secure copy)	1	<p>Send the whole current directory to a remote server</p>\n\n<pre><code>scp -r * username@hostname\\_or\\_ip:/home/username/directory/\n</code></pre>	\N	1	2018-05-19 14:03:27.392362	2018-05-19 14:04:52.025471	2018-05-19 14:03:00
16	include vs extend	1	<h1 id="include">include</h1>\n<p>Adds <strong>instance methods</strong> of the module to the class as <strong>instance methods</strong> of that class.</p>\n<h1 id="extend">extend</h1>\n<p>Adds <strong>instance methods</strong> of the module to the class as <strong>class methods</strong> of that class.</p>\n<hr />\n<p>So it is only about instance methods of the module.</p>	\N	1	2017-08-14 17:48:23.800539	2017-08-14 17:55:41.37248	2017-08-14 17:55:41.37248
25	Webpack + Babel starter	0	<p>Create a directory for the project and enter into it.</p>\n\n<p>Call <code>npm init</code>.</p>\n\n<p>Install dev dependencies. <code>npm install --save-dev webpack webpack-cli webpack-dev-server babel-core babel-loader babel-preset-env babel-polyfill babel-preset-stage-0</code></p>\n\n<p>Add scripts to <code>package.json</code>:</p>\n\n<pre><code>  "build": "webpack",\n  "start": "webpack-dev-server --output-public-path=/build/"\n</code></pre>\n\n<p>Create <code>webpack.config.js</code>:</p>\n\n<pre><code>const path = require('path');\n\nmodule.exports = {\n  entry: {\n    app: ['babel-polyfill', './src/app.js']\n  },\n  output: {\n    path: path.resolve(__dirname, 'build'),\n    filename: 'app.bundle.js'\n  },\n  module: {\n    loaders: [{\n      test: /\\.js?$/,\n      exclude: /node_modules/,\n      loader: 'babel-loader',\n      query: {\n        presets: ['env', 'stage-0']\n      }\n    }]\n  }\n}\n</code></pre>\n\n<p>Add to <code>index.html</code>:</p>\n\n<pre><code>&lt;script src="./build/app.bundle.js"&gt;&lt;/script&gt;\n</code></pre>	\N	1	2018-03-04 07:42:50.358983	2018-03-04 09:41:41.042477	\N
17	Percent String Literals	1	<p>The most common delimeters are <code>{</code> and <code>}</code>, but it is possible to use any kind of brackets or pair of <code>@</code>, <code>#</code>, <code>%</code>, <code>^</code>, <code>&amp;</code>, <code>*</code>, <code>-</code>, <code>=</code>, <code>+</code>, <code>/</code>, <code>\\</code>, <code>;</code>, <code>|</code>, <code>?</code>, <code>.</code>, <code>!</code>, <code>$</code></p>\n\n<table>\n  <thead>\n    <tr>\n      <th style="text-align: right">type</th>\n      <th>definition</th>\n      <th>interpolation</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td style="text-align: right"><code>%W</code></td>\n      <td>Array of double-quoted Strings</td>\n      <td>yes</td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%w</code></td>\n      <td>Array of single-quoted Strings</td>\n      <td> </td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%Q</code></td>\n      <td>Double-quoted String</td>\n      <td>yes</td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%q</code></td>\n      <td>Single-quoted String</td>\n      <td> </td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%i</code></td>\n      <td>Array of Symbols</td>\n      <td> </td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%s</code></td>\n      <td>Symbol</td>\n      <td> </td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%</code></td>\n      <td>Same as <code>%Q</code></td>\n      <td>yes</td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%r</code></td>\n      <td>Regular Expression</td>\n      <td>yes</td>\n    </tr>\n    <tr>\n      <td style="text-align: right"><code>%x</code></td>\n      <td>Capture output of running the command in a subshell (backtick ).</td>\n      <td>yes</td>\n    </tr>\n  </tbody>\n</table>	\N	1	2017-08-18 15:07:36.643129	2017-08-18 16:48:55.924347	2017-08-18 15:07:00
19	Grep	1	<pre><code>grep -rw “lol” *.rb\n</code></pre>\n\n<p>Find “lol” in ruby files in the current directory.</p>\n\n<ul>\n  <li><code>-r</code> - recursive</li>\n  <li><code>-w</code> - whole words</li>\n</ul>	\N	1	2017-11-05 19:19:25.358052	2017-11-05 19:21:53.268819	2017-11-05 19:19:00
18	Skipping "return" keyword in annonymous functions	1	<pre><code>   [1,2,3,4].map((n) =&gt; {return n*2});\n=&gt; [ 2, 4, 6, 8 ]\n   [1,2,3,4].map((n) =&gt; {n*2});\n=&gt; [ undefined, undefined, undefined, undefined ]\n   [1,2,3,4].map((n) =&gt; n*2);\n=&gt; [ 2, 4, 6, 8 ]\n   [1,2,3,4].map(n =&gt; n*2);\n=&gt; [ 2, 4, 6, 8 ]\n</code></pre>	\N	1	2017-10-30 18:02:18.7867	2017-10-30 18:02:27.279991	2017-10-30 18:02:27.279991
20	Setup a new pure Ruby project	1	<p>I assume that you use <strong>rbenv</strong>.</p>\n\n<hr />\n\n<h1 id="update-your-rbenv-and-ruby-build">Update your rbenv and ruby-build</h1>\n\n<p><code>cd ~/.rbenv &amp;&amp; git pull</code></p>\n\n<p><code>cd "$(rbenv root)"/plugins/ruby-build &amp;&amp; git pull</code></p>\n\n<hr />\n\n<h1 id="check-what-versions-are-installed">Check what versions are installed</h1>\n\n<p><code>rbenv versions</code></p>\n\n<hr />\n\n<h1 id="check-what-versions-of-ruby-are-available-for-installing">Check what versions of Ruby are available for installing</h1>\n\n<p><code>rbenv install -l</code></p>\n\n<hr />\n\n<h1 id="install-ruby-in-some-version">Install Ruby in some version</h1>\n\n<p><code>rbenv install 2.4.2</code></p>\n\n<hr />\n\n<h1 id="create-the-project-directory-and-go-there">Create the project directory and go there</h1>\n\n<p><code>mkdir ~/projects/hosting_manager</code></p>\n\n<p><code>cd ~/projects/hosting_manager/</code></p>\n\n<hr />\n\n<h1 id="switch-the-directory-to-your-ruby-version">Switch the directory to your Ruby version</h1>\n\n<p><code>rbenv local 2.4.2</code></p>\n\n<hr />\n\n<h1 id="install-bundler-and-init-it">Install Bundler and init it</h1>\n\n<p><code>gem install bundler</code></p>\n\n<p><code>bundle init</code></p>\n\n<p><code>bundle install --path vendor/bundle</code></p>	\N	1	2017-12-12 18:37:39.595592	2017-12-23 10:57:00.588078	2017-12-12 19:50:00
26	Decorator Pattern	1	<p>Adding functionality to objects by creating new small classes instead of adding and changing methods in old classes.</p>\n\n<pre><code>class Robot\n  def initialize(name)\n    @name = name \n  end\n  \n  def name\n    puts @name\n  end\nend\n\nclass Aged &lt; SimpleDelegator\n  def initialize(source, age=0)\n    super(source)\n    @age = age\n  end\n\n  def age\n    puts @age\n  end\nend\n\nclass Ranked &lt; SimpleDelegator\n  def initialize(source, rank=10)\n    super(source)\n    @rank = rank\n  end\n\n  def rank\n    puts @rank\n  end\nend\n\nclass HumanFriendly &lt; SimpleDelegator\n  def age\n    puts "My age is:"\n    super\n  end\n  \n  def rank\n    puts "My rank is:"\n    super\n  end\n  \n  def name\n    puts "My name is:"\n    puts "Friend of Humanity"\n  end\nend\n\nrobot = HumanFriendly.new(Ranked.new(Aged.new(Robot.new("Destroyer of Humanity"))))\nrobot.name\nrobot.age\nrobot.rank\n\n# output\n# My name is:\n# Friend of Humanity\n# My age is:\n# 0\n# My rank is:\n# 10\n</code></pre>	\N	1	2018-05-05 18:34:19.485502	2018-05-06 13:39:15.500511	2018-05-05 18:34:00
22	Installation and configuration	1	<p>This installation description is for Ubuntu.</p>\n\n<p>It is installed by default.</p>\n\n<hr />\n\n<p>User name and email configuration (for all projects of that user).</p>\n\n<pre><code>git config --global user.name "Krzysztof Kowalski"\n</code></pre>\n\n<pre><code>git config --global user.email k.kowalski@example.com\n</code></pre>\n\n<hr />\n\n<p>User name and email configuration just for that project.</p>\n\n<pre><code>git config --local user.name "Krzysztof Kowalski"\n</code></pre>\n\n<pre><code>git config --local user.email k.kowalski@example.com\n</code></pre>	\N	1	2018-01-20 17:11:24.677512	2018-01-20 17:11:37.662435	2018-01-20 17:11:37.662435
21	Undo changes	1	<p>Back to the last commit, when unwanted changes are not commited and not added.</p>\n\n<pre><code>git checkout -- .\n</code></pre>\n\n<p>and then</p>\n\n<pre><code>git clean -df\n</code></pre>\n\n<p>Or</p>\n\n<pre><code>git reset --hard\n</code></pre>\n\n<p>and then</p>\n\n<pre><code>git clean -df\n</code></pre>\n\n<p>Or probably the best way:</p>\n\n<pre><code>git add .\n</code></pre>\n\n<p>and then</p>\n\n<pre><code>git reset --hard\n</code></pre>\n\n<hr />\n\n<p>Back to the last commit, when unwanted changes are not commited but added.</p>\n\n<pre><code>git reset --hard\n</code></pre>\n\n<hr />\n\n<p>Back to the any commit with working tree added to the index or not.</p>\n\n<p>To be sure that all changes are added.</p>\n\n<pre><code>git add .\n</code></pre>\n\n<p>And then to go back to the pre-pre-last (second to last) commit.</p>\n\n<pre><code>git reset --hard HEAD~2\n</code></pre>	\N	1	2018-01-20 16:57:50.742115	2018-01-20 17:05:07.16182	2018-01-20 16:57:00
24	Docker commannds	1	<p><strong>docker stop</strong> [OPTIONS] CONTAINER [CONTAINER…]</p>\n\n<p>The main process inside the container will receive <code>SIGTERM</code>, and after a grace period, <code>SIGKILL</code>.</p>\n\n<p><strong>docker kill</strong> [OPTIONS] CONTAINER [CONTAINER…]</p>\n\n<p>The main process inside the container will be sent <code>SIGKILL</code>, or any signal specified with option <code>--signal</code>.</p>\n\n<p><strong>docker pause</strong> CONTAINER [CONTAINER…]</p>\n\n<p>Suspends all processes in the specified containers. On Linux, this uses the cgroups freezer. Traditionally, when suspending a process the <code>SIGSTOP</code> signal is used, which is observable by the process being suspended.</p>\n\n<p><strong>docker start</strong> [OPTIONS] CONTAINER [CONTAINER…]</p>\n\n<p>Start one or more stopped containers.</p>	\N	1	2018-02-04 08:42:19.238149	2018-02-04 09:18:04.365214	2018-02-04 08:42:00
23	 Many to many associations by "has_many through"	0	<p>My model will be called Node, and I want to connect them with other nodes in a way that is called “directed graph”.</p>\n\n<p><img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Directed_acyclic_graph.png" alt="A directed graph" /></p>\n\n<p><em>An example of a directed graph from Wikimedia Commons.</em></p>\n\n<p>Each node can have zero, one or many children, and zero, one or many parents. To do this I need an another model which will represent connections between nodes. I assume that Node model already exists and I will create the NodeConnection model by generating a scaffold.</p>\n\n<p><code>rails g scaffold NodeConnection child:references parent:references --no-stylesheets</code></p>\n\n<p>Nodes will be connected with other nodes, but I can’t make two column with the same “node” name. Instead of that the names are “child” and “parent”. I think the same result can be achieved by <code>child_id:integer parent_id:integer</code> instead of <code>child:references parent:references</code>.</p>\n\n<p>An auto-generated migration is OK, I don’t need to add anything at this moment, so I can migrate.</p>\n\n<p><code>rake db:migrate</code></p>\n\n<p>The associations in the <strong>NodeConnection</strong> model file should have additional arguments.</p>\n\n<pre><code>class NodeConnection &lt; ActiveRecord::Base\n  belongs_to :parent, class_name: 'Node', foreign_key: 'parent_id'\n  belongs_to :child, class_name: 'Node', foreign_key: 'child_id'\nend\n</code></pre>\n\n<p>And an assiociation in the <strong>Node</strong> model file:</p>\n\n<pre><code>class Node &lt; ActiveRecord::Base\n  has_many :parent_connections, foreign_key: 'child_id', class_name: 'NodeConnection'\n  has_many :parents, through: :parent_connections\n\n  has_many :child_connections, foreign_key: 'parent_id', class_name: 'NodeConnection'\n  has_many :children, through: :child_connections\nend\n</code></pre>\n\n<p>For each node there are now methods <code>parents</code> and <code>children</code> avaliable.</p>	\N	1	2018-01-20 17:40:57.240589	2018-01-20 17:42:30.543297	\N
15	Block vs proc vs lambda	1	<h1 id="block">Block</h1>\n\n<p>A block is code inside <code>do</code> and <code>end</code> or <code>{</code> and <code>}</code>. It’s not an object.</p>\n\n<p>A block alone is a syntax error, it can only exist as a part of method calls.</p>\n\n<pre><code>{ puts "lol" }.call\n# BAD! Syntax error! Block is not a proc!\n\n{ puts "lol" }.to_proc.call\n# BAD! Syntax error! Block is not even an object!\n</code></pre>\n\n<p>A method call can have zero or one block after its regular arguments. Every method can take a block, even if it doesn’t make sense because the method doesn’t use block.</p>\n\n<pre><code>puts "lol" do\n  puts "this block has no sense, but it will not throw any error"\nend\n\n# the result is:\n# lol\n# =&gt; nil\n</code></pre>\n\n<p>Block is just a special syntax for a piece of code just for passing that piece of code as an argument of a method.</p>\n\n<p>Blocks are made to inject code (in anonymous and literally form) into methods to make them more versatile.</p>\n\n<pre><code>def universal_but_useless_method\n  yield \nend\n\nuniversal_but_useless_method do\n  puts "I am a block"\nend\n\n# the result is:\n# I am a block\n# =&gt; nil\n</code></pre>\n\n<pre><code>def print_block_result_in_a_fancy_way(a, b)\n  result = yield\n  puts "The result of doing something with #{a} and #{b} is... #{result}!!!!!!"\nend\n\na = 2\nb = 7\n\nprint_block_result_in_a_fancy_way(a, b) do\n  a + b\nend\n\n# the result is:\n# The result of doing something with 2 and 7 is... 9!!!!!!\n# =&gt; nil\n\nprint_block_result_in_a_fancy_way(a, b) do\n  a * b\nend\n\n# the result is:\n# The result of doing something with 2 and 7 is... 14!!!!!!\n# =&gt; nil\n</code></pre>\n\n<p>There are not such things as “named blocks”.</p>\n\n<pre><code>def foo(&amp;block)\n word = "Ho"\n block.call(word)\n block.call()\n p block\nend\n\nfoo do | name |\n  puts "Hey! #{name}!"\nend\n\n# it prints:\n# Hey! Ho!\n# Hey! !\n# #&lt;Proc:0x007f702ab4a608@main.rb:11&gt;\n</code></pre>\n\n<p><code>block</code> is an instance of Proc.</p>\n\n<p>This method definition</p>\n\n<pre><code>def foo(&amp;block)\n  block.call("John")\nend\n</code></pre>\n\n<p>is the same as</p>\n\n<pre><code>def foo\n  block = Proc.new   \n  block.call("John")\nend\n</code></pre>\n\n<hr />\n\n<h1 id="proc">Proc</h1>\n\n<p>Procs exist in Ruby because Ruby doesn’t have functions and properties. Ruby has only methods and Ruby allows you to skip parenthesis during the method call.</p>\n\n<p>But functions are useful in many languages if they are “first-class citizens”. So in Ruby procs (instances of Proc class) are objects with just a <code>#call</code> method with a few aliases. They can be called and passed as argument and returned like every objects.</p>\n\n<pre><code>def print_proc_result_in_a_fancy_way(a, b, operation)\n  result = operation.call(a, b)\n  puts "The result of doing something with #{a} and #{b} is... #{result}!!!!!!"\nend\n\nadding = Proc.new { |a, b| a + b }\nmultiplying = Proc.new { |a, b| a * b }\n\nprint_proc_result_in_a_fancy_way(3, 5, adding)\n\n# the result is:\n# The result of doing something with 3 and 5 is... 8!!!!!!\n# =&gt; nil\n\nprint_proc_result_in_a_fancy_way(3, 5, multiplying)\n\n# the result is:\n# The result of doing something with 3 and 5 is... 15!!!!!!\n# =&gt; nil\n</code></pre>\n\n<p>Proc doesn’t care about number of arguments. It takes argument as nil if there was nothing passed and ignores any extra arguments.</p>\n\n<pre><code>proc = Proc.new do |x|\n  if x\n    result = x.to_s\n  else \n    result = "this was nil"\n  end\n  result\nend\nputs proc.call\nputs proc.call(1)\nputs proc.call(2, 3, 1)\n# it prints:\n# this was nil\n# 1\n# 2\n</code></pre>\n\n<p>Proc can be invoked in many ways.</p>\n\n<pre><code>adding = Proc.new { |a, b| a + b }\n\nputs adding.call(2, 3)\n# 5\n# =&gt; nil\nputs adding.(2, 3)\n# 5\n# =&gt; nil\nputs adding[2, 3]\n# 5\n# =&gt; nil\nputs adding.yield(2, 3)\n# 5\n# =&gt; nil\n</code></pre>\n\n<p>Proc can be created in many ways too.</p>\n\n<pre><code>adding = Proc.new { |a, b| a + b }\n\nadding = proc { |a, b| a + b }\n</code></pre>\n\n<p>But procs can’t be created without any block!</p>\n\n<p>This code:</p>\n\n<pre><code>blockless_proc = Proc.new\n\nblockless_proc.call\n</code></pre>\n\n<p>will raise an exception.</p>\n\n<p>Unless there is some block passed to the current scope.</p>\n\n<p>That’s why this code will work;</p>\n\n<pre><code>def foo\n  block = Proc.new   \n  block.call\nend\n\nfoo do\n  puts "this block will be passed automatically"\nend\n</code></pre>\n\n<hr />\n\n<h1 id="lambda">Lambda</h1>\n\n<p>To do.</p>\n\n<p>Lambda, unlike proc, raise ArgumentError if number of arguments is incorrect.</p>	\N	1	2017-08-12 21:12:05.759052	2018-05-15 09:55:40.228396	2017-08-15 12:16:00
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.articles_id_seq', 29, true);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.authors (id, name, admin_id, created_at, updated_at, description) FROM stdin;
1	Admin	1	2017-07-23 16:55:20.810038	2017-07-23 16:55:20.810038	
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.authors_id_seq', 1, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.categories (id, name, description, visibility, created_at, updated_at, "position") FROM stdin;
1	Home Page		1	2017-07-23 16:55:21.002794	2017-10-30 17:59:48.320401	1
2	HTML		0	2017-07-23 16:55:21.015504	2017-10-30 17:59:48.320401	2
3	RVM		0	2017-07-23 16:55:21.021218	2017-10-30 17:59:48.320401	3
5	Rails		0	2017-07-23 18:21:31.172091	2017-10-30 17:59:48.320401	4
6	Ruby		0	2017-07-23 18:22:01.685593	2017-10-30 17:59:48.320401	5
7	Heroku		0	2017-07-23 18:22:22.238178	2017-10-30 17:59:48.320401	6
8	Git		0	2017-07-23 18:23:42.100782	2017-10-30 17:59:48.320401	7
9	Linux		0	2017-07-23 18:23:55.979184	2017-10-30 17:59:48.320401	8
10	Rspec		0	2017-07-23 18:24:09.425092	2017-10-30 17:59:48.320401	9
11	Bundler		0	2017-07-23 18:25:20.852389	2017-10-30 17:59:48.320401	10
12	Emacs		0	2017-07-23 18:25:41.655334	2017-10-30 17:59:48.320401	11
4	The Manual	How to use this blog.	1	2017-07-23 16:55:21.027767	2017-10-30 17:59:48.320401	13
13	Regular expressions		0	2017-07-23 18:26:09.022956	2017-10-30 17:59:48.320401	12
17	Docker		0	2018-02-04 08:39:50.175711	2018-02-04 08:39:59.009071	15
16	JavaScript		0	2017-08-31 19:28:30.708596	2018-02-04 08:39:59.04928	14
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.categories_id_seq', 17, true);


--
-- Data for Name: categorizations; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.categorizations (id, category_id, article_id, created_at, updated_at) FROM stdin;
1	4	1	2017-07-23 16:55:21.117127	2017-07-23 16:55:21.117127
2	4	2	2017-07-23 16:55:21.212551	2017-07-23 16:55:21.212551
3	2	3	2017-07-23 18:27:34.714168	2017-07-23 18:27:34.714168
4	11	4	2017-07-23 18:31:29.154937	2017-07-23 18:31:29.154937
5	13	5	2017-07-23 18:37:26.595604	2017-07-23 18:37:26.595604
6	9	6	2017-07-23 18:53:18.202489	2017-07-23 18:53:18.202489
7	9	7	2017-07-23 18:55:00.542763	2017-07-23 18:55:00.542763
8	9	8	2017-07-23 18:56:07.473098	2017-07-23 18:56:07.473098
9	9	9	2017-07-23 19:00:12.517332	2017-07-23 19:00:12.517332
10	3	10	2017-07-25 10:45:04.442465	2017-07-25 10:45:04.442465
11	12	11	2017-07-25 19:11:51.675303	2017-07-25 19:11:51.675303
12	12	12	2017-07-25 19:14:44.750984	2017-07-25 19:14:44.750984
13	6	13	2017-07-29 15:40:25.927774	2017-07-29 15:40:25.927774
14	6	14	2017-08-12 15:57:16.156601	2017-08-12 15:57:16.156601
15	6	15	2017-08-12 21:12:05.763782	2017-08-12 21:12:05.763782
16	6	16	2017-08-14 17:48:23.808599	2017-08-14 17:48:23.808599
17	6	17	2017-08-18 15:07:36.648844	2017-08-18 15:07:36.648844
18	16	18	2017-10-30 18:02:18.794503	2017-10-30 18:02:18.794503
19	9	19	2017-11-05 19:19:25.363874	2017-11-05 19:19:25.363874
20	6	20	2017-12-12 18:37:39.602669	2017-12-12 18:37:39.602669
21	8	21	2018-01-20 16:57:50.755979	2018-01-20 16:57:50.755979
22	8	22	2018-01-20 17:11:24.679815	2018-01-20 17:11:24.679815
23	5	23	2018-01-20 17:41:04.29815	2018-01-20 17:41:04.29815
24	17	24	2018-02-04 08:42:19.258312	2018-02-04 08:42:19.258312
25	16	25	2018-03-04 07:42:50.408018	2018-03-04 07:42:50.408018
26	6	26	2018-05-05 18:34:19.494953	2018-05-05 18:34:19.494953
27	9	27	2018-05-16 17:12:54.012018	2018-05-16 17:12:54.012018
28	17	28	2018-05-18 08:51:57.792776	2018-05-18 08:51:57.792776
29	9	29	2018-05-19 14:03:27.39629	2018-05-19 14:03:27.39629
\.


--
-- Name: categorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.categorizations_id_seq', 29, true);


--
-- Data for Name: footer_sections; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.footer_sections (id, content, "position", created_at, updated_at) FROM stdin;
1	<p>Powered by Simple Blog CMS (betha)</p>\n<p>which is powered by Ruby on Rails</p>	1	2017-07-23 16:55:20.976388	2017-07-23 16:55:20.976388
\.


--
-- Name: footer_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.footer_sections_id_seq', 1, true);


--
-- Data for Name: header_sections; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.header_sections (id, content, "position", created_at, updated_at) FROM stdin;
2	<h1 id="web-dev-notes">Web Dev Notes</h1>\n<p>Because my memory is very good. It is just short.</p>	1	2017-07-23 16:55:20.956946	2017-07-23 18:16:53.504223
\.


--
-- Name: header_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.header_sections_id_seq', 2, true);


--
-- Data for Name: nav_sections; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.nav_sections (id, content, "position", created_at, updated_at) FROM stdin;
\.


--
-- Name: nav_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.nav_sections_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.roles (id, name, resource_type, resource_id, created_at, updated_at) FROM stdin;
1	super_admin	\N	\N	2017-07-23 16:55:20.332697	2017-07-23 16:55:20.332697
2	can_edit_site_settings	\N	\N	2017-07-23 16:55:20.342591	2017-07-23 16:55:20.342591
3	can_activate_stylesheets	\N	\N	2017-07-23 16:55:20.348422	2017-07-23 16:55:20.348422
4	can_create_stylesheets	\N	\N	2017-07-23 16:55:20.355558	2017-07-23 16:55:20.355558
5	can_edit_stylesheets	\N	\N	2017-07-23 16:55:20.360061	2017-07-23 16:55:20.360061
6	can_delete_stylesheets	\N	\N	2017-07-23 16:55:20.365495	2017-07-23 16:55:20.365495
7	can_create_header_sections	\N	\N	2017-07-23 16:55:20.371234	2017-07-23 16:55:20.371234
8	can_edit_header_sections	\N	\N	2017-07-23 16:55:20.377479	2017-07-23 16:55:20.377479
9	can_delete_header_sections	\N	\N	2017-07-23 16:55:20.381917	2017-07-23 16:55:20.381917
10	can_create_footer_sections	\N	\N	2017-07-23 16:55:20.387267	2017-07-23 16:55:20.387267
11	can_edit_footer_sections	\N	\N	2017-07-23 16:55:20.392549	2017-07-23 16:55:20.392549
12	can_delete_footer_sections	\N	\N	2017-07-23 16:55:20.397855	2017-07-23 16:55:20.397855
13	can_read_others'_unpublished_articles	\N	\N	2017-07-23 16:55:20.403113	2017-07-23 16:55:20.403113
14	can_create_articles	\N	\N	2017-07-23 16:55:20.408632	2017-07-23 16:55:20.408632
15	can_publish_own_articles	\N	\N	2017-07-23 16:55:20.413475	2017-07-23 16:55:20.413475
16	can_unpublish_own_articles	\N	\N	2017-07-23 16:55:20.419291	2017-07-23 16:55:20.419291
17	can_publish_others'_articles	\N	\N	2017-07-23 16:55:20.423769	2017-07-23 16:55:20.423769
18	can_unpublish_others'_articles	\N	\N	2017-07-23 16:55:20.428427	2017-07-23 16:55:20.428427
19	can_edit_own_articles	\N	\N	2017-07-23 16:55:20.432879	2017-07-23 16:55:20.432879
20	can_delete_own_articles	\N	\N	2017-07-23 16:55:20.437316	2017-07-23 16:55:20.437316
21	can_edit_others'_articles	\N	\N	2017-07-23 16:55:20.441238	2017-07-23 16:55:20.441238
22	can_delete_others'_articles	\N	\N	2017-07-23 16:55:20.443414	2017-07-23 16:55:20.443414
23	can_create_categories	\N	\N	2017-07-23 16:55:20.445901	2017-07-23 16:55:20.445901
24	can_edit_categories	\N	\N	2017-07-23 16:55:20.455836	2017-07-23 16:55:20.455836
25	can_delete_categories	\N	\N	2017-07-23 16:55:20.461752	2017-07-23 16:55:20.461752
26	can_give_roles	\N	\N	2017-07-23 16:55:20.471359	2017-07-23 16:55:20.471359
27	can_take_away_roles	\N	\N	2017-07-23 16:55:20.481828	2017-07-23 16:55:20.481828
28	can_edit_admins'_emails	\N	\N	2017-07-23 16:55:20.490249	2017-07-23 16:55:20.490249
29	can_delete_admins	\N	\N	2017-07-23 16:55:20.49438	2017-07-23 16:55:20.49438
30	can_create_own_authors	\N	\N	2017-07-23 16:55:20.498586	2017-07-23 16:55:20.498586
31	can_edit_own_authors	\N	\N	2017-07-23 16:55:20.504126	2017-07-23 16:55:20.504126
32	can_delete_own_authors	\N	\N	2017-07-23 16:55:20.508757	2017-07-23 16:55:20.508757
33	can_edit_others'_authors	\N	\N	2017-07-23 16:55:20.513503	2017-07-23 16:55:20.513503
34	can_delete_others'_authors	\N	\N	2017-07-23 16:55:20.519035	2017-07-23 16:55:20.519035
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.roles_id_seq', 34, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.schema_migrations (version) FROM stdin;
20170613184013
20170613184127
20170613184158
20170613184215
20170613184254
20170613184536
20170615113246
20170615121747
20170615122022
20170615122647
20170615123156
20170615165158
20170630141932
20170702165304
20170704135447
20170704140022
20170708163709
20170714211829
20170808154946
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.sites (id, title, author, description, stylesheet_id, created_at, updated_at) FROM stdin;
1	Web Dev Notes		A notes about web development.	3	2017-07-23 16:55:21.301656	2017-12-13 19:01:27.079862
\.


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.sites_id_seq', 1, true);


--
-- Data for Name: stylesheets; Type: TABLE DATA; Schema: public; Owner: simple_site_cms
--

COPY public.stylesheets (id, content, created_at, updated_at, name) FROM stdin;
1	/* PAGE */\n\nbody {\n  background-color: black;\n  margin: 0;\n}\n.page_container {\n  max-width: 750px;\n  margin: 0 auto;\n  padding: 5px 20px;\n  background-color: #ffffee;\n}\n\n/* PAGE_HEADER */\n\n.page_header {\n  display: flex;\n  flex-flow: row wrap;\n}\n.page_header__section {\n  margin: 0;\n  padding: 0 10px 0 0;\n  display: block;\n  text-decoration: none;\n  color: black;\n}\n.page_header__section > h1 {\n  display: block;\n  font-size: 2em;\n  font-weight: bold;\n  margin: 0;\n  padding: 0;\n  font-family: 'Ubuntu', sans-serif;\n}\n.page_header__section > p {\n  margin-top: 0;\n  padding-top: 0;\n  font-family: 'Ubuntu', sans-serif;\n  margin-bottom: 1px;\n  padding: 1px 0;\n  margin: 0;\n  display: block;\n  font-size: 14px;\n}\n\n/* MAIN NAVIGATION */\n\n.main_navigation {\n  display: flex;\n  flex-wrap: wrap;\n  justify-content: center;\n  margin: 0 1px;\n  padding: 0;\n  font-size: 14px;\n}\n.main_navigation__item {\n  min-width: 150px;\n  max-width: 100px;\n  flex: auto;\n  border: 1px solid red;\n  border-radius: 0;\n  margin: 2px;\n  font-family: 'Ubuntu', sans-serif;\n  padding: 0;\n  display: flex;\n  align-items: stretch;\n  font-size: 14px;\n}\n.main_navigation__link {\n  padding: 5px 3px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n  flex: 1 1 auto;\n  text-decoration: inherit;\n  color: inherit;\n  margin: 0;\n  cursor: auto;\n  text-align: center\n}\n.main_navigation__link--active {\n  background-color: darkred;\n  color: white;\n  font-weight: bold;\n}\n\n/* PAGE_TITLE */\n\n.current_page_header {\n  text-align: center;\n  color: #8b0000;\n  font-size: 32px;\n  font-family: 'Ubuntu', sans-serif;\n  padding-bottom: 15px;\n  border-bottom: 1px solid #8b0000;\n}\n\n/* PAGINATION */\n\n.pagination {\n  font-family: 'Ubuntu', sans-serif;\n}\n.pagination a, .pagination span, .pagination em {\n  max-height: 18px;\n  padding: 5px 10px;\n  display: block;\n  float: left;\n  margin-right: 1px;\n  border: 1px solid #ff0000;\n  text-decoration: none;\n  color: #000000;\n}\n.pagination .disabled {\n  color: #999999;\n  border: 1px solid #dddddd;\n}\n.pagination .current {\n  font-style: normal;\n  font-weight: bold;\n  background: #8b0000;\n  color: #ffffff;\n}\n.pagination a:hover, .pagination a:focus {\n  color: #000000;\n}\n.pagination .page_info {\n  background: #8b0000;\n  color: white;\n  padding: 0.4em 0.6em;\n  width: 22em;\n  margin-bottom: 0.3em;\n  text-align: center;\n}\n.pagination .page_info b {\n  color: #000000;\n  background: #000000;\n  padding: 0.1em 0.25em;\n}\n.pagination:after {\n  content: ".";\n  display: block;\n  height: 0;\n  clear: both;\n  visibility: hidden;\n}\n* html .pagination {\n  height: 1%;\n}\n*:first-child + html .pagination {\n  overflow: hidden;\n}\n\n/* ARTICLE */\n\n.article {\n  margin: 30px 0;\n  border-bottom: 2px solid rgba(150, 150, 100, 0.2);\n}\n\n/* ARTICLE_TITLE */\n\n.article_title {\n  text-align: center;\n  margin-bottom: 5px;\n}\n.article_title__link {\n  text-decoration: none;\n  color: black;\n  font-size: 30px;\n  font-family: 'Ubuntu', sans-serif;\n  margin: 0;\n}\n\n/* ARTICLE_CATEGORIES */\n\n.article_categories {\n\n}\n.article_categories__title {\n  font-size: 15px;\n  color: #111111;\n}\n.article_categories__list {\n  display: inline;\n  list-style-type: none;\n  margin: 0;\n  padding: 0;\n}\n.article_categories__item {\n  display: inline;\n  margin-left: 1px;\n  font-size: 14px;\n}\n.article_categories__link {\n  text-decoration: underline;\n  text-decoration-style: solid;\n  color: #111111;\n}\n\n/* ARTICLE_BODY */\n\n.article_body {\n  padding: 0;\n  margin: 15px 0;\n}\n.article_body > h1 {\n  margin-top: 10px;\n  margin-left: 0;\n  margin-bottom: 10px;\n  font-family: 'Ubuntu', sans-serif;\n  font-size: 18px;\n}\n.article_body > h2 {\n  margin-top: 10px;\n  margin-left: 0;\n  margin-bottom: 10px;\n  font-family: 'Ubuntu', sans-serif;\n  font-weight: normal;\n  font-size: 18px;\n}\n.article_body > h2:before {\n  content: "● ";\n}\n.article_body > h3 {\n  margin-top: 10px;\n  margin-left: 0;\n  margin-bottom: 10px;\n  font-family: 'Ubuntu', sans-serif;\n  font-weight: normal;\n  font-size: 18px;\n}\n.article_body > h3:before {\n  content: "○ ○ ";\n}\n.article_body > h4 {\n  margin-top: 10px;\n  margin-left: 0;\n  margin-bottom: 10px;\n  font-family: 'Ubuntu', sans-serif;\n  font-weight: normal;\n  font-style: oblique;\n  font-size: 18px;\n}\n.article_body > h4:before {\n  content: "– – – ";\n}\n.article_body > p {\n  margin-top: 10px;\n  margin-bottom: 10px;\n  font-family: 'Noticia Text', serif;\n  text-align: justify;\n  text-indent: 10px;\n}\n\nfigcaption {\n  font-size: small;\n  font-style: italic;\n}\ncode {\n  /*background-color: lightgrey;*/\n  border: 1px solid #d0d0b0;\n  font-size: smaller;\n  padding-left: 2px;\n  padding-right: 2px;\n}\ncode {\n  /*border: 2px solid grey;*/\n  padding: 2px 3px;\n  /*margin: 5px;*/\n  display: inline;\n  background-color: #222222;\n  color: #dddddd;\n  font-weight: bold;\n}\npre > code {\n  border: 5px solid #3c4049;\n  padding: 3px 7px;\n  margin: 1px 0px;;\n  display: inline-block;\n  background-color: #282c34;\n  color: #92a5b1;\n}\n\n/* ARTICLE_FOOTER */\n\n.article_footer {\n  font-size: 13px;\n  margin: 13px 0 13px 0;\n}\n.article_footer__created {\n  margin: 3px 0 3px 0;\n  display: block;\n  color: #111111;\n}\n.article_footer__author {\n  margin: 3px 0 3px 0;\n  display: block;\n  color: #111111;\n}\n\n\n/* PAGE_FOOTER */\n\n.page_footer {\n  margin: 0;\n  padding: 0;\n  display: flex;\n  flex-flow: row wrap;\n  justify-content: space-around;\n}\n.page_footer__section {\n  margin-top: 10px;\n  text-align: center;\n  font-style: italic;\n  font-family: 'Ubuntu', sans-serif;\n  width: 50%;\n}\n.page_footer__section > p {\n  font-family: 'Noticia Text', serif;\n  margin-top: 1px;\n  margin-bottom: 1px;\n  padding: 1px 0;\n  display: block;\n  text-align: center;\n  font-style: italic;\n  font-size: 14px;\n}\n.link_to_admin_panel {\n  display: block;\n  background-color: black;\n  color: #ffffee;\n  max-width: 750px;\n  margin: 0 auto;\n}\n\n	2017-07-23 16:55:21.236315	2017-07-23 16:55:21.236315	Default style
2	/* PAGE */\r\n\r\nbody {\r\n  background-color: black;\r\n  margin: 0;\r\n}\r\n.page_container {\r\n  max-width: 750px;\r\n  margin: 0 auto;\r\n  padding: 5px 20px;\r\n  background-color: #ffffee;\r\n}\r\n\r\n/* PAGE_HEADER */\r\n\r\n.page_header {\r\n  display: flex;\r\n  flex-flow: row wrap;\r\n}\r\n.page_header__section {\r\n  margin: 0;\r\n  padding: 0 10px 0 0;\r\n  display: block;\r\n  text-decoration: none;\r\n  color: black;\r\n}\r\n.page_header__section > h1 {\r\n  display: block;\r\n  font-size: 2em;\r\n  font-weight: bold;\r\n  margin: 0;\r\n  padding: 0;\r\n  font-family: 'Ubuntu', sans-serif;\r\n}\r\n.page_header__section > p {\r\n  margin-top: 0;\r\n  padding-top: 0;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  margin-bottom: 1px;\r\n  padding: 1px 0;\r\n  margin: 0;\r\n  display: block;\r\n  font-size: 14px;\r\n}\r\n\r\n/* MAIN NAVIGATION */\r\n\r\n.main_navigation {\r\n  display: flex;\r\n  flex-wrap: wrap;\r\n  justify-content: center;\r\n  margin: 0 1px;\r\n  padding: 0;\r\n  font-size: 14px;\r\n}\r\n.main_navigation__item {\r\n  min-width: 150px;\r\n  max-width: 100px;\r\n  flex: auto;\r\n  border: 1px solid red;\r\n  border-radius: 0;\r\n  margin: 2px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  padding: 0;\r\n  display: flex;\r\n  align-items: stretch;\r\n  font-size: 14px;\r\n}\r\n.main_navigation__link {\r\n  padding: 5px 3px;\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  flex: 1 1 auto;\r\n  text-decoration: inherit;\r\n  color: inherit;\r\n  margin: 0;\r\n  cursor: auto;\r\n  text-align: center\r\n}\r\n.main_navigation__link--active {\r\n  background-color: darkred;\r\n  color: white;\r\n  font-weight: bold;\r\n}\r\n\r\n/* PAGE_TITLE */\r\n\r\n.current_page_header {\r\n  text-align: center;\r\n  color: #8b0000;\r\n  font-size: 32px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  padding-bottom: 15px;\r\n  border-bottom: 1px solid #8b0000;\r\n}\r\n\r\n/* PAGINATION */\r\n\r\n.pagination {\r\n  font-family: 'Ubuntu', sans-serif;\r\n}\r\n.pagination a, .pagination span, .pagination em {\r\n  max-height: 18px;\r\n  padding: 5px 10px;\r\n  display: block;\r\n  float: left;\r\n  margin-right: 1px;\r\n  border: 1px solid #ff0000;\r\n  text-decoration: none;\r\n  color: #000000;\r\n}\r\n.pagination .disabled {\r\n  color: #999999;\r\n  border: 1px solid #dddddd;\r\n}\r\n.pagination .current {\r\n  font-style: normal;\r\n  font-weight: bold;\r\n  background: #8b0000;\r\n  color: #ffffff;\r\n}\r\n.pagination a:hover, .pagination a:focus {\r\n  color: #000000;\r\n}\r\n.pagination .page_info {\r\n  background: #8b0000;\r\n  color: white;\r\n  padding: 0.4em 0.6em;\r\n  width: 22em;\r\n  margin-bottom: 0.3em;\r\n  text-align: center;\r\n}\r\n.pagination .page_info b {\r\n  color: #000000;\r\n  background: #000000;\r\n  padding: 0.1em 0.25em;\r\n}\r\n.pagination:after {\r\n  content: ".";\r\n  display: block;\r\n  height: 0;\r\n  clear: both;\r\n  visibility: hidden;\r\n}\r\n* html .pagination {\r\n  height: 1%;\r\n}\r\n*:first-child + html .pagination {\r\n  overflow: hidden;\r\n}\r\n\r\n/* ARTICLE */\r\n\r\n.article {\r\n  margin: 30px 0;\r\n  border-bottom: 2px solid rgba(150, 150, 100, 0.2);\r\n}\r\n\r\n/* ARTICLE_TITLE */\r\n\r\n.article_title {\r\n  text-align: center;\r\n  margin-bottom: 5px;\r\n}\r\n.article_title__link {\r\n  text-decoration: none;\r\n  color: black;\r\n  font-size: 30px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  margin: 0;\r\n}\r\n\r\n/* ARTICLE_CATEGORIES */\r\n\r\n.article_categories {\r\n\r\n}\r\n.article_categories__title {\r\n  font-size: 15px;\r\n  color: #111111;\r\n}\r\n.article_categories__list {\r\n  display: inline;\r\n  list-style-type: none;\r\n  margin: 0;\r\n  padding: 0;\r\n}\r\n.article_categories__item {\r\n  display: inline;\r\n  margin-left: 1px;\r\n  font-size: 14px;\r\n}\r\n.article_categories__link {\r\n  text-decoration: underline;\r\n  text-decoration-style: solid;\r\n  color: #111111;\r\n}\r\n\r\n/* ARTICLE_BODY */\r\n\r\n.article_body {\r\n  padding: 0;\r\n  margin: 15px 0;\r\n}\r\n.article_body > h1 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-size: 18px;\r\n}\r\n.article_body > h2 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-weight: normal;\r\n  font-size: 18px;\r\n}\r\n.article_body > h2:before {\r\n  content: "● ";\r\n}\r\n.article_body > h3 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-weight: normal;\r\n  font-size: 18px;\r\n}\r\n.article_body > h3:before {\r\n  content: "○ ○ ";\r\n}\r\n.article_body > h4 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-weight: normal;\r\n  font-style: oblique;\r\n  font-size: 18px;\r\n}\r\n.article_body > h4:before {\r\n  content: "– – – ";\r\n}\r\n.article_body > p {\r\n  margin-top: 10px;\r\n  margin-bottom: 10px;\r\n  font-family: 'Noticia Text', serif;\r\n  text-align: justify;\r\n  text-indent: 10px;\r\n  font-size: 14px;\r\n}\r\n\r\nfigcaption {\r\n  font-size: small;\r\n  font-style: italic;\r\n}\r\ncode {\r\n  /*background-color: lightgrey;*/\r\n  border: 1px solid #d0d0b0;\r\n  font-size: smaller;\r\n  padding-left: 2px;\r\n  padding-right: 2px;\r\n}\r\ncode {\r\n  /*border: 2px solid grey;*/\r\n  padding: 2px 3px;\r\n  /*margin: 5px;*/\r\n  display: inline;\r\n  background-color: #222222;\r\n  color: #dddddd;\r\n  font-weight: bold;\r\n}\r\npre > code {\r\n  border: 5px solid #3c4049;\r\n  padding: 3px 7px;\r\n  margin: 1px 0px;;\r\n  display: inline-block;\r\n  background-color: #282c34;\r\n  color: #92a5b1;\r\n}\r\n\r\n/* ARTICLE_FOOTER */\r\n\r\n.article_footer {\r\n  font-size: 13px;\r\n  margin: 13px 0 13px 0;\r\n}\r\n.article_footer__created {\r\n  margin: 3px 0 3px 0;\r\n  display: block;\r\n  color: #111111;\r\n}\r\n.article_footer__author {\r\n  margin: 3px 0 3px 0;\r\n  display: block;\r\n  color: #111111;\r\n}\r\n\r\n\r\n/* PAGE_FOOTER */\r\n\r\n.page_footer {\r\n  margin: 0;\r\n  padding: 0;\r\n  display: flex;\r\n  flex-flow: row wrap;\r\n  justify-content: space-around;\r\n}\r\n.page_footer__section {\r\n  margin-top: 10px;\r\n  text-align: center;\r\n  font-style: italic;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  width: 50%;\r\n}\r\n.page_footer__section > p {\r\n  font-family: 'Noticia Text', serif;\r\n  margin-top: 1px;\r\n  margin-bottom: 1px;\r\n  padding: 1px 0;\r\n  display: block;\r\n  text-align: center;\r\n  font-style: italic;\r\n  font-size: 14px;\r\n}\r\n.link_to_admin_panel {\r\n  display: block;\r\n  background-color: black;\r\n  color: #ffffee;\r\n  max-width: 750px;\r\n  margin: 0 auto;\r\n}\r\n\r\n	2017-07-25 10:57:20.526364	2017-07-25 10:57:20.526364	Customized
3	/* PAGE */\r\n\r\nbody {\r\n  background-color: black;\r\n  margin: 0;\r\n}\r\n.page_container {\r\n  max-width: 750px;\r\n  margin: 0 auto;\r\n  padding: 5px 20px;\r\n  background-color: #ffffee;\r\n}\r\n\r\n/* PAGE_HEADER */\r\n\r\n.page_header {\r\n  display: flex;\r\n  flex-flow: row wrap;\r\n}\r\n.page_header__section {\r\n  margin: 0;\r\n  padding: 0 10px 0 0;\r\n  display: block;\r\n  text-decoration: none;\r\n  color: black;\r\n}\r\n.page_header__section > h1 {\r\n  display: block;\r\n  font-size: 2em;\r\n  font-weight: bold;\r\n  margin: 0;\r\n  padding: 0;\r\n  font-family: 'Ubuntu', sans-serif;\r\n}\r\n.page_header__section > p {\r\n  margin-top: 0;\r\n  padding-top: 0;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  margin-bottom: 1px;\r\n  padding: 1px 0;\r\n  margin: 0;\r\n  display: block;\r\n  font-size: 14px;\r\n}\r\n\r\n/* MAIN NAVIGATION */\r\n\r\n.main_navigation {\r\n  display: flex;\r\n  flex-wrap: wrap;\r\n  justify-content: center;\r\n  margin: 0 1px;\r\n  padding: 0;\r\n  font-size: 14px;\r\n}\r\n.main_navigation__item {\r\n  min-width: 150px;\r\n  max-width: 100px;\r\n  flex: auto;\r\n  border: 1px solid red;\r\n  border-radius: 0;\r\n  margin: 2px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  padding: 0;\r\n  display: flex;\r\n  align-items: stretch;\r\n  font-size: 14px;\r\n}\r\n.main_navigation__link {\r\n  padding: 5px 3px;\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  flex: 1 1 auto;\r\n  text-decoration: inherit;\r\n  color: inherit;\r\n  margin: 0;\r\n  cursor: pointer;\r\n  text-align: center;\r\n}\r\n.main_navigation__link--active {\r\n  background-color: darkred;\r\n  color: white;\r\n  font-weight: bold;\r\n}\r\n\r\n/* PAGE_TITLE */\r\n\r\n.current_page_header {\r\n  text-align: center;\r\n  color: #8b0000;\r\n  font-size: 32px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  padding-bottom: 15px;\r\n  border-bottom: 1px solid #8b0000;\r\n}\r\n\r\n/* PAGINATION */\r\n\r\n.pagination {\r\n  font-family: 'Ubuntu', sans-serif;\r\n}\r\n.pagination a, .pagination span, .pagination em {\r\n  max-height: 18px;\r\n  padding: 5px 10px;\r\n  display: block;\r\n  float: left;\r\n  margin-right: 1px;\r\n  border: 1px solid #ff0000;\r\n  text-decoration: none;\r\n  color: #000000;\r\n}\r\n.pagination .disabled {\r\n  color: #999999;\r\n  border: 1px solid #dddddd;\r\n}\r\n.pagination .current {\r\n  font-style: normal;\r\n  font-weight: bold;\r\n  background: #8b0000;\r\n  color: #ffffff;\r\n}\r\n.pagination a:hover, .pagination a:focus {\r\n  color: #000000;\r\n}\r\n.pagination .page_info {\r\n  background: #8b0000;\r\n  color: white;\r\n  padding: 0.4em 0.6em;\r\n  width: 22em;\r\n  margin-bottom: 0.3em;\r\n  text-align: center;\r\n}\r\n.pagination .page_info b {\r\n  color: #000000;\r\n  background: #000000;\r\n  padding: 0.1em 0.25em;\r\n}\r\n.pagination:after {\r\n  content: ".";\r\n  display: block;\r\n  height: 0;\r\n  clear: both;\r\n  visibility: hidden;\r\n}\r\n* html .pagination {\r\n  height: 1%;\r\n}\r\n*:first-child + html .pagination {\r\n  overflow: hidden;\r\n}\r\n\r\n/* ARTICLE */\r\n\r\n.article {\r\n  margin: 30px 0;\r\n  border-bottom: 2px solid rgba(150, 150, 100, 0.2);\r\n}\r\n\r\n/* ARTICLE_TITLE */\r\n\r\n.article_title {\r\n  text-align: center;\r\n  margin-bottom: 5px;\r\n}\r\n.article_title__link {\r\n  text-decoration: none;\r\n  color: black;\r\n  font-size: 30px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  margin: 0;\r\n}\r\n\r\n/* ARTICLE_CATEGORIES */\r\n\r\n.article_categories {\r\n\r\n}\r\n.article_categories__title {\r\n  font-size: 15px;\r\n  color: #111111;\r\n}\r\n.article_categories__list {\r\n  display: inline;\r\n  list-style-type: none;\r\n  margin: 0;\r\n  padding: 0;\r\n}\r\n.article_categories__item {\r\n  display: inline;\r\n  margin-left: 1px;\r\n  font-size: 14px;\r\n}\r\n.article_categories__link {\r\n  text-decoration: underline;\r\n  text-decoration-style: solid;\r\n  color: #111111;\r\n}\r\n\r\n/* ARTICLE_BODY */\r\n\r\n.article_body {\r\n  padding: 0;\r\n  margin: 15px 0;\r\n}\r\n.article_body > h1 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-size: 18px;\r\n}\r\n.article_body > h2 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-weight: normal;\r\n  font-size: 18px;\r\n}\r\n.article_body > h2:before {\r\n  content: "● ";\r\n}\r\n.article_body > h3 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-weight: normal;\r\n  font-size: 18px;\r\n}\r\n.article_body > h3:before {\r\n  content: "○ ○ ";\r\n}\r\n.article_body > h4 {\r\n  margin-top: 10px;\r\n  margin-left: 0;\r\n  margin-bottom: 10px;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  font-weight: normal;\r\n  font-style: oblique;\r\n  font-size: 18px;\r\n}\r\n.article_body > h4:before {\r\n  content: "– – – ";\r\n}\r\n.article_body > p {\r\n  margin-top: 10px;\r\n  margin-bottom: 10px;\r\n  font-family: 'Noticia Text', serif;\r\n  text-align: justify;\r\n  text-indent: 10px;\r\n}\r\n\r\nfigcaption {\r\n  font-size: small;\r\n  font-style: italic;\r\n}\r\ncode {\r\n  /*background-color: lightgrey;*/\r\n  border: 1px solid #d0d0b0;\r\n  font-size: smaller;\r\n  padding-left: 2px;\r\n  padding-right: 2px;\r\n}\r\n.article_body > code {\r\n  /*border: 2px solid grey;*/\r\n  padding: 2px 3px;\r\n  /*margin: 5px;*/\r\n  display: inline;\r\n  background-color: #222222;\r\n  color: #dddddd;\r\n  font-weight: bold;\r\n}\r\n.article_body > pre {\r\n  overflow: auto;\r\n}\r\n.article_body > pre > code {\r\n  border: 5px solid #3c4049;\r\n  padding: 3px 7px;\r\n  margin: 1px 0px;;\r\n  display: inline-block;\r\n  background-color: #282c34;\r\n  color: #92a5b1;\r\n}\r\n\r\n/* ARTICLE_FOOTER */\r\n\r\n.article_footer {\r\n  font-size: 13px;\r\n  margin: 13px 0 13px 0;\r\n  display: flex;\r\n  flex-flow: column;\r\n  align-items: flex-start;\r\n}\r\n.article_footer__created {\r\n  margin: 3px 0 3px 0;\r\n  color: #111111;\r\n}\r\n.article_footer__published {\r\n  margin: 3px 0 3px 0;\r\n  color: #111111;\r\n}\r\n.article_footer__author {\r\n  margin: 3px 0 3px 0;\r\n  color: #111111;\r\n}\r\n\r\n/* PAGE_FOOTER */\r\n\r\n.page_footer {\r\n  margin: 0;\r\n  padding: 0;\r\n  display: flex;\r\n  flex-flow: row wrap;\r\n  justify-content: space-around;\r\n}\r\n.page_footer__section {\r\n  margin-top: 10px;\r\n  text-align: center;\r\n  font-style: italic;\r\n  font-family: 'Ubuntu', sans-serif;\r\n  width: 50%;\r\n}\r\n.page_footer__section > p {\r\n  font-family: 'Noticia Text', serif;\r\n  margin-top: 1px;\r\n  margin-bottom: 1px;\r\n  padding: 1px 0;\r\n  display: block;\r\n  text-align: center;\r\n  font-style: italic;\r\n  font-size: 14px;\r\n}\r\n.link_to_admin_panel {\r\n  display: block;\r\n  background-color: black;\r\n  color: #ffffee;\r\n  max-width: 750px;\r\n  margin: 0 auto;\r\n}\r\n\r\n	2017-12-13 19:01:22.825857	2017-12-14 19:26:14.172745	horizontal scroll
\.


--
-- Name: stylesheets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simple_site_cms
--

SELECT pg_catalog.setval('public.stylesheets_id_seq', 3, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.categorizations
    ADD CONSTRAINT categorizations_pkey PRIMARY KEY (id);


--
-- Name: footer_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.footer_sections
    ADD CONSTRAINT footer_sections_pkey PRIMARY KEY (id);


--
-- Name: header_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.header_sections
    ADD CONSTRAINT header_sections_pkey PRIMARY KEY (id);


--
-- Name: nav_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.nav_sections
    ADD CONSTRAINT nav_sections_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: stylesheets_pkey; Type: CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.stylesheets
    ADD CONSTRAINT stylesheets_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- Name: index_admins_roles_on_admin_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_admins_roles_on_admin_id ON public.admins_roles USING btree (admin_id);


--
-- Name: index_admins_roles_on_admin_id_and_role_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_admins_roles_on_admin_id_and_role_id ON public.admins_roles USING btree (admin_id, role_id);


--
-- Name: index_admins_roles_on_role_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_admins_roles_on_role_id ON public.admins_roles USING btree (role_id);


--
-- Name: index_articles_on_author_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_articles_on_author_id ON public.articles USING btree (author_id);


--
-- Name: index_articles_on_published_at; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_articles_on_published_at ON public.articles USING btree (published_at);


--
-- Name: index_authors_on_admin_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_authors_on_admin_id ON public.authors USING btree (admin_id);


--
-- Name: index_categorizations_on_article_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_categorizations_on_article_id ON public.categorizations USING btree (article_id);


--
-- Name: index_categorizations_on_category_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_categorizations_on_category_id ON public.categorizations USING btree (category_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_roles_on_name ON public.roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON public.roles USING btree (name, resource_type, resource_id);


--
-- Name: index_roles_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_roles_on_resource_type_and_resource_id ON public.roles USING btree (resource_type, resource_id);


--
-- Name: index_sites_on_stylesheet_id; Type: INDEX; Schema: public; Owner: simple_site_cms
--

CREATE INDEX index_sites_on_stylesheet_id ON public.sites USING btree (stylesheet_id);


--
-- Name: fk_rails_4eeab39495; Type: FK CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT fk_rails_4eeab39495 FOREIGN KEY (admin_id) REFERENCES public.admins(id);


--
-- Name: fk_rails_5a40b79a1d; Type: FK CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.categorizations
    ADD CONSTRAINT fk_rails_5a40b79a1d FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: fk_rails_c475bb8261; Type: FK CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.categorizations
    ADD CONSTRAINT fk_rails_c475bb8261 FOREIGN KEY (article_id) REFERENCES public.articles(id);


--
-- Name: fk_rails_ddc6851089; Type: FK CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.sites
    ADD CONSTRAINT fk_rails_ddc6851089 FOREIGN KEY (stylesheet_id) REFERENCES public.stylesheets(id);


--
-- Name: fk_rails_e74ce85cbc; Type: FK CONSTRAINT; Schema: public; Owner: simple_site_cms
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_rails_e74ce85cbc FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

