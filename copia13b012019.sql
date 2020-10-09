--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: oauth; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA oauth;


ALTER SCHEMA oauth OWNER TO postgres;

--
-- Name: plataforma; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA plataforma;


ALTER SCHEMA plataforma OWNER TO postgres;

--
-- Name: portal_transparencia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA portal_transparencia;


ALTER SCHEMA portal_transparencia OWNER TO postgres;

--
-- Name: seguridad; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA seguridad;


ALTER SCHEMA seguridad OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = oauth, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: oauth2_access_tokens; Type: TABLE; Schema: oauth; Owner: postgres
--

CREATE TABLE oauth2_access_tokens (
    id integer NOT NULL,
    client_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expires_at integer,
    scope character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE oauth2_access_tokens OWNER TO postgres;

--
-- Name: oauth2_access_tokens_id_seq; Type: SEQUENCE; Schema: oauth; Owner: postgres
--

CREATE SEQUENCE oauth2_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_access_tokens_id_seq OWNER TO postgres;

--
-- Name: oauth2_auth_codes; Type: TABLE; Schema: oauth; Owner: postgres
--

CREATE TABLE oauth2_auth_codes (
    id integer NOT NULL,
    client_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    redirect_uri text NOT NULL,
    expires_at integer,
    scope character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE oauth2_auth_codes OWNER TO postgres;

--
-- Name: oauth2_auth_codes_id_seq; Type: SEQUENCE; Schema: oauth; Owner: postgres
--

CREATE SEQUENCE oauth2_auth_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_auth_codes_id_seq OWNER TO postgres;

--
-- Name: oauth2_clients; Type: TABLE; Schema: oauth; Owner: postgres
--

CREATE TABLE oauth2_clients (
    id integer NOT NULL,
    random_id character varying(255) NOT NULL,
    redirect_uris text NOT NULL,
    secret character varying(255) NOT NULL,
    allowed_grant_types text NOT NULL
);


ALTER TABLE oauth2_clients OWNER TO postgres;

--
-- Name: COLUMN oauth2_clients.redirect_uris; Type: COMMENT; Schema: oauth; Owner: postgres
--

COMMENT ON COLUMN oauth2_clients.redirect_uris IS '(DC2Type:array)';


--
-- Name: COLUMN oauth2_clients.allowed_grant_types; Type: COMMENT; Schema: oauth; Owner: postgres
--

COMMENT ON COLUMN oauth2_clients.allowed_grant_types IS '(DC2Type:array)';


--
-- Name: oauth2_clients_id_seq; Type: SEQUENCE; Schema: oauth; Owner: postgres
--

CREATE SEQUENCE oauth2_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_clients_id_seq OWNER TO postgres;

--
-- Name: oauth2_refresh_tokens; Type: TABLE; Schema: oauth; Owner: postgres
--

CREATE TABLE oauth2_refresh_tokens (
    id integer NOT NULL,
    client_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    expires_at integer,
    scope character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE oauth2_refresh_tokens OWNER TO postgres;

--
-- Name: oauth2_refresh_tokens_id_seq; Type: SEQUENCE; Schema: oauth; Owner: postgres
--

CREATE SEQUENCE oauth2_refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_refresh_tokens_id_seq OWNER TO postgres;

SET search_path = plataforma, pg_catalog;

--
-- Name: correlativo; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE correlativo
    START WITH 1
    INCREMENT BY 1
    MINVALUE -1
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE correlativo OWNER TO postgres;

--
-- Name: etapa; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE etapa (
    id integer NOT NULL,
    fecha_inicio1 date,
    fecha_final1 date,
    monto1 integer,
    fecha_inicio2 date,
    fecha_final2 date,
    monto2 integer,
    fecha_inicio3 date,
    fecha_final3 date,
    monto3 integer,
    fecha_inicio4 date,
    fecha_final4 date,
    monto4 integer,
    fecha_inicio5 date,
    fecha_final5 date,
    monto5 integer,
    proyecto_id integer,
    fecha_inicio6 date,
    fecha_final6 date,
    monto6 integer,
    fecha_inicio7 date,
    fecha_final7 date,
    monto7 integer,
    fecha_inicio8 date,
    fecha_final8 date,
    monto8 integer,
    fecha_inicio9 date,
    fecha_final9 date,
    monto9 integer,
    fecha_inicio10 date,
    fecha_final10 date,
    monto10 integer
);


ALTER TABLE etapa OWNER TO postgres;

--
-- Name: etapa_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE etapa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE etapa_id_seq OWNER TO postgres;

--
-- Name: grupo; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE grupo (
    id integer NOT NULL,
    nombre_grupo character varying(255) NOT NULL
);


ALTER TABLE grupo OWNER TO postgres;

--
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupo_id_seq OWNER TO postgres;

--
-- Name: institucion; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE institucion (
    id integer NOT NULL,
    nombre_institucion character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    correo_electronico character varying(255) NOT NULL,
    jefe_entidad character varying(255) NOT NULL,
    tipo character varying(100) NOT NULL
);


ALTER TABLE institucion OWNER TO postgres;

--
-- Name: institucion_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE institucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE institucion_id_seq OWNER TO postgres;

--
-- Name: mensaje; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE mensaje (
    id integer NOT NULL,
    nombre_completo character varying(255) NOT NULL,
    numero_telefono integer NOT NULL,
    email character varying(255) NOT NULL,
    mensaje character varying(255) NOT NULL
);


ALTER TABLE mensaje OWNER TO postgres;

--
-- Name: mensaje_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE mensaje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mensaje_id_seq OWNER TO postgres;

--
-- Name: meta; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE meta (
    id integer NOT NULL,
    pilares_id integer,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE meta OWNER TO postgres;

--
-- Name: meta_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meta_id_seq OWNER TO postgres;

--
-- Name: municipio; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE municipio (
    id integer NOT NULL,
    provincia_id integer,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE municipio OWNER TO postgres;

--
-- Name: municipio_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE municipio_id_seq OWNER TO postgres;

--
-- Name: persona; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE persona (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    paterno character varying(255) NOT NULL,
    materno character varying(255) NOT NULL,
    tipo_documento character varying(25) NOT NULL,
    numero_documento character varying(50) NOT NULL,
    direccion character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    telefono character varying(100) NOT NULL,
    celular character varying(100) NOT NULL
);


ALTER TABLE persona OWNER TO postgres;

--
-- Name: persona_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persona_id_seq OWNER TO postgres;

--
-- Name: pilares; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE pilares (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE pilares OWNER TO postgres;

--
-- Name: pilares_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE pilares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pilares_id_seq OWNER TO postgres;

--
-- Name: producto; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE producto (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE producto OWNER TO postgres;

--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE producto_id_seq OWNER TO postgres;

--
-- Name: provincia; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE provincia (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    departamento character varying(255) NOT NULL
);


ALTER TABLE provincia OWNER TO postgres;

--
-- Name: provincia_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE provincia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provincia_id_seq OWNER TO postgres;

--
-- Name: proyecto; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE proyecto (
    id integer NOT NULL,
    codigo_sistema character varying(255),
    fecha_registro date NOT NULL,
    objetivo_general character varying(555),
    objetivo_especifico character varying(555) NOT NULL,
    fecha_modificacion timestamp(0) without time zone NOT NULL,
    departamento character varying(255) DEFAULT NULL::character varying,
    nombre_proyecto character varying(255) DEFAULT NULL::character varying,
    inversion character varying(255) DEFAULT NULL::character varying,
    area_ejecucion character varying(255) DEFAULT NULL::character varying,
    descripcion_problema character varying(555) DEFAULT NULL::character varying,
    solucion_planteada character varying(555) DEFAULT NULL::character varying,
    pilar character varying(255) DEFAULT NULL::character varying,
    meta character varying(255) DEFAULT NULL::character varying,
    resultado character varying(255) DEFAULT NULL::character varying,
    accion character varying(255) DEFAULT NULL::character varying,
    codigo_sicoes character varying(255) DEFAULT NULL::character varying,
    empresa_adjudicada character varying(255) DEFAULT NULL::character varying,
    estudio_realizado character varying(255) DEFAULT NULL::character varying,
    fecha_iniciop date,
    fecha_finalp date,
    monto_presupuesto integer,
    monto_firma integer,
    etapa character varying(255) DEFAULT NULL::character varying,
    fecha_inicioe date,
    fecha_finale date,
    monto_presupuestoe integer,
    monto_firmae integer,
    familia_beneficiada integer,
    municipio_beneficiado integer,
    comunidad_beneficiada integer,
    usuario_registro character varying(255) DEFAULT NULL::character varying,
    contrato character varying(255) DEFAULT NULL::character varying,
    tecnico character varying(255) DEFAULT NULL::character varying,
    comision character varying(255) DEFAULT NULL::character varying,
    orden character varying(255) DEFAULT NULL::character varying,
    institucion integer,
    provincia integer,
    municipio integer
);


ALTER TABLE proyecto OWNER TO postgres;

--
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -1
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE proyecto_id_seq OWNER TO postgres;

--
-- Name: registro_variable; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE registro_variable (
    id integer NOT NULL,
    proyecto_id integer,
    variable_id integer,
    valor_variable character varying(255) NOT NULL,
    tipo character varying(100) NOT NULL
);


ALTER TABLE registro_variable OWNER TO postgres;

--
-- Name: registro_variable_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE registro_variable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registro_variable_id_seq OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE roles (
    id integer NOT NULL,
    usuario_id integer,
    rol character varying(255) NOT NULL
);


ALTER TABLE roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- Name: seguimiento; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE seguimiento (
    id integer NOT NULL,
    longitud character varying(255) NOT NULL,
    latitud character varying(255) NOT NULL,
    proyecto_id integer,
    avance integer,
    foto1 text,
    foto2 text,
    foto3 text,
    foto4 text,
    foto5 text,
    foto6 text,
    foto7 text,
    foto8 text,
    foto9 text,
    foto10 text
);


ALTER TABLE seguimiento OWNER TO postgres;

--
-- Name: seguimiento_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE seguimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE -1
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE seguimiento_id_seq OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    persona_id integer,
    institucion_id integer,
    departamento character varying(255) NOT NULL,
    municipio_id integer NOT NULL,
    nombre_usuario character varying(255) NOT NULL,
    clave character varying(255) NOT NULL,
    fecha_inicio timestamp(0) without time zone NOT NULL,
    fecha_fin timestamp(0) without time zone NOT NULL,
    estado integer NOT NULL,
    imagen character varying(255) NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- Name: valor; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE valor (
    id integer NOT NULL,
    variable_id integer,
    valor character varying(255) NOT NULL,
    habilita character varying(255) NOT NULL,
    defecto character varying(255) NOT NULL
);


ALTER TABLE valor OWNER TO postgres;

--
-- Name: valor_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE valor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE valor_id_seq OWNER TO postgres;

--
-- Name: variable; Type: TABLE; Schema: plataforma; Owner: postgres
--

CREATE TABLE variable (
    id integer NOT NULL,
    grupo_id integer,
    nombre_variable character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    control character varying(255) NOT NULL,
    tipo_dato character varying(255) NOT NULL
);


ALTER TABLE variable OWNER TO postgres;

--
-- Name: variable_id_seq; Type: SEQUENCE; Schema: plataforma; Owner: postgres
--

CREATE SEQUENCE variable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE variable_id_seq OWNER TO postgres;

SET search_path = portal_transparencia, pg_catalog;

--
-- Name: actividad_archivos_imagenes; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE actividad_archivos_imagenes (
    id_archivo integer NOT NULL,
    id_actividad integer,
    path_archivo character varying(500) DEFAULT NULL::character varying,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario integer,
    extension_archivo character varying(50) DEFAULT NULL::character varying,
    etapa_archivo character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE actividad_archivos_imagenes OWNER TO postgres;

--
-- Name: actividad_archivos_imagenes_id_archivo_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE actividad_archivos_imagenes_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actividad_archivos_imagenes_id_archivo_seq OWNER TO postgres;

--
-- Name: actividades; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE actividades (
    id_actividad integer NOT NULL,
    id_tipo_actividad integer,
    id_entidad integer,
    nombre_actividad character varying(500) DEFAULT NULL::character varying,
    fecha_actividad timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    fecha_creacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    descripcion_actividad character varying(5000) DEFAULT NULL::character varying,
    id_usuario_creador integer,
    id_usuario_revisor integer,
    fecha_revision timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_estado integer,
    direccion_actividad character varying(500) DEFAULT NULL::character varying,
    objetivo_actividad character varying(500) DEFAULT NULL::character varying,
    url_facebook character varying(500) DEFAULT NULL::character varying,
    url_youtube character varying(500) DEFAULT NULL::character varying,
    url_twitter character varying(500) DEFAULT NULL::character varying,
    latitud numeric(10,0) DEFAULT NULL::numeric,
    longitud numeric(10,0) DEFAULT NULL::numeric,
    path_imagen_principal character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE actividades OWNER TO postgres;

--
-- Name: actividades_id_actividad_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE actividades_id_actividad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actividades_id_actividad_seq OWNER TO postgres;

--
-- Name: articulos; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE articulos (
    id_articulo integer NOT NULL,
    id_componente integer,
    titulo_articulo character varying(500) DEFAULT NULL::character varying,
    descripcion_articulo character varying(500) DEFAULT NULL::character varying,
    autor_editor character varying(500) DEFAULT NULL::character varying,
    path_imagen character varying(500) DEFAULT NULL::character varying,
    url_facebook character varying(500) DEFAULT NULL::character varying,
    url_youtube character varying(500) DEFAULT NULL::character varying,
    url_twitter character varying(500) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE articulos OWNER TO postgres;

--
-- Name: articulos_id_articulo_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE articulos_id_articulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articulos_id_articulo_seq OWNER TO postgres;

--
-- Name: asistentes; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE asistentes (
    id_asistente integer NOT NULL,
    id_actividad integer,
    nro_carnet character varying(500) DEFAULT NULL::character varying,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario integer,
    id_organizacion_social integer,
    cargo_organizacion_social character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE asistentes OWNER TO postgres;

--
-- Name: asistentes_id_asistente_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE asistentes_id_asistente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE asistentes_id_asistente_seq OWNER TO postgres;

--
-- Name: asistentes_rpc; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE asistentes_rpc (
    id_asistente integer NOT NULL,
    id_entidad_rpc integer,
    id_actividad integer,
    nro_carnet character varying(500) DEFAULT NULL::character varying,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario integer,
    id_organizacion_social integer,
    cargo_organizacion_social character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE asistentes_rpc OWNER TO postgres;

--
-- Name: asistentes_rpc_id_asistente_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE asistentes_rpc_id_asistente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE asistentes_rpc_id_asistente_seq OWNER TO postgres;

--
-- Name: categoria_entidad; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE categoria_entidad (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE categoria_entidad OWNER TO postgres;

--
-- Name: categoria_entidad_id_categoria_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE categoria_entidad_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_entidad_id_categoria_seq OWNER TO postgres;

--
-- Name: componente_portal; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE componente_portal (
    id_componente integer NOT NULL,
    nombre_componente character varying(100) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE componente_portal OWNER TO postgres;

--
-- Name: componente_portal_id_componente_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE componente_portal_id_componente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE componente_portal_id_componente_seq OWNER TO postgres;

--
-- Name: consultas_ciudadano; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE consultas_ciudadano (
    id_consulta integer NOT NULL,
    id_componente integer,
    nombre_completo character varying(500) DEFAULT NULL::character varying,
    email character varying(500) DEFAULT NULL::character varying,
    telefono_celular character varying(500) DEFAULT NULL::character varying,
    asunto character varying(500) DEFAULT NULL::character varying,
    consulta character varying(5000) DEFAULT NULL::character varying,
    id_estado integer,
    descripcion_respuesta character varying(500) DEFAULT NULL::character varying,
    path_respuesta character varying(500) DEFAULT NULL::character varying,
    fecha_consulta timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario_respuesta integer,
    fecha_respuesta timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE consultas_ciudadano OWNER TO postgres;

--
-- Name: consultas_ciudadano_id_consulta_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE consultas_ciudadano_id_consulta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consultas_ciudadano_id_consulta_seq OWNER TO postgres;

--
-- Name: cronogramas; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE cronogramas (
    id_cronograma integer NOT NULL,
    id_entidad_rpc integer,
    id_departamento integer,
    fecha_creacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    fecha_cronograma timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario integer,
    lugar_rendicion character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE cronogramas OWNER TO postgres;

--
-- Name: cronogramas_id_cronograma_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE cronogramas_id_cronograma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cronogramas_id_cronograma_seq OWNER TO postgres;

--
-- Name: cursos; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE cursos (
    id_curso integer NOT NULL,
    id_entidad integer,
    nombre_curso character varying(500) DEFAULT NULL::character varying,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    fecha_inicio_curso date,
    fecha_final_curso date,
    path_imagen character varying(500) DEFAULT NULL::character varying,
    fecha_inicio_inscripciones date,
    fecha_final_inscripciones date,
    id_componente integer,
    modalidad_curso character varying(50) DEFAULT NULL::character varying,
    url_facebook character varying(500) DEFAULT NULL::character varying,
    url_youtube character varying(500) DEFAULT NULL::character varying,
    url_twitter character varying(500) DEFAULT NULL::character varying,
    path_convocatoria character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE cursos OWNER TO postgres;

--
-- Name: cursos_id_curso_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE cursos_id_curso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cursos_id_curso_seq OWNER TO postgres;

--
-- Name: departamentos; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE departamentos (
    id_departamento integer NOT NULL,
    nombre_departamento character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE departamentos OWNER TO postgres;

--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE departamentos_id_departamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE departamentos_id_departamento_seq OWNER TO postgres;

--
-- Name: enlaces_componente; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE enlaces_componente (
    id_enlace integer NOT NULL,
    id_componente integer,
    url_enlace character varying(500) DEFAULT NULL::character varying,
    path_imagen character varying(500) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    titulo_enlace character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE enlaces_componente OWNER TO postgres;

--
-- Name: enlaces_componente_id_enlace_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE enlaces_componente_id_enlace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enlaces_componente_id_enlace_seq OWNER TO postgres;

--
-- Name: entidades; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE entidades (
    id_entidad integer NOT NULL,
    id_categoria integer,
    nombre_entidad character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE entidades OWNER TO postgres;

--
-- Name: entidades_id_entidad_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE entidades_id_entidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entidades_id_entidad_seq OWNER TO postgres;

--
-- Name: entidades_params_web; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE entidades_params_web (
    id_entidad_param integer NOT NULL,
    id_entidad integer,
    id_parametro integer,
    url_parametro_web character varying(500) DEFAULT NULL::character varying,
    descripcion_parametro_web character varying(500) DEFAULT NULL::character varying,
    fecha_registro date,
    id_usuario_creador integer,
    id_usuario_revisor integer,
    fecha_revision timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_estado integer,
    observaciones character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE entidades_params_web OWNER TO postgres;

--
-- Name: entidades_params_web_id_entidad_param_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE entidades_params_web_id_entidad_param_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entidades_params_web_id_entidad_param_seq OWNER TO postgres;

--
-- Name: entidades_rpc; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE entidades_rpc (
    id_entidad_rpc integer NOT NULL,
    id_rendicion integer,
    id_entidad integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    path_rpc character varying(500) DEFAULT NULL::character varying,
    estado_notificacion character varying(500) DEFAULT NULL::character varying,
    id_usuario integer
);


ALTER TABLE entidades_rpc OWNER TO postgres;

--
-- Name: entidades_rpc_id_entidad_rpc_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE entidades_rpc_id_entidad_rpc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entidades_rpc_id_entidad_rpc_seq OWNER TO postgres;

--
-- Name: horarios_curso; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE horarios_curso (
    id_horario integer NOT NULL,
    id_curso integer,
    dias character varying(500) DEFAULT NULL::character varying,
    hora_inicio character varying(500) DEFAULT NULL::character varying,
    hora_final character varying(500) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE horarios_curso OWNER TO postgres;

--
-- Name: horarios_curso_id_horario_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE horarios_curso_id_horario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE horarios_curso_id_horario_seq OWNER TO postgres;

--
-- Name: invitaciones; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE invitaciones (
    id_invitacion integer NOT NULL,
    id_organizacion_social integer,
    id_cronograma integer,
    nro_carnet character varying(500) DEFAULT NULL::character varying,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario integer,
    cargo_organizacion_social character varying(500) DEFAULT NULL::character varying,
    path_invitacion_escaneada character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE invitaciones OWNER TO postgres;

--
-- Name: invitaciones_id_invitacion_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE invitaciones_id_invitacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invitaciones_id_invitacion_seq OWNER TO postgres;

--
-- Name: modulos_curso; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE modulos_curso (
    id_modulo integer NOT NULL,
    id_curso integer,
    titulo_modulo character varying(500) DEFAULT NULL::character varying,
    descripcion_modulo character varying(5000) DEFAULT NULL::character varying,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario integer
);


ALTER TABLE modulos_curso OWNER TO postgres;

--
-- Name: modulos_curso_id_modulo_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE modulos_curso_id_modulo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modulos_curso_id_modulo_seq OWNER TO postgres;

--
-- Name: organizaciones_sociales; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE organizaciones_sociales (
    id_organizacion_social integer NOT NULL,
    sigla character varying(50) DEFAULT NULL::character varying,
    nombre_completo character varying(500) DEFAULT NULL::character varying,
    id_departamento integer,
    descripcion character varying(500) DEFAULT NULL::character varying,
    telefonos character varying(500) DEFAULT NULL::character varying,
    correo_electronico character varying(500) DEFAULT NULL::character varying,
    direccion character varying(500) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE organizaciones_sociales OWNER TO postgres;

--
-- Name: organizaciones_sociales_id_organizacion_social_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE organizaciones_sociales_id_organizacion_social_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organizaciones_sociales_id_organizacion_social_seq OWNER TO postgres;

--
-- Name: parametros_paginas_web; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE parametros_paginas_web (
    id_parametro integer NOT NULL,
    nombre_parametro character varying(500) DEFAULT NULL::character varying,
    descripcion_parametro character varying(500) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_creacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_estado integer
);


ALTER TABLE parametros_paginas_web OWNER TO postgres;

--
-- Name: parametros_paginas_web_id_parametro_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE parametros_paginas_web_id_parametro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parametros_paginas_web_id_parametro_seq OWNER TO postgres;

--
-- Name: personas; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE personas (
    nro_carnet character varying(500) NOT NULL,
    id_departamento integer,
    id_usuario integer,
    profesion character varying(500) DEFAULT NULL::character varying,
    fecha_creacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    telefono_celular character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE personas OWNER TO postgres;

--
-- Name: personas_nro_carnet_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE personas_nro_carnet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_nro_carnet_seq OWNER TO postgres;

--
-- Name: requisitos_curso; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE requisitos_curso (
    id_requisito integer NOT NULL,
    id_curso integer,
    nombre_requisito character varying(500) DEFAULT NULL::character varying,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_usuario integer
);


ALTER TABLE requisitos_curso OWNER TO postgres;

--
-- Name: requisitos_curso_id_requisito_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE requisitos_curso_id_requisito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE requisitos_curso_id_requisito_seq OWNER TO postgres;

--
-- Name: resultados_actividad; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE resultados_actividad (
    id_resultado integer NOT NULL,
    id_actividad integer,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    descripcion_resultado character varying(500) DEFAULT NULL::character varying,
    url_facebook character varying(500) DEFAULT NULL::character varying,
    url_youtube character varying(500) DEFAULT NULL::character varying,
    url_twitter character varying(500) DEFAULT NULL::character varying,
    path_acta character varying(500) DEFAULT NULL::character varying,
    path_scaneado_participantes character varying(500) DEFAULT NULL::character varying,
    path_imagen_principal character varying(500) DEFAULT NULL::character varying,
    id_estado integer
);


ALTER TABLE resultados_actividad OWNER TO postgres;

--
-- Name: resultados_actividad_id_resultado_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE resultados_actividad_id_resultado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resultados_actividad_id_resultado_seq OWNER TO postgres;

--
-- Name: resultados_rpc; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE resultados_rpc (
    id_resultado integer NOT NULL,
    id_entidad_rpc integer,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    descripcion_resultado character varying(500) DEFAULT NULL::character varying,
    url_facebook character varying(500) DEFAULT NULL::character varying,
    url_youtube character varying(500) DEFAULT NULL::character varying,
    url_twitter character varying(500) DEFAULT NULL::character varying,
    path_acta character varying(500) DEFAULT NULL::character varying,
    path_scaneado_participantes character varying(500) DEFAULT NULL::character varying,
    id_estado integer
);


ALTER TABLE resultados_rpc OWNER TO postgres;

--
-- Name: resultados_rpc_id_resultado_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE resultados_rpc_id_resultado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resultados_rpc_id_resultado_seq OWNER TO postgres;

--
-- Name: rpc; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE rpc (
    id_rendicion integer NOT NULL,
    id_tipo_rpc integer,
    descripcion_rendicion character varying(500) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_creacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    fecha_inicio timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    fecha_final timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE rpc OWNER TO postgres;

--
-- Name: rpc_id_rendicion_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE rpc_id_rendicion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rpc_id_rendicion_seq OWNER TO postgres;

--
-- Name: seccion_informativa; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE seccion_informativa (
    id_seccion integer NOT NULL,
    id_componente integer,
    titulo_seccion character varying(500) DEFAULT NULL::character varying,
    descripcion_seccion character varying(500) DEFAULT NULL::character varying,
    path_imagen character varying(500) DEFAULT NULL::character varying,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE seccion_informativa OWNER TO postgres;

--
-- Name: seccion_informativa_id_seccion_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE seccion_informativa_id_seccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seccion_informativa_id_seccion_seq OWNER TO postgres;

--
-- Name: tipos_actividad; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE tipos_actividad (
    id_tipo_actividad integer NOT NULL,
    id_componente integer,
    nombre_tipo_actividad character varying(200) DEFAULT NULL::character varying,
    estado_notificacion integer,
    id_estado integer,
    id_usuario integer,
    fecha_registro timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE tipos_actividad OWNER TO postgres;

--
-- Name: tipos_actividad_id_tipo_actividad_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE tipos_actividad_id_tipo_actividad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipos_actividad_id_tipo_actividad_seq OWNER TO postgres;

--
-- Name: tipos_rpc; Type: TABLE; Schema: portal_transparencia; Owner: postgres
--

CREATE TABLE tipos_rpc (
    id_tipo_rpc integer NOT NULL,
    nombre_tipo_rpc character varying(500) DEFAULT NULL::character varying,
    id_estado integer
);


ALTER TABLE tipos_rpc OWNER TO postgres;

--
-- Name: tipos_rpc_id_tipo_rpc_seq; Type: SEQUENCE; Schema: portal_transparencia; Owner: postgres
--

CREATE SEQUENCE tipos_rpc_id_tipo_rpc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipos_rpc_id_tipo_rpc_seq OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: mensaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mensaje (
    id integer NOT NULL,
    nombre_completo character varying(255) NOT NULL,
    numero_telefono integer NOT NULL,
    email character varying(255) NOT NULL,
    mensaje character varying(255) NOT NULL
);


ALTER TABLE mensaje OWNER TO postgres;

--
-- Name: mensaje_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mensaje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mensaje_id_seq OWNER TO postgres;

--
-- Name: meta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE meta (
    id integer NOT NULL,
    pilares_id integer,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE meta OWNER TO postgres;

--
-- Name: meta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meta_id_seq OWNER TO postgres;

--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migration_versions (
    version character varying(255) NOT NULL
);


ALTER TABLE migration_versions OWNER TO postgres;

--
-- Name: pilares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pilares (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE pilares OWNER TO postgres;

--
-- Name: pilares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pilares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pilares_id_seq OWNER TO postgres;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE producto (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE producto OWNER TO postgres;

--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE producto_id_seq OWNER TO postgres;

--
-- Name: seguimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE seguimiento (
    id integer NOT NULL,
    longitud character varying(255) NOT NULL,
    latitud character varying(255) NOT NULL,
    avance character varying(255) NOT NULL,
    foto character varying(255) NOT NULL
);


ALTER TABLE seguimiento OWNER TO postgres;

--
-- Name: seguimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seguimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguimiento_id_seq OWNER TO postgres;

SET search_path = seguridad, pg_catalog;

--
-- Name: elemento_menu; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE elemento_menu (
    id integer NOT NULL,
    elemento_padre_id integer,
    path character varying(255) DEFAULT NULL::character varying,
    texto character varying(100) NOT NULL,
    icono character varying(100) DEFAULT NULL::character varying,
    posicion integer NOT NULL,
    parametros character varying(255) DEFAULT NULL::character varying,
    activo boolean NOT NULL
);


ALTER TABLE elemento_menu OWNER TO postgres;

--
-- Name: elemento_menu_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: postgres
--

CREATE SEQUENCE elemento_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE elemento_menu_id_seq OWNER TO postgres;

--
-- Name: entidad; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE entidad (
    id integer NOT NULL,
    tipo_entidad_id integer,
    departamento_id integer NOT NULL,
    alcance_id integer NOT NULL,
    entidad_tutora_id integer,
    usuario_creador_id integer NOT NULL,
    usuario_ultima_modificacion_id integer,
    nombre character varying(255) NOT NULL,
    sigla character varying(255) NOT NULL,
    activo boolean NOT NULL,
    fecha_creacion timestamp(0) without time zone NOT NULL,
    fecha_ultima_modificacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    id_categoria bigint
);


ALTER TABLE entidad OWNER TO postgres;

--
-- Name: modulo; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE modulo (
    id integer NOT NULL,
    usuario_creador_id integer NOT NULL,
    usuario_modificador_id integer,
    nombre_servicio character varying(255) NOT NULL,
    descripcion text NOT NULL,
    dominio character varying(255) NOT NULL,
    estado boolean NOT NULL,
    fecha_creacion timestamp(0) without time zone NOT NULL,
    fecha_modificacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE modulo OWNER TO postgres;

--
-- Name: modulo_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: postgres
--

CREATE SEQUENCE modulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modulo_id_seq OWNER TO postgres;

--
-- Name: permiso; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE permiso (
    id integer NOT NULL,
    usuario_creador_id integer NOT NULL,
    usuario_modificador_id integer,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL,
    activo boolean NOT NULL,
    fecha_creacion timestamp(0) without time zone NOT NULL,
    fecha_modificacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    modulo_id integer NOT NULL
);


ALTER TABLE permiso OWNER TO postgres;

--
-- Name: permiso_elemento_menu; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE permiso_elemento_menu (
    menu_id integer NOT NULL,
    permiso_id integer NOT NULL
);


ALTER TABLE permiso_elemento_menu OWNER TO postgres;

--
-- Name: permiso_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: postgres
--

CREATE SEQUENCE permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permiso_id_seq OWNER TO postgres;

--
-- Name: rol; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE rol (
    id integer NOT NULL,
    usuario_creador_id integer NOT NULL,
    usuario_modificador_id integer,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    activo boolean NOT NULL,
    fecha_creacion timestamp(0) without time zone NOT NULL,
    fecha_modificacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE rol OWNER TO postgres;

--
-- Name: rol_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: postgres
--

CREATE SEQUENCE rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rol_id_seq OWNER TO postgres;

--
-- Name: rol_permiso; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE rol_permiso (
    rol_id integer NOT NULL,
    permiso_id integer NOT NULL
);


ALTER TABLE rol_permiso OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    usuario_creador_id integer NOT NULL,
    usuario_modificador_id integer,
    nombre_usuario character varying(255) NOT NULL,
    clave character varying(256) NOT NULL,
    fecha_creacion timestamp(0) without time zone NOT NULL,
    fecha_modificacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    fecha_asignacion date NOT NULL,
    fecha_alta date NOT NULL,
    fecha_baja date,
    activo boolean NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: seguridad; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_permiso; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE usuario_permiso (
    usuario_id integer NOT NULL,
    permiso_id integer NOT NULL
);


ALTER TABLE usuario_permiso OWNER TO postgres;

--
-- Name: usuario_rol; Type: TABLE; Schema: seguridad; Owner: postgres
--

CREATE TABLE usuario_rol (
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL
);


ALTER TABLE usuario_rol OWNER TO postgres;

SET search_path = oauth, pg_catalog;

--
-- Data for Name: oauth2_access_tokens; Type: TABLE DATA; Schema: oauth; Owner: postgres
--

COPY oauth2_access_tokens (id, client_id, user_id, token, expires_at, scope) FROM stdin;
1	1	1	MGRjMmIyZDE4OGY4M2E2YTEzYmQ3YWI1ZTNjYmYxN2FmYTQ1YjQzMzQxMzg5YzRlY2Q0OGMzYWU5NTljOTJjMQ	1536855335	\N
2	1	1	YzI5MGI5NDdmMWMzZDA1MWM2NDA5YjRhODc3NDIyMWJmZjVjOGZhYmRmOTQxOTlhYWI5ZTJjYzA2MDBlNThmZQ	1536855550	\N
3	1	1	NDVlNGYxZDM2OTE5N2FmMmQ1NTJiODY2MGNiMDY4YTI4N2M1Y2MwMjJmYmI5YTc1ZWZhMTA1MzdjZTJjYWMyNA	1536856019	\N
4	1	1	NzdjOGIzOGQ1YzViMDZlNzUxNDkzOGExMDAwNzI1NzQyMGIwMmJlYmIzNWQ3MWMzMGJjY2ZkZmU2MjQ0ZDdhMg	1536856054	\N
5	1	1	YjkyMzBjMDcyOWEyMDQwNWNiNDAxMmIzYzM1MzVhMmViYmJlMzBlMmNlNTc3NmY1MTJlZjBiNTRlNjgxZmNmZg	1536856059	\N
6	1	1	YjdiNDI4YTNlYTUxNmNkODY3ZTA5YmJlZTAwYjBjYmFlYTFlNWVjYzRhYzJlMmI5OGJkZmU4ZWM0Y2YxYTQ1Ng	1536856083	\N
7	1	1	MWFlNDJmZDc4ZDBmNmNmZmQ2MGYyZTY4NDM0MWQwODYzZjQ0ZjdlNjVmMWVkOWZkOTVmNjcxODRhZjE5ZTc1Zg	1536856133	\N
8	1	1	OGNjYTFhNWMyMjVhMWI4ODc1YzE0OTUwODg0MzZhNzRkODVmYzNiODVlYTBlY2U5YzBjYWE0OGYyYjU5Y2E0Mw	1536856172	\N
9	1	1	ZjJjMmExNjQ0N2RkYzczODFjM2RmMzhiMjg1YzIxYjllMzE2M2M5YjFhMmRhYzAzNzhjOTUzYzUxNzU5NDZjNw	1536857129	\N
10	1	1	MjFlNWUyYTdlMDFjYzUwZDZkZTJlYmFjMTAyNGU4N2QzMmM2ZTMxYzg2OTE2NWQ3YWVkOTQyNTg4ODM3ZjIyMw	1536857162	\N
11	1	1	ZmIyMmI1OTBkNmFiN2NmOWQ5MTY2M2UwNDZkM2IzZmRjZDcwZDJjZjE5ZDMyNWQ4NTBmYzc0ZGRhOTJlYzE0Zg	1536935945	\N
12	1	1	OGRjNTBlMDQ2NDRjYmNkMTZmNTQ5ZWQyM2M0YWQ2M2QxOTk0YjkwN2Q0NDI2YTg5ODVhNWU3Nzg2ZTExNDg2Ng	1536936549	\N
13	1	1	M2U3ZTA4YmZiMDc1ODljNDI1MjE0NjVmZWVmZjY0MDE2NzI5Njg4NjhlMzNjOGQ3NTFhNWY5NmVjZTdjOTRmZA	1536937796	\N
14	1	1	MzMyNzYyOTlkODY1NzNjNWRkMTRjODU0N2Q5YTM5OTM3OGNmMTI5OWZmMzBjYmM5ZjkzYjQ0ZmMwMWI1MWFkOQ	1536942476	\N
15	1	1	YTE0Y2NlOTI0MjA1M2VhNmRjZGJmNGZjOGVkOWU1YjM0N2VmY2VkZDAzMjlmMTE1NWM5N2QzMzM5NmUzNGJiOQ	1536946503	\N
16	1	1	YzMyYmY1MTA5NmE1OGZkMmMxYzIwMmY3NGFkY2ZjMzNhYTViODc5ZWY4NTlmNzgzNDUxYmQyMDM5OTYwNTBmYg	1536952554	\N
17	1	1	MGRlYzBhMGQ2ZTYyYTdlNjMxMTMyMmNiYjIyODc2NGMxNTgxNTdkYzQ5M2NhN2FjYWNiOWVmYjI1YmU5YmRjYQ	1536957077	\N
18	1	1	ZTU4MjdiNmQ2YjliZDU0NjQzNmJmYzc0ZTRmYWQ0ZDg1ZmQwMzZiY2Q2N2JhODE5YmZiMGY4N2E4MWU4MjgxYg	1536963265	\N
19	1	1	Njg2MGE4YzUyZjMwMjhkMzgxM2QzYzEzYjBiMmNjOWExNThjMzU2MGNlOTE0MTZjMTFjMDI2M2UwOWIyNzRhMw	1536967940	\N
20	1	1	MWY4ZDlhMDBjZTY2NWZhZTk1ZWMwNjY4YTA1YTg4NjY2MzA5NWNkZWFlNTUyYTkxNmNjYzZkMGVlYzQ5ZDVlYw	1536967972	\N
21	1	1	ZWZlZDU1NjJhOTdkYjM5MmU1ZDgzNTRjMGE4ZGQ4ZDBlZDdhY2MyNjI3ODk3MWZkOWU0NWIxNjc1Y2FiODRlNw	1537192754	\N
22	1	1	ZjQ3YTQ3ODAwMDk1NjY5ZDU3YTM4NGJjMTZhYzdlYjVkNjA4ZjhlYjQ4ZjU3MTU2NmViZTgxZmU0Y2RhOGU5Ng	1537206743	\N
23	1	1	MTM1MjNhMzBmYzhjOGUxNDU0YTMzZDUyYzYwMjRkMmRkMjA5MGUyODkwZmExZmFlMWY1OWY5MmFkZTkxNmYxMg	1537212156	\N
24	1	1	N2MxZjBjMTYzODBhNzg1ZDg2Nzg4ZDdjNTQyNjc0YjVjZGM3ZjE3NzljYjczMThmZGQ4YTA2ZTFkZTY0ZGRmYw	1537213896	\N
25	1	1	MDMzNDEyMDJkZTczYjdlYTJlOWJhZDIzYmU3ZTgyMzAwYTk0NzRiMDVkZjk0ZjE4MDE1N2QyOTk0NWExYzhkOA	1537214057	\N
26	1	1	OGY4YTBjMzBkNzg5YmRjYzRiMWZhYzc2MjI5YjJhNGJhZWYwNzdmNjNmM2YwNzU3YzI1YjJhOTY4ZTEwNDkzOQ	1537214094	\N
27	1	1	ZThmYWRlNmFjMjMyODczM2JiMmU3ODdiNzgzNWVlNDdkNTYyMzA4MDUwYTM1ZmMwYjMyODEwNWEyZWIwZGExYQ	1537214127	\N
28	1	1	MzRmYjI5ZWQ5NmQ5NjI4M2E5NjhkNzMzNjkzMDkwYmE5MzkxYWViMTk4Njk2MzliYWY5M2I0NWMwYzZmNjM2MA	1537214356	\N
29	1	1	MzJhNmM2NjBiYjRhMzI5MTFlYThiODI2MmNmYzBlOTc1YzY1NzllOGMyNjJhZDZiODg5NjY4Mjk0MWJlNTI3YQ	1537218041	\N
30	1	1	MGNkNzMyMTM5YWY5M2M1MzFkOTM2MWYzOTRmMjY1OWU2NmY4NWNhMzdhNzc5NDhmZTNjNDJhZjgwZTJlNmJiYw	1537225046	\N
31	1	1	MmJjZDJkZDIyMmI4ODRiYjE3YTBjZjNlMTIyNzgzMDE1OWYyYzRjOWE2MWJlYmU3ZTgyNTBjNjhjYzRiMTI3NA	1537277874	\N
32	1	1	YjNjYmEyN2IzNGM3NjExOTI3MjMyOTI0NDA2NThjZmVhNjBiMjgzZWM1MmU3MzJiMWQ5NDQ3MGE4MTAxNzc1Nw	1537277899	\N
33	1	1	NDVkMjQxMzUzMTJkYTNhYjM4OTYzMzBlMTQ5ZWZkNDgzNzQzMjA3YjU0YjYxZjU4Zjg3NGU3ZDliNzQ2NWM5Nw	1537277980	\N
34	1	1	MzRkNzUwODY5ZjIyYTNhYjFjY2NjZmYwMzY0MDEzNWE4M2Q0ZmQxOWE2MTVmZWYwODFlNGM3MDQzYzBmOTUyMw	1537278050	\N
35	1	1	NzA3ZTI3OGVlZGFiZTVmMjY0YzU4MTY0MDkxNWQ2MWViMDQyZjYxMjk2MTAxNDJlMjlhZDEwZjU4YTk1OThjZA	1537278094	\N
36	1	1	ZjJiOTU0ZDZiMzI0MGU2ZmZiY2NiNDMyNDMzOTE0YmUwNzYwZjYxMDI5NTM2YTU0MmEyMWMzZTU5YWQ2MWFjNg	1537278145	\N
37	1	1	YTkzY2Y0M2ZkNzRhODBhZDU5NGY1ODViOGQ1NmU0MDI1ODhkNGU2NGI3MjI1ZmM4ZmFjM2JkMTY5Y2UxNmYyNw	1537278222	\N
38	1	1	YTA0YWZmZDg5MTQ5ZDhiNTg2MDEyZTc3ZGNhNTVmZjA2NTE5NTFmYTNlZjJiYTYzOWU4ZWNjNGZjYTVkYjJhNg	1537285930	\N
39	1	1	YmFjZjBmYzAyYjAxYjBiMGUxNjFkMDZkNmZhZGQ0NzA5MzczZWRhODM4ZTAyZTg0NjZlMTI5MGM3NWQzZjdlOQ	1537285979	\N
40	1	1	NzQ5ZDNiODE2ZWJjOGRjOTA4NDI2MDFiMjI5NjA0ZWE4MjAxM2EyY2U3Y2VhNWU3MzQ0YTNhMDdmZTExNWYwOQ	1537286014	\N
41	1	1	NmIwOTE0ZTU4YzhjMzMxZDY2OTQ0M2ZiYTA1MGJmNTA1NGZmY2E0YTliNGE2Mjk0YTVkY2EzYWM2YWY2NjBlYw	1537291788	\N
42	1	1	ZTJhYjJlM2RhOGNlM2QwN2U2MGQwMzYxMWIxNjZmNjUzZmZiZjVhZTI5OWQ5NjdhMjZkMjRiNWNlZGUxNGU3Ng	1537297897	\N
43	1	1	N2Y0MzNiMTNkNmVlOTU1YmYxYTg1ZWY3NWY0NzkzMjE1MWMxZmNmZTJhMmI2NTk1N2E1MjhiODU1MzE2MjgyZg	1537301847	\N
44	1	1	OGVhZjRiMzEyNDhhNzcyMDU4YTIyYmIxYWI3ZjhlZTQwMTgxMDE1Mzc0YjI3NTA5ZGYzZTQ2YTdkMGJmYzEzZA	1537305108	\N
45	1	1	Y2JjMDU1MjFhNjNmNzUwZWUzNmVhNGQ1MGYyNDY4ZjNhM2NlYzkzNWQxZDdlYTVjODNkMzIzODA1Y2I2NjY0Mg	1537305176	\N
46	1	1	MTM0YTU2OWFlZWFhZGNjNDAzNmE3NDE0YmQ3MjA1Yzk4MDk4OTg3NzEzZDY1ZDJhZTY1ODA1YWVmYjdiMTM2Yg	1537308051	\N
47	1	1	YTE1MGEzMGFlMDI1YTdkOTYxZGM0Mjc0OWY3NGVjMTI3YWNmMzdmYTYyOTVjMDlkM2JlOGJhYWNmZDBjN2VhMw	1537309588	\N
48	1	1	M2EyODFkN2I1ZDIxZDg4NWU5Mzg0MTc0MjMyY2M4ODA5MmNmMzVmMTRlNzEzZWI5YzFlYTFmZjA2NzcxYzljYQ	1537310321	\N
49	1	1	OGI2YjM5NjE3MDM0MWFiMGZiMjdkMWFkNDdjODM4YWVmZWFmMzA3ZDdiMWE0YjA4MTA2N2FiNjA0NTQ4MTFkYg	1537310422	\N
50	1	1	MmUzNTEzZmM5NWIyYWUwNGFlMmQxMGJiMjEyZmE0NGJkNTlkMjRlNWUwNDhkZWUwMDk4ODg0YzZmNDNiMjRiNg	1537319827	\N
51	1	1	MDdiNDZjYWNkMDE5MGJiYWI5ZGNkNWEzZWY0NmVmZjQ5ZDViMTViZmNiNjE1YjAyYTc4NmMzZmUyMDQ4MGNjYw	1537320268	\N
52	1	1	MGMxNWIxMGVmNWJmY2U3Y2YxZGM4ODExMzQ4Nzk4OWI1NGVlMmEyM2IzMWQ1NWFjNzJkMWQyNGI1MzEyNjc4OA	1537320631	\N
53	1	1	MGE1NTE5MTNmYzEyNzJhYmVlNjQzODRmMDY3OTYyYmE2ODNhODVhZGFhOTBlYzE5ZGY0ODhkNDc3ZWRhMmI1OA	1537321182	\N
54	1	1	OWU0ZmE0NzhiYzBhZGY2NDc5YjhjOGQyYTFiYzA0ODMwYWEwYmEwY2VjMzRiYjI4NzdjNmQ5NGZlNzNkODY0YQ	1537321272	\N
55	1	1	YWZkZGM0MDdlODNmYWU3YTY0YTVmODM0ODk1MTkxNzZhNzM2MjQyNzI0YzRiZGYwOGFkNjkxZjY4ODgzODQyMA	1537321551	\N
56	1	1	NmE4NTg3YmNhMmY4YzdlNTcwNWY2OTg0YjEzMTJkZWJhNjI0NGM0NmVjYzU5MThlZjdmOTQ0ZmUzMGE3ZDZkYw	1537321746	\N
57	1	1	OWRkOWE1MGJhNDM5OWJlNmU1ZGU5MTM4OTY1ZWM0NDJmMjI5ZjA2ZDRlNjk1MjNkNmYwNGJjN2Q1ZWYxYWQwNQ	1537321992	\N
58	1	1	MTc1NzVmZmY1ODgzZTQzYzFhOTNhNDhjNmEzMmIxMTAwNjVhYzY5YjI4YjA4MWExMzkzMmEwYjYwMmRhYmY3Nw	1537322286	\N
59	1	1	NjdkODc5ZmM5NTI3NDY0NWRmY2Q4NGUzY2QzY2M3NzkwMzVkYzJhMmE4OTFhNDA0ZGE5MjU2OGQwYjZmYzk0Yw	1537322526	\N
60	1	1	NDhjNTE2YWQwODgxMGQ5NGM2YWRhZjIzZTZhZTgyNjNhNjFkNDE2MDA3MDljM2EzZWRmMjZhOTNhNWFmOGExYg	1537322949	\N
61	1	1	ZDExMzEyM2I3YzQwMjMxYWFjNjQ2NjU2YmVlYjc0MzAwM2RkOTE1ZTQ4ODMxYzNhM2QyYTQxZDdhNjJiODk2OA	1537323973	\N
62	1	1	NTIyZDY1NmQwN2MxOWFmN2ZkNmY1MGNhYzQyYWIzOGJlZmJlNjkzMzUwZDRiNzJmMjY5NzNkOTAwNzYwNGYxNA	1537324285	\N
63	1	1	ZTI5OWYwNzc5NzE4M2NiNDYzNjI1ZGMwM2E3MDBhZjJjZDFiYjUwZWEwZGIyOWY2NDY0MjIwODI1YmUxZmI1Mg	1537325056	\N
64	1	1	NjNiMTY0ODg1ZjU2ZDlhODg1MDE5MzM2MzRmYjg1NGJkNzUwOTY4MWM0NzA5OTI0NTQyNzJhMmFlOGIwNGEwYQ	1537325157	\N
65	1	1	NzYxOGJiNzEyMGVkOGY2Y2MyN2JkMzUxNTRiNjE1NWM2NzliN2ZmN2EwOWE1YjU0ZDViNDZhZjljZDlhYTBiOA	1538319222	\N
66	1	1	OTBiZWY1Y2VmYzNiM2M4YjY3ZjIzMTQwNGQ5MmI5MDBiNmExZDI1YmRjOWExOGEzOGQwY2EwYWFlNzRkOWJiNA	1538321448	\N
67	1	1	YTZjMjMzMjA3ZTM4NGViMTRkNzMzNTkxM2E5NjkxYmMyOTNhMjI4NDVjYWFkMmZhNGUxNjRiMmFiM2I3NmY4Mg	1538321478	\N
68	1	1	OTk0OTkyZWQwN2RhZDI1NDdhMjcyNzhmY2MxMzE3MDdiYjlhOWUwOWYwMWJhMTNkNWYxNmE2MzZiZDU5YTU5ZQ	1538334015	\N
69	1	1	Y2Y0MDYzYzI0MDg5ODM2YzQ4NWIzZTcyODBiZTVlYzVkZDgwMTQ4MmMxNWRlYzcyZWQ3NGU0NDE2ZTk1YzA2OA	1538345369	\N
70	1	1	NDkzNTA3MDBmY2FkMzdjYWJmYjQ3ODAyOTY3NGFhMmYzZThiZjlhMzVjNDUxMWU0MTE5OTc3MjMxNmM5MmVjNg	1538361138	\N
71	1	1	OGUxOTdiNDFiNzk5YTNmYzVkYTAxYTljOWViNTlmOWM0ZjU1NTE2MDBkMGZlMGZkMTc5ODczYzFmMTRlMWU1Yg	1538361611	\N
72	1	1	OGYxMGJmMWI0YzFlY2NmYmI4NzNlZDE4ZWU3ZjljMjg0ZGMyMjMxNjg5ZTZlNmY1ZTZkYjk0MGMyNmRlYmNmMg	1538361889	\N
73	1	1	MjY5YmExNGE3ZDllYzEyNWE0NThjMDdlZTRiZGM3NGMwNmJhMjc1YmRiMTNmZTA5MTJlYmIzYjJiN2EzNjJjNw	1538363525	\N
74	1	1	NWU3ZDkzMTE2ZGJiMjhlYTE4OTBkM2Q1Y2QyYWI5Yjg5MTQ0ZjQzMzU4ZDM1Yjc3MDk1MDhiZjM1MzQzYTk1Yg	1539223152	\N
75	1	1	YTU0NDg2YTgyNmJhZGE2Njk3YzBiN2RhZTY4MzYyOWFiOGI3NmQwNDA2ODE5NjNiOTA3MGZmMDM5YWIzNDE3Yw	1539457172	\N
76	1	1	ODMwNDc5OTYxYjcwYzc0MjEzNDExMDkyY2Y5NWU4NWY2OTRhNjI0ODI2ZjE5NGVkMmZkZGMzMDc4MmM3MmM3ZA	1539457371	\N
77	1	1	ZjE1YWU1OWUxZGM1NTU5OTNmYWY5MmY3NmJmMDI1NjAxZmU2OTYzN2YwNzA4OTJiOWVkODRmZTcxMmMzODE5YQ	1539459381	\N
78	1	1	ZDJhYWJmM2QxNGU1ZmZlNGRjY2ZlOWFmMGUzNDQ5MTAwZTgyMzExZWY1YWJjZTE2MjgwNDY2MmI4YjQyZDdhYQ	1539460186	\N
79	1	1	NTVjOWQxMjZmMWE4ODc1MTQxMjc2MzNhZTg2ODJkMjBkNTkxZjYyMzYxYTdlZDhiMjNhYzQ1MjFhYTAzZTFlMQ	1539467037	\N
80	1	1	YmJiOWEzYmMxNzg4YWRhNzRjMjRlMjljYzk4MGI1NWZlYzNlMDllNTUxZTg5ZTVlYjc0MTVhZjgyYTRjYWJhOQ	1539472531	\N
81	1	1	MjA0OGY3OGM2ODI0NjJlMzg3YmM5ZjAxZDQwNWIzYjJjNzY3ZjAzNWU5ZDQzZmYwZmQxZjYzMzc5NGZjNWNmZg	1539474339	\N
82	1	1	YjA5MzliYzhiYWIwOTZkNDdjN2U3MjI2MWM2MmQ0ZmM2MWNkODc0MTZiNjcxMWI4MWRmZTM0OTUwMzY1YzA2MQ	1539475753	\N
83	1	1	Y2RiNjg1Y2NlY2U2MGM3ZTVlYWY3NDk0Mzk1N2RjOTQxNzk1YzUzYWVmYzNhNmEzNzQzNGUxOGJjYTdmOGY5NA	1539475781	\N
84	1	1	YmVhMGJhMTc3NjVkMGNlZmM5ZjJhN2IyMjgwYTg1MThhNjljYjI4OTM3ZmVlZDhmYmVkOTdhYTZmNDM3NDRkNQ	1539475800	\N
85	1	1	MjhkZTEwNGRjN2Q5OTI4YzM0ODRmMzVhNjBmMGIzZWE5YjhlNTY1MTI2MWMyNTkwZjVkNzQzMWVkNDk5ZDQ4NQ	1539475879	\N
86	1	1	MjFlN2IxZjlmZGMwMTA1OWVjNWZiNTVhZTIxYmFlMDVhNWVkY2ZjNzk2NGNiYzAxNDFiMWIwNDhiN2ZiNTY0MA	1539476069	\N
87	1	1	NDQ1MGE1MDNmYjUzZTdkMmJhMjRhNDA3MDE5NjFjMGUzMmRkMDkyODJkODY2NTEwNmM5YmM3YjQ2YThmN2IwMg	1539476076	\N
88	1	1	NDVkYmZhNGVmNjA5MmIzMmJhMmEwY2IzZDY0MTZiN2Y1YTMyNzc0YTBiY2Y2NGZmNWE4NDkwZjE0ZDEwNDMwNg	1539479455	\N
89	1	1	NzVjNjIyMjU1Y2Q3MWMyYmNmZWJiODE1MTUxZGVkNTY1ZGVjYmRjNzFkMTIxOTI1MmE2OWU1MjUxMjRhNDM3Yw	1539479480	\N
90	1	1	OTkzNjEwZWZkNjhlMGU4OWY0MzM4NGVjNTQ2YmQ4MGI2ZDRiMDhjNjk2Yzc4MTRkN2EzNTBhMWQ5NDMwY2U1Mg	1539479720	\N
91	1	1	ZjhmNjZhMGEyMjE5MTNhOGMxYzFhMTUwNzNjMmM5NDg0NWI5N2JmM2I5ODI4MjBmMWY1ZGRjYzZlMGYyMjIzYQ	1539479847	\N
92	1	1	ODIwNTgyMjRmYTM2ODBkNzRiMGM3NjNkZWM1N2I1YTg4NmRiYTkyZjcyNzBiMTUwOTAxNmRiNDczMmZjZDkyZQ	1539479868	\N
93	1	1	ZDliZjdlZDRhMmIzYjIxZjEwOTg5ODcyOTRiODk1NDliMGQ5YzdjNjEzZGE4Y2UzNDU1ZTdlOTExZmQxODE3Yg	1539480057	\N
94	1	1	ZDcyMGIwNTE4ZDg3YTNkZjBmYTkxOTUyOTQ0MTYzYzY2OWJkZWRlYjY3NDZkNDc0NzU3NzJhNWNkN2U0MmUwMQ	1539480121	\N
95	1	1	NWQ0M2RlZjEwMGFjZjlmYzYzODEyMmI2ODM0NWZiY2I2NDdhMjVhNWM3OGEwM2ViNjk2NjA1OWM2NGRjMDRlMQ	1539480192	\N
96	1	1	NjM0YmMxYzZiNmVhMzBkYWU4MWE3MDM5OTUyM2EzNjg3NmRlZmIyZWEyYjZkMDVhMmQ5MDI1OGY1MTcyOTIyOQ	1539480241	\N
97	1	1	MWEyZjRkMGMyYzhhZGVjYzk1ODc1OTQ3OWRmMWI1MDI3Y2M4ZDFjNzY3NWI5ZDgxYmUyOTI5ODZiZjUxY2E4Mg	1539480421	\N
98	1	1	M2QxNTIwMGJmNzViYWM1NGEyOTFiNDBiODdhYWE1NDFlMGRmODNiMjZkZjczOGQ1NGM5NmFkZjM1NjRhNmU0YQ	1539480922	\N
99	1	1	YjFmNmM4MmQwNjFhNjFhYzRjOWFiZjViODBlNjAyMDE2ZTgwYmRiMGU3ODYxMzc4YjAxZDljZTZiM2RhZWQ2NA	1539480981	\N
100	1	1	NTBlNGI4YmZlYzU1MDZiZjgyZjJiNTcwMWExYTdkMjNkYTc4MTNiNTVjNDVmZjE2MmRlMTBkZDdlMzM3ZGQxNQ	1539482369	\N
101	1	1	ZTU5MWJlYzgyMmMxMDUwNjg3ZTA2OThlMjI5MDQ3N2MyOWRiNDkwNGNiMGU1NWEyYWRiY2QzNTU1MDk2MjRhZg	1539482376	\N
102	1	1	ZGRhMmVjODYxYWNlMzEzNzg0MjhmNmU3ZjMyMjk2Nzg2MDE0M2ZkMzVkY2U3ZWM3ZDQwNzViNjM0NGQ2MWYzNw	1539482553	\N
103	1	1	MzNhMmMyZWYyNGUxOWExYWQwOTBmOTM5YzNmYjE3NjFlZDViZTc4ZmUxYzE0Y2MzNDA4ZmRjMDAxZDg4NTFhMg	1539482786	\N
104	1	1	MWFlY2Q2MGMxNDBlYzlmMWJkMTIxNmVlOTUwYzM0YmQ2ODQzZTdiYTQ4YWJlNTA2YzJiY2I3N2YwNmY1YmVhNg	1539482797	\N
105	1	1	MzlkNWI2YTgzM2I1NDIxODZmYWMzYTZmNzkzNjVjNmFkMjhjMmQxNzA1Y2NhNmRlYWFkOTVkZGEzZTU0YjBhMw	1539483035	\N
106	1	1	YjJjY2U2YzEyNjgzNjg4NmUzYTBhMzYxYzUyODBiNDhhYTNjMmQyMDBkMGJkYTczOWVkMjA2Y2JlZWYyNDc2OA	1539483172	\N
107	1	1	NTZlMWQzMzc0ZmZjODRkZDgxMTQ3YTlhODBkMGQ2OWVjZGFlN2NhZjIzMzFhMmMzMGVkZDU3OGYzOGUyYmUxNQ	1539483186	\N
108	1	1	NDE4MThhNGY2N2E0MGFjZWI0ODFmNGJmNjVmNGM1YTI2NjFkM2RiZGVhMDQ0NDMxMTE4NmQ3YzkwMzc4YmU4Yw	1539483232	\N
109	1	1	ZGEzMmQ3ZDk4ZWI4NTYzYTg0MmE0YmEwYjQwZDA1MWY4NmM1NTIyOWU3NWUyZTUzOWQ4NGU3ZGU1NjRjMzVkOA	1539483540	\N
110	1	1	YzAzZjE0MDhiYmNkMjM5MjQyZjg1NTA0MDhkZjc0YTA0OTBkOTMyMmJhYmE3NzY2NjgyODg4NmJjOThjMDYzMA	1539487479	\N
111	1	1	ZDJjNjY2NzFhMzdmNzU1ZWI4YmQyMDk4NmY4NDZkMmQ2ZmFkZmQ0MzllOGI5MTU2OGE4ZDA5MTk1M2EwMGNjNg	1539487531	\N
112	1	1	YmZjNjhjMzRjZmQyMmNmY2RjNDQzYjljM2U5YmRkMDdhZmQxNzNkYmYzZDY3NGRmZTkwMjM2MzI4YzkwMTA0YQ	1539487703	\N
113	1	1	MzQxNTIzMDRhNjk4NmE1M2JlODBhNTk1OWVmNzhjZDljNGI3MmI3ZTA4NzczNmIzZDNlNzUwY2VjNTY5OWU1ZQ	1539488192	\N
114	1	1	MWE2YjE0NWRkZTYxNmY2ZjU2NWZiN2VhM2Y0ODNhYmJmNGVkNjNlNTlmYTUzMjI3NDI0N2M2ZmExOTliNTI4MA	1539488244	\N
115	1	1	NTRkMjFlNmFmYzg5ZmZlNjQ3YWEzOTk5OTVjZmUwYzdiNDE3NmQ4YjVhMmQ0ZGQ1MWQzMjA1OGI4NmQ4OWYwOA	1539527155	\N
116	1	1	YWRhM2E0MGFlOWU2MjlhZDM3ZGZhMWZiNGZlZjgwYzdjMzZiZjYyNDY4ZjU5NjQxMTQzZWEzOWZmYmQ2ODcxZQ	1539527814	\N
117	1	1	ZWFkY2MzNjhlNTQ3MzZkMjE5ZjY0MzYwZWU0NDdlOGM4MmU3ZGIyMzU2NzgxN2RmOWVhNzU4MTQ5YmIzOTAyNA	1539527852	\N
118	1	1	MWE1YTVhNGIzNTZmNThmM2JiM2Y0MTIwOTVkZjRiNmU0MGI2Njc5MWRjYWE4ZGQzNTliYTY4NzA5Nzg1ODZmNQ	1539527860	\N
119	1	1	Nzg3ODhkMDE0YzU1YzU3YzFkMWIxOGY0MDE1ZWQyY2UxMTllZDhjZWM1ZjMzYjIwMTAyMDNkODAyYmY0NDY3NQ	1539527866	\N
120	1	1	MzgwNjIwOTU5YmFiM2I2YmIwZTk1MzRkNGQ4NTE5OTUyYjEwYzFjZWMyYTY4ZjM5OTkxM2Q4ODg4Njk2NWRlYQ	1539528153	\N
121	1	1	YjEyMzU0MzQyZGZjYmRjYmE4OTYxNzY5MDQxNGZhNjk5ZTcwZjFjMDYwNDk4OTFmZTAwNjEzNWVkYmQwYTZkYg	1539528347	\N
122	1	1	NjM1ZDEyYWNkNmRkZDNkMWNkNmZjZThiMDliNjJjY2U5YjgyMjkzMTU4Yzk5ZWUyMDY3MzJhZTQxMTMwNjkxMw	1539528469	\N
123	1	1	NmIxY2YyZDc4ZTQ1MGFkYTFjZWQ5MWMzMDAxODRiNDhhNDJlZmIzZGUzOWQwNWQ1YTVjNTQ5NWI2MjQwNTM4Nw	1539528636	\N
124	1	1	ZThhYjMyYmEyZTk2YWNkMGIwYzIxNjJmN2RlZTI2MmM1MGM1YWQ4NDI1MTZkMjE5OWI4NTljM2YxOTNiYTUyOQ	1539528716	\N
125	1	1	YTcyYjFmMjgxMTI0Mjg3N2FlMjIwMzEzNGYxYjM1YWY3NTljN2Y4NDZlMmRhMDYyYTVmYzQzNzY4ZWEyZDEwMA	1539528770	\N
126	1	1	NWJmNDRmMTg3ZTcxYzVkMTQ4ZGYxMTRkZTU4YjJjNzcxM2IxZTBjZDY2NmRhNTc3Y2I4OTE3ODIxMTJjYzM5YQ	1539528781	\N
127	1	1	MTM1MTE5NWFjOGVlMmVjYmE5NzFiMzMxMzRhZWYzZGMyMDVkOGZlY2QyZjY5MmEyNjBkODNmMmYwNTcxMzIzOA	1539528810	\N
128	1	1	ZDliMmNkMzMxMDRlZjQ5ZjA1YzNlZGZhMGEyODI4ZmUyZWRkNmNlMmQ2NjUyNTg3ZmFlNmZlMWQ4YTJjMDg2Nw	1539528815	\N
129	1	1	ZjhjYzRlMTE3NGJiN2JjN2M5ZDA4YWExZGEwYmM0Yjg0MjhiNTM4OWQxYzUzMzU3MGIxZmFjMzAxZWUwZmVlOQ	1539528955	\N
130	1	1	MTVmNzQyZDZiNjcwOWI5OTNlM2ZlNDMxNDI4MDU3MjZhOTdlNTRhNmUyYmMyMGNkNGRkM2EyODJlNjA5NmFmNg	1539528976	\N
131	1	1	ZjU3ODZiZTcxN2I0YWI0NzlhOGFkYmZkODYxYmY5MGZiZjlhZGMxNDNlNmE4ZjIzZTRkMGJjYzhiYzhlZDQ2Nw	1539529089	\N
132	1	1	MzFjZDdiYTZmMDhhY2UzOWYyOTExMjJjYjE2N2Y0M2UxNWNmMzI3NGQwNTM3MmNiY2U4YTFkZDg0ZGZhYjVhYQ	1539529282	\N
133	1	1	YzJmYTFmOWNlYmNlZjhmMjIzOTg3MDBiMjBiMDg1MzQxZjhlMWIzZmM4YzY3ZWMzMmNkOTg1OWYxNjk4NWY1YQ	1539529344	\N
134	1	1	NDY4M2JlMDUyZmM0ODczY2VlZmIzNTdmNTA0MjZhMDI0OTA3MDljZTcyNGUwZmM0NjdiMjU4ZTc2M2I2NGRiNw	1539529430	\N
135	1	1	NTg5ODJlZDEzODUyMGYxOWE2OThhY2Y3MWRhN2Q0NGUzNTI5OTQ3MmMxZjQyMjg0NWZiMDBhM2E0OThkYWRhYQ	1539529527	\N
136	1	1	YzJkNWU5ODU1OGFmNDIyNjAwZWJiYjRiNDQ3YWU4ZTY3NDIwYjlmYzhlMGUzYjQ5NjdmM2RiNjMyMzFhZjFlOA	1539529534	\N
137	1	1	Zjk1MWRlMDAzNmI0Zjg1MTkyOTZlMWQzZDVmMmZmNzZlNGExYjk2YWZjMzczNzU0NmYzMmIwMTllMGZiMGNhMw	1539530806	\N
138	1	1	NDE4NmI1ODQ1M2FkNWM4NjA0ZTI1ZTVhOGQyYjE0NTUzZjZlZTRjNmQyZmE5MzlkNGUwNThhMGNhMjExZjhjMQ	1539530841	\N
139	1	1	YmE4Njg5NDg2ZGFiODRlYzgzZGUyNWMzYTA1OTE5ZmQzNjY0YTA3YTM2Njk5Njk3ZmJkYmNiNTg5NjlkNjlkOQ	1539530909	\N
140	1	1	ZjZkMmY1MzBjZWJkNjkyMzFlNTAyMGQyNmY3ODI4OWE5NDk5ZjYyMGQ3MmVmZDQyYWQxMTZhNGQ0MDliMGNlZA	1539531262	\N
141	1	1	NGFmMDkxNjUyNTliNjk5OGNhOGM2YWJlNTNlMjViZmU1NjFmNWZhMjgwMDA1N2VlNzQ4MTEzMDIwYzg1MmZmOQ	1539560846	\N
142	1	1	MjVjYWJlNGQzY2Q5NTcyNWJmYTg1MTU4NTBhNWY0YzhhOTEwZTdhOTE5M2EyOWRiY2MwOGI3N2M4NDVhZmQwZg	1539560987	\N
143	1	1	MTBkYTVjMDBjZTFmNjE1Njk0NGM3NzE0YmZhYjRmY2Q5NjliM2JkYWU0NTY1ZTljOGE5ZmQ5MDBhYjEzNDBhZg	1539561964	\N
144	1	1	MDZmMGQxNjcwZTUxNmNhOTdmZjRjOWY1MTJmNmY5NTVlZTY4MWM4NTk0ZDFlYTI0YzRlMzI2YTMwYjQ2ZTVhOA	1539563794	\N
145	1	1	ODdlNWQ3NjdkMzM1YTM2Yzk3ODNlZTZlMzQ4MjUwNjhkMTgxYzAwODUzZDZkMWE0M2E4MGY4NWIyODViZGZhZA	1539563843	\N
146	1	1	YjFmZDVjMzhjMjcyZWJkN2Q2ODg5ZDliZDhhMTZiZTBhYmNjZWE5Y2ZmNzQ5MjU5ZDYxNTFjZDQ1MTdmMmIzNw	1539565299	\N
147	1	1	NjEyMWFiY2IzYzQwZDNkYTkzYjhkZjI4ZGRjZWZlYTdiOGZhYzZmZDk0Y2UxMWE1NzAzNDM0NTY1ZjUxN2VhNg	1539567569	\N
148	1	1	Mjg2ZWRkYjVlNjAwOTNmNGVjOWU5MjQwMWRlOGJkOTJkNjc5ZjAwMzZiNWQ0YWEwNzJlMTJkZjE4NmE4MWVmOA	1539575705	\N
149	1	1	M2VhMWVjZGE4OWQ3NTg2NWJlNWJiMTIxNTIzNGMzZDkxMTMzNWRhMTlmNjAwYmM1OTk5ZjViNWFlM2I5OTIzMg	1539576040	\N
150	1	1	ODIyNzIwZWIwMTM3OTY4Zjc3MTgwZGMyZDllMWNjNDQzZDhhMzUxNDg0NmU2YjlkNmQyYzhlM2I1MWExYmE5NQ	1539576121	\N
151	1	1	Nzg5OTEwMDIzMjliYmE1YWJlY2YzOTA1OTNhMzQ1MzQ1OGE5NmU2N2Y1MWY3OTZhZTVjNTA3NzJmZDljMzcwNQ	1539576519	\N
152	1	1	MDZlZGNiZDZjNTU0MmE5MjEzOWJlNzk4YzhkNTY3OWY0NzgwNWZlYTEzMzgyNDcyOWQzZjRhYzlkNTIzZmM5NA	1539576600	\N
153	1	1	NzlkOTQyYWUyNzcxZTAxYTRlZmNkODA0M2YxMDhkOWY2OWNmMjk4OGY4M2YxOTU4OWJkMDU3ODBmM2IzZjBhZg	1539577113	\N
154	1	1	OTUwNGI5NmQ5ZmQyYjk0ODNjMGIxYjhjNGE2NDIxMDUyMTUzOTcwODM0MDQ0MTIzNzA5ZjdmMTc4Nzc4NmY1ZA	1539577390	\N
155	1	1	NjQ1MmYwYzRjOTdmZmYyNGM3OGJmODIyOGJjNWQ2OTIxM2Q5NDBiYmU0YThhNzY0YWJkOTdiMDkzNGM5YTJmYQ	1539577421	\N
156	1	1	ODEwZGU5NjMyMGIzYjdmNGRlNzIzODUwNDFiMTA5MTRiMGFkY2UwNmMyZDUyYjEwNWRhZDBjNGM4MmFhNDg4OA	1539577701	\N
157	1	1	NmJlMzVmODg1MjQxZjI2NjEyZDM2NzE3NTFiZWUwNDVjMjUwMzNlNDA3OTc5NDZhNzg4NTZkNzliYzIxOWQwZg	1539577925	\N
158	1	1	ZTc3MGE4YWU2MTA0ZGM2MmE5ZjAwMzViYjE0MzkwZTEwM2YyZWEyMGI2NDVhYmYwOWY0MjljZWYzYTg4YTc2Mg	1539578786	\N
159	1	1	ZTZlOTA2MTcxNjgwYmNmNjFiMzcwOGYxNjI1MGQ4OTA3YjNjYTNjYjBiMGFkYzI0OGJhODQyNjdhNzMxMmQ0Yg	1539580853	\N
160	1	1	MzM1YzNjZWE5NzY4OWRkODA3NDQzYWMyNjk4MzQyNTU5MGQzMWYzNmZhYzY0NGZiYTIwYzBhYzJkZTBkMmRkOA	1540069381	\N
161	1	1	ODQ2MGJmYmQ1ODk1ZTQxNTE3MWQ2YjQwYzA4YzgxYzljNDI4NzA2YTMyN2Y3MTZiN2VjNjk3MDI5MDYyOWQ3Ng	1540070714	\N
162	1	1	ZWQ2M2QwY2NjNTNlZWEzYjhlNGExZDBhMDkxNzY2ZWY0ZjkyZWNlN2MxOGZhZTkyYjQ2NWYxNzhhMWQ5Y2I2Ng	1540070806	\N
163	1	1	NDM0MjU4OTZmMTY0ZDU4ZmY2ZGZmOTU5MDEyMzMyMzljNzFkMDdhZDBkYzg1Y2I2MGI3ODlkYjgyODU1ODAxYQ	1540070815	\N
164	1	1	ODUyMTEwYTUyZWRhNTBiNzI2NGQ4MzRjYjg3OWM2MDYwNzc2NmQwMjM1NGY1ZGM3Njk0ZGI4MDE4NGE1NjI5YQ	1540070828	\N
165	1	1	ODAxMGEwOGViOWU5MjJjNTRiZWQyNDJjYWE0MjY2OTRhNjZhODZjNTgzYTBiMzE1OTBhMjg3NzZlYzNiNjhhMQ	1540071154	\N
166	1	1	MjQ2YTMwZmFiNTJhZTFiMjhkYzUyODM2ZTQ0NzU0ZGE5NTY4ZjBiNjJkZmMyMDkxOWM3ODRkYjE1ZWQ0NWQ1NQ	1540071222	\N
167	1	1	OGZhMzVmNzViN2M5ZDBhNGY1YmQ5ZmU3ZDI3MjhlMWNmNDI4ZTA1MmZlMWRiN2NjNGU0OTJmNmRmZjI1NTVjYQ	1540071506	\N
168	1	1	Y2Y1YjMzOTgzNGQzYjYyODY5ZDQ1NTVhYThjYjlmNmFkOTc4Y2IxODgzZDc1MThkMWMxYTczMGMyNDhlNDdkNQ	1540071572	\N
169	1	1	MTg3ZWI4MDhhZDBhZWVmNWQzYmU2MjIyZTVmZTBjYzI5Zjk3YzYzNzdjMWIzM2IzOGEyOTA3YjYyMGRkZWRiMw	1540071778	\N
170	1	1	YzljZTMxOWIxMzhiNjg0MWJjMDlhMWYzYmU3YWZhYmU5YThiMTRiOWI0MTk2MTBlZWQxMDNkMzFhYzUzODQwYg	1540072281	\N
171	1	1	NWQxMDdhMDg4YTQ3NTc0MWNmMDNiZGJjMmU0NzAzNzQ0YWY5OTk1YTFjMTAwNGU4MzBiMzgzZmMyZTRiOWFkNQ	1540072479	\N
172	1	1	YjFhMDA5NmUxNGU1MGVjMzFkZmU4NTg2MDk3ZTliNWI1Nzk2ZDkwNDg3ZTg3ODY1YTc1MmZhYjE5MjU5ZWFmZg	1540072492	\N
173	1	1	ZjE4MDVmODhhMjhkOTM2NjA1MmI0ODA1YzEwZGFkYzQzMTEzNjZiNmY4NDU2NTNlZjlhY2E0MmE1Y2ZhZjVkOA	1540072525	\N
174	1	1	YzM5MTk1NTQyY2JhYTkxYzg3ZmUwMTgxNThlNTM5MDkxNDQ2MTVjOTRjOTcwZTA5NDUxNjc0OWFhNzg1YWQzMw	1540074778	\N
175	1	1	NzZiNTlhY2EyYTcyMzRlZmQ5OWVhYTFmZDU0OTNjMDY1ZGZjMWMwZjQwNjk2OTk5OTAxMTNjOWY1OWQxMzdmMA	1540074814	\N
176	1	1	NWRjOTA5NThiMDBiMDJhYTc2ZWFhODQ4NWI4ZWQzY2ExMjc5YWIyYzZkYWQ5Zjk0ZDM5OTcxMjI3NmM1NWI5Yw	1540074844	\N
177	1	1	ZDhjMzJiNGYxYzE1ZThkMWUzNGNhZjNmMTkwM2EwM2U1OGUxNmZmNTc0NGY2YjRkOGI2NTlmYzY0MDJmMjcyYw	1540074859	\N
178	1	1	MjYzYTJhZDJhMDc0ZTM2YzFhMGQwNTM0NzNhMmVlMzM1ZDRmZGIzM2E1M2I0YjhlOTVlZGZlNjFhZGJiOTI3Yw	1540074884	\N
179	1	1	MmIwYjI1ZTNlMGI2MzdmZGMwN2EwNjJkYzA3MWJjYTU2OWE1ZDlkMTFlZmNiYmI4YTJjODVjMmEyNzNhMjA2NA	1540074948	\N
180	1	1	ZWNkNGEwNjRkMWYwNzhhNGNmZDQ0ZDliNmFiOTMxMzNhYzVlMDE0YTQ0OTg1ZDg5ZWM3YzY3MDEzZjA5Mjc5MA	1540074951	\N
181	1	1	ZTI1ODNhZDU5ZWFmNWQwOTgwZjg2NTdmYTQ2NDI2Nzg2N2MzOTdhZTMwNDMyNzk5ZDFlZDYwYTg5MmQxMmI2Yw	1540074961	\N
182	1	1	ZmQ4N2ZmY2U1NmJhYTdjN2VlNGNlZjUwYWIyYTU2NjFiOGM3YjlhMWI5MjQ5MzI3YzFiZTlkOGM3YzUwZTEwYQ	1540075008	\N
183	1	1	ZDgxMjY5YTRiOGE3OTA1MWI5NWM3ZTQwODU0NDE4MzhlNDJkMTRlNzMyM2I5NzkyNWM4ZWI1NjhjMjhlN2FiYQ	1540075027	\N
184	1	1	NTczNTY2NjUxOGJkMjE3MTNkYzFiMTBkZDY4ZTllNWZjYmNkMzUwNzIyMjgxZGQ5Zjg3NDZjODU2MTA0OGNhZA	1540075072	\N
185	1	1	NjBlNmRkY2E2OGNlNDliZjM2YzExYjNlMTkwMTAxZmJmOTBjNzcwODFjZGMwMTNmYzNhYjUwYTMzOTQxYWExZQ	1540075317	\N
186	1	1	YjJmYzdkMDM1MGQwZjQ5MTJhYjlmY2M1NDM5ZmQ3OGIxYmQyOGFiNDAzY2U4ZGQwZThiMzdiYTM5ZmJhYWJkYw	1540075393	\N
187	1	1	NGEwOWM4MjhlNTAwZGQ0YjBiYWFjMDU2YjBjODNkZGRkY2RmY2NmODdmZGEwNjdlMzE5ZWM3YWMyZGIxYzJjNg	1540075410	\N
188	1	1	NGU3MzlkMzBkMWE1YWMwNGI1NzgzYmZiMjhlYmVjMWNjMTAwNDE2ZGNkNzQzNmFmMjRhYjA3MDM0OWI1ZjQxYw	1540075517	\N
189	1	1	MGIxZGI3ODQ0YzZhZjNkMjNjMGZmMTFkNzNmODRlYjNkYTIzOTY0MjgwZDg0MjcwMTM0ZmE1YjIxZWU3OTNkMQ	1540075869	\N
190	1	1	ZGY3NGVjZDZmZTdlZGM0MjQ2MzczM2U2NWY1Y2JkYzcyMmUyZjFhOWJjMTQ1ZTQxYzUxMDYyMzU1MjYxZDQ4OA	1540084102	\N
191	1	1	NzA0MDA5NGFhOTBmMDc5ZjE4N2RmOTQ5ODVjYmUyNzAwYTYyMjU0YTExZjdkYzUzY2Y3N2YwMzE3NTRiM2U1MQ	1540084680	\N
192	1	1	OTliMGVkMjNhMTY0MDY0OWI2Nzc2MTZhOWEyMGJlMzc4ZmY3ZDlmOTI4Mjk5YjZkZDEwN2E2ZmM5MDFkODAxOQ	1540084719	\N
193	1	1	YzdkZmE5ZjFjZjViMzMyYTI3MzBhYWY5ZWFiNDIxODQ0OTc1YjU5ZWJlMGZkMDM1Nzc5NTJjZTBlNjFjNzhhZg	1540084800	\N
194	1	1	ZWEyMzAyMDVjMzgyZjI0YzMwMGMyMWI4NWI1NTI2NGVmNWM2ZGM0M2FmMTZiZGZhZWE3ZjBiYTdkYzYyY2Y0NA	1540084839	\N
195	1	1	ZWEwMDVhNDA1ZjIwNDY5M2RjNGRhODU3ZGUwY2EzMjcwZTc5ODIxZTEzZGZjZWQ1MzY4M2EwNzEzZGM0YzBjOA	1540084952	\N
196	1	1	YzliY2M5MTYyNmMyZTBjNzJlOGY3YmViYTU5ODM1MWFjYWY1NTZiZjQxNjAwMDg3ZjExYzI3OGE4ZDZhMzFhZA	1540084990	\N
197	1	1	ZWUzYzMyYjJhNjU2NWY1MDJiN2EyMjg1NzQ1OWI2ZmE5YTljMmE5OWQzMmNjYzBhNTE2ODBmZjVkYTVjZTVmNA	1540085352	\N
198	1	1	OTU3NDlkNjk3ZmExYTE1NWQ1MTI5NmE4ODE0Y2Q5ZTk4MDcxMzkxNTM3M2Y2MDdjN2UwNWNmYmNjZDM5MTg1Zg	1540085359	\N
199	1	1	YTY4YjdlYTA3Y2UyYjE3M2ExM2U2NTczYjQ4YzAzOGNhNDUyMzRkNGZhNGViZGI1Y2Y2NjYxMDkwYmZmMWRkMA	1540085378	\N
200	1	1	M2FmMzNkMmNjMDNkNTkyMGQ1MjFlODdjNzgxNDgzYWQwNmIwMGIwZDdmNjhmMDI2ZGU0MmFlZGM0ZTFhOWE3Zg	1540085384	\N
201	1	1	YzUxYTAwYWZhOGEyYTI0MTQ1OTU2MzBlNDQyOGI3YTNmMzAyYmJhNzE4YjM0OTgzM2Y4MTFhMTgzNjRhM2Q3YQ	1540085413	\N
202	1	1	YmM3NjVkZjkxYTAzMjQzYWUzZGJlZDRjZjdhNDkyYzM5ZWEwMmYwZTYwYjg2ZGNkMGNhYzBmNTUyYmU0Y2FmMA	1540087101	\N
203	1	1	YTRhNzBjZTNjOTllMzM4N2I0YjQ3ZjFhZDY2NThkNTU5OTI4NTg5OGQ4MGY2ODhiNmE1MGQyZjk2ODFhMmUxMw	1540087159	\N
204	1	1	ZDQ3MzdiOWFhOTYzMDc1YWJjZmM0OTYxNTM3ZjUxMmZhODcyZjc4YzIzZjk0NDFkMTJjOTA2ZGUwOGVhNTZhNA	1540087509	\N
205	1	1	MjQ5YmQxYzNkZTFkNDk4NWVlN2Y2Njk3YmMwNjU0NDNiMjAxMjEzNDM0MzY0MmZhYWRkNzc2MWVkNjNhM2YwZQ	1540087621	\N
206	1	1	ZjAyMGY0ZjMyN2I3MGMyZDczMDcyM2ZhNzExNTc3NWFmMGJlNDY1ZGE0ZWMwOGUxYzI5OWIzZDYzMWZmOWYyNw	1540087678	\N
207	1	1	OWI1ZmU4NjU5MmU4ZjExMjZjNDI3ODIxOWNiZmI5MzcyMzYyMzQwMmEwZmEzMzljYTU0ZDkzMDIzNzRkZjYzOQ	1540087697	\N
208	1	1	NmIyNWVjNmU3OGY3ODVlZTQ1NGMzNzliNTBlNjU2MTE1MzM4Mzc5ODA4YmNkMDZlM2ZjMzBjNjNjMWRlYTI2Ng	1540087716	\N
209	1	1	MWJlZmQyMWQwYTIzZDEzZjk0ZjBkMzVjYzhhNTIwZTc4NzgwZWM1MTQ3NTgwNjMzOTNjNjk0YWQ1YjVkZjI2NQ	1540087858	\N
210	1	1	NzczNTE3NjU4MGVkNTcxNjFmZmU0M2NmN2IzZTc1ZWExMzMzNmQ5ZTVmNTZiMTAzODYwNDQ0OWEwOGM3NmM5Yg	1540087867	\N
211	1	1	NTA5NjQ2NmQ3NzQzYTY0ZTIwMzQ1ZDkzMGJhZmQ2MDAyZTA4YzY3ZWIyN2I5ZWUxMDc4MTFjOTMxZjY4MDJiMQ	1540089064	\N
212	1	1	OTA3MDAwZmJjYzE1MDY0MzMwM2VmZDA3MWI1NTg5ZTE4ZjYzZDMwNjUwZmFhMDUxNWQzMGE1M2ZiOGM5YmZiNA	1540089134	\N
213	1	1	NjI4ZjAxNGMzZDhiZmYxYzMxOGI3MzljYzZjMDQxMTYxYzYxZjRhOGZlODA0NWE5YzZhMjFhNmNjOGZkOGVlMQ	1540089273	\N
214	1	1	YWY5YjJiMDZjMGExYTA1Yjg2NTkzNWUzMjA5ZmQ0OTcyNjE5NjkzYjE1NmRjMWY0YjQwMjgyNmRjNDUxN2NjMQ	1540089298	\N
215	1	1	YzRjZWEzMWE3N2FlOGU2MGIzZDAwMmFkYTU1NzI0NzYyMDMwNGQyMGU2MGE2Njg0ZTc3ZDQxMDNhYjVlNzBlYw	1540089427	\N
216	1	1	NjM2ZGMwY2IzZWQ0YWJiOTBhMzk5OGY0MGI0NjdmYmM5NjQwNTJjZTQ4ODgyMThjNmVlODlhZjJkMDVlNTcxNw	1540089436	\N
217	1	1	ZWYyYzg5NTNjZWU2NzY1OWIxMmYyZmZlMDVhMTdkZGEzN2RhMTE0ODM5NDJlZDFiM2M1YTUyMGMxMzJjMjFjYQ	1540089449	\N
218	1	1	YTdmZTVjYjFiYjI3ZTU4ZWM5MTNjNTdiZjZiMzE0Y2ZmMjJmYzVjMzI5MDAxODQyYzFhNTMxMjUwNWMzYWFjZQ	1540089478	\N
219	1	1	MWI2NDVlN2FlNGQ0ZjkwNTQyZWY1YjNjNmMxYzg3MDFlNTk3NGM3YTBhNWQwMDQ5MGI0MTIxYjk5ZDY4ZDdlZg	1540089650	\N
220	1	1	NDgyM2YyZTBkZjM2YzgxOTM2YjFiZTU2YWUzNjlhZmQ1YzBmYjVhOTExMzg0Y2I2ZGNjMmVhYTIzOWJkYjU3Yg	1540089680	\N
221	1	1	M2ZiMWQyODRiYzcwNzQ3YmQzNzc4NWQwNWM1MmUzN2E5N2QxZTliOTFmNTY1OTE0NGZmYWJkOWJmYzU2ZDc5Ng	1540089741	\N
222	1	1	NjAxMjBiZmRiY2FmNjIwMmY3NzdlN2IyMWQ5YjZiZTU1YjlhYjM5NDYxMmNmYWFmZjI5MGM4OTc4NGM3ZWY3YQ	1540089779	\N
223	1	1	ZTRmYzNiYWY3MTkwOWJmODBjNzc5OWRmOTc2YTNhNmEyYWYxZTIyMTQxOGViN2M1MmU1NWNkNWQzNTg3MzQzMQ	1540089931	\N
224	1	1	MmJlYzI1ZmJhNzM0NDkyY2ZhM2NiMmYzMjBkMTJiNjU3MWQ1MjgyMWQ3ODc3NDNiMzZiMjYxYjIxNDk4YmIyOQ	1540090138	\N
225	1	1	Y2EwY2JlOWVmZjgyZGRhNzMyZGYwZjVkNDAxYjhjMzkyYmU3ODI0Y2Y2NTRkZjY5MzhmNTAxNjBiZWZhMmQyZA	1540090183	\N
226	1	1	NmQ0YWI2YTFlYzQ5YjY3OWJlOTBkOTk4ZGRkZDk3NjgxOTA4OGJiYzY3MTQwY2U2MTIzYWM5Mzg2NTg0ZjMwMw	1540091730	\N
227	1	1	ZmFiMWYwNDRhYmU3NmJiM2VhMWMyMDBlMDYwMTEwZGMyY2E2MmZjYzY2MGU3NmU2MjYyMzc5NTA5NGM1ZmNkMg	1540091757	\N
228	1	1	ZWUzZTY4MDNiY2M5NGMzYmRjMTQwMTUyZDY3ZTJkNTQxOTkyYjZjOWU2YjkyNjZlZDI2YWFkODEzNTRiOTMwNw	1540092143	\N
229	1	1	YmJhZjgzODJjODkwZGM3YWQzZWIxYmNmNWY5MTY1NWRkMDljODgyZGMzYWFiODg2ZjgyNmYzYTRlZDU5ZGFmZA	1540092224	\N
230	1	1	N2ZhNjQzZGU1ZjRkNTVkMmMyMWFmYzM2NmM4ZDZmZGViYTQwYWE0NTlhNjIwOTJlMjM2M2RkZjcwNmRhM2M5NA	1540092235	\N
231	1	1	ZDNiMzZmNWY4ZGZjNTUwNTU1OGNiZjM1YjAzZjY3Y2U4ZDU4N2JjM2IyNWRkOTIwOWFkMGI2NDhhMDYzNzgwOQ	1540092249	\N
232	1	1	Njk2YWVkYjE1ZWMyNDZkOGNkMGQ2MTc4MGViYjZkODM4ZTYxZTVhMDJhYzhlY2FlNGNhM2NlM2EyM2Q5ZWY3Yg	1540092458	\N
233	1	1	YjVjMzM0YWJhMjU5MGZhM2EwMzJlMDYwMDQ3NGY2MjYzZjcyNjBmYTFlZDU2MTEyMzY4ZDE0OGYxMDk5ODM0Nw	1540093233	\N
234	1	1	YTFhYmQ0NjA2NTI5Y2NlMTYyNDhmNGQxYmNhM2ZiZmZjMDE5ZTM5NWRiZDQwZTdkNjYxYTlmMDRjYTM2NTk2Yg	1540093486	\N
235	1	1	ZmIzN2M2NDU5ZmJmYjMzMGVhNjdmMTliYzQyZDdkZWZlMzdjY2Q4ZmYxYTY5MzU0MTU3NDYzYzQ3YWUwYzNjNQ	1540093658	\N
236	1	1	NTg3MDU4MDM3Y2NiODBmZmIyNjg5OTBkYzlhYTU1MGVlN2VhNTQyMWMxOTgxZGI0ZDc0NmY0NTNlZjNmMjY4NQ	1540093670	\N
237	1	1	OThlNmM2NGIyNjZlNzQ0Mjg3YWM4NTdhYmM3MWQ1ZDhkZDc5MjViMTY5YzBlMzBkNzk1Nzg4NDU2MTdkMGYzMA	1540094465	\N
238	1	1	NTVlODQzODBlY2JiZTBjZDExN2QyN2NkNDAwZjBiMGNlMmFhOWE2MGM5ZDNiZmQxOGZkMTNjNWQ3ZmQ0NTliYw	1540094487	\N
239	1	1	OGQ3MTEyYWU4YWQyNDBhNzBiYzZiMjkzNzhiNDUzZmZlZjVjNDI0MWIzMjNiN2UzY2U5YTRiZDg0NzE2NGRiYw	1540094507	\N
240	1	1	OTMxNGRiOGEyZjIwMGFiYjVjYmNjYjhmNGVmMzg3OGQ1ZTlkYzc3MWRlMDU2YmMyNjc2ZDY3ODNiYTAxNDE5MQ	1540094535	\N
241	1	1	MThkMWQyYzdlODY5NDNlM2ZjZmQ5ODBmNGJkYjRkMDFkOGRlNmEyZWFlYzI0MDU1YjhhNzcwNzMyODA4NTk1YQ	1540095308	\N
242	1	1	ZmU4MzdkMWFmNzMyZTg1M2E0NmY5ZTgyZjRmODMzMDA0YzYxOTYzNmNhMmMyMmZmZWQ0ZmNlYTU1OGMxZDhiMw	1540095399	\N
243	1	1	OGVmYjE1MDBkN2UzNzFjMTM4NjQ5MDhhODIxNDdjMWEwNjhjMzJjY2I4MmFkYWU3ZmQ3NTg2YjU1YjQxOWM1Zg	1540095515	\N
244	1	1	NDliMjNkMjFmZjUzZDhkNjc0ZTIxYWQyNWRmMjA3YzNjOTJlMDIyMGZlZTljMWNiNjlkNGRiYjUyZDNlYmQ2ZQ	1540096714	\N
245	1	1	M2Y4OTFjODVlY2VlYTEwYjFkMzRjZGIxMDYyNTVlNjAzMzliZTRlMjRkNmRlNDY5YmM2MGNhYjg5YzEyNGMzYg	1540096846	\N
246	1	1	MGU0ZGNkMjBlYjM2MzUwZjFmYWNjMDhmOTQyZGQwMGZmOWFkY2U3ZmYxMThkMmE4Zjg1MWUxNWQ5NWQwZTU2Ng	1540096927	\N
247	1	1	YWJjZDdmMmZmOTBhYzEyMjgzNzE0MzUwNmM3ODUwYjdhODY3YmFjOGMwZWE4ODdlMTBiMjdjZDVkNDk2MzY1YQ	1540097004	\N
248	1	1	ZDAzMzM3MjdlYzlkNDUxNmI5NmFlNzBiNDcwODM3ODJiNTQyZmM3NzZlODliMTdhZDNjZDRhYjJjYjBhZDFiZQ	1540097177	\N
249	1	1	MjI2YmNhZjI4ZTFmMGVmOTExY2IxZDk1OGFlNWJjNjdlYWI5OWVlNzA3ZTlhMzZlMjQzMTA0ZDkwYjJlMzI4OQ	1540097181	\N
250	1	1	OTRkYTAzZmMyZTYyNTIxNGExNTdhMDMzYWIyYmJkOWYyZTcxMjM2MGUyMDk5MmY5MzFlNzRkNjBhYzFmMmZlZQ	1540097304	\N
251	1	1	MDNmMmVmMzBhMTA5YzhiYTc5NTIxZjQyMzg1MzcxMDEzODU2Y2ZkNWM1OGYyNTM2MjliMjM3OGQ4MmRmMGE1NQ	1540097383	\N
252	1	1	ZDM0ODA5NDJmY2FmNGZkMzU2NDE0OTQ2ZWQ1MmNmNDVlNWE4ODRhYmQ4MzFjMzM4YTIyZmUwMmJiOWMwNTQzYQ	1540097410	\N
253	1	1	ZWY2YWRkZDRlZGViOTA0NWQzNzgxZTE5NWQ2YjNjMTMwMDM1OWE0ODJhN2M3NDdjYWM4M2ZkNGM0NDY2NDVhZQ	1540097445	\N
254	1	1	YTM2ZmJhYzRiZWMyM2M0YTIxNDcxYTQ2YjM5MDdjY2ZlMDU1YzZmZThmMDdjYzBiOTNjYjdlZGU3YjM5ZDdkYQ	1540097447	\N
255	1	1	ZWJmODUzNTNiMjhiMGUyZjA5OWUxN2U5Mjc4OGYzNzUyMzY2NTFlNWNlYmEwNDhiMTI4NGYxOGRmZTYxMGVhZg	1540097503	\N
256	1	1	ZWJhOTBlNmM2YzQ3Y2RiZDlmMjAxZTUzYzcyMThhOGQ2MzE3NDE0ODcwNWZiZTIzN2U4MDUzZjJhZDk0ZjQ4Mw	1540097586	\N
257	1	1	ZWRjNzQ3Y2I5ZTM3MjgyMWNiZDhiMDk0ODA2NTE0MmM1OTRlOGY0Y2RiNTlkMzliYzMxMWZmNmJmOTAxMTMwYg	1540097643	\N
258	1	1	NzM3MjAwNDcwZGVmZWI4YzNmNzVkNTcwMDhkMDhkODFlNjYxMDEzNzhlMTI4Njc4Y2JjNDYxMGViY2ViMzU1ZA	1540097673	\N
259	1	1	MTM5NWNlNTkyZDQyMDE3N2JiMWFlZmNhMTdhNzY1ZTdjOGE4OTYwNGMzMzNiNzEzNDA5MjJhYmZjNGE0MmE2ZA	1540097754	\N
260	1	1	YjhlZDNlOGNhNWJkZTk3NmIxN2ZhOTAzYzZmYTA4MjIyMzYzMjVmMWM4MTYxNGQ5MWRlMjhiZTMzNmRmNzMzZQ	1540097779	\N
261	1	1	ZWNkYWYxNzI1ZWZkYTM0ODY2ZjlkZmE0ZGY0YWY4MjdkMTM2ZjIzNTNhNDViYjRiM2FhMDY5ZjZhNjliNjEyYw	1540097906	\N
262	1	1	ZGQ5NWZjMDFjNzdjYTE1MjdjMTFhNTRhNDZhZGM3ZDBmZDhmODY3OWEzYzhjMWQ3M2ZjY2MyMTlmYmFlNTJlNw	1540097920	\N
263	1	1	NGZkZTFlYTYzMTc0ZWZlM2FhN2IwZjQ2ZDQyYTgyNzJjMGU0NGJmMGNjODdkNTU4Yjg3ODMzZGFjOWQ4NThkYw	1540098497	\N
264	1	1	ZjdiMGM4ZWNkMTlmMmJiODJhYzkyY2IzZTAyNmM4ZDFkZjk4MGM0MDMwOWVkYjY1YTZkNDhiZWZiODYzMTgxZQ	1540098509	\N
265	1	1	NzJiZmM3NTJjYTFjYTM1ZGJmZDBjODJiNTdmOTc4ZDQ2NTRjOWU4ZDQ5ZTMwNDllODU5NWRlYzRlZmU5M2Q4Mg	1540138525	\N
266	1	1	NTlhN2RlZTU4NjZiNmUxZTQxNjQ2ODhlNmYxMTk3MTJjMDEyNDRiY2M4OTMwNGQyZjIzZDJlY2Q4MzkxOGJhMg	1540138573	\N
267	1	1	MGE4ZDdlZTk3NzgxNjlkYjk4YzgxYjc2YmMxMGVkOTJmNmMwNzVmYTFjZjdhZDU0MzM1MWIyYWFlZTlkYTlmYw	1540138604	\N
268	1	1	M2RlMGVmMTIxOTM5NmQ3YWViMTAzOTRlNzQyMmRhNDU2MDk2ZGI1NmQ5MjNmZDQ0NWQ1N2MzY2JjY2EzYWI2OA	1540138766	\N
269	1	1	NWEzNDc0OGJlNTUyMWVmZmI2ZDk4NzAwYzlmNzRjMWZhY2JjMjJkOWRhOGYwZDZlMjJkNWJiMDc1ZGMxZjAyZg	1540139000	\N
270	1	1	MGM2YTBjYjc2NjM4NWY3NjFmYzViNTUyOTU4ZjI2NGFhNjZkYzc4ZjE2MDkwZTRmZjE3YzVmNWNiY2U3NGYyOQ	1540139344	\N
271	1	1	M2FlYTU3YTA2YTAyMDg5MmFiMmZkMWIxOTczZGM3MmMwMDM1NDJmODlkYjZlYTUzYzk0Y2ZiNTM0NjMyYThlMQ	1540139382	\N
272	1	1	OTY1ZTlmMDAxMWQ2NjYyYTdjYzFlMGU5Y2ExYzYxYzNmOGM4NmNhYmQxZmRlMjU1MGY3OWZiYmVlY2RlNjA1NA	1540139440	\N
273	1	1	ZjNkOWRkN2Y0NGE4YTI0OWQyM2VlMDVmOTg3Y2EyM2VkZmU2MmRhN2I3OWIyZmE3ZmU3ZjllNzUyZWY5ZmVhZQ	1540139531	\N
274	1	1	MWNmMjVjNjBkNmRlZjY0YjM0ODJjYThmZTY3NWI4MjY4ZDVkNDZjODI0NmVlODE1YWRmYjA3N2EyZjhkYzAyMA	1540139531	\N
275	1	1	MmRmNDRmOTAwMDA4N2JjOWY4MzY2YzEyZjMyMjlkZmU5Y2JhYWZkMGI3MmFiODlmNjhiNjU3NmU1NGJhYmNlMQ	1540139542	\N
276	1	1	ODU3MThjYjQ0NTFkNzAyNGJlMzhmNzQ2YzE4M2Y0ZjVkZDI2YWIxYWI0ZjQ2NDcwMGYwZmQ1MTYwNTE3Y2ZkOQ	1540139585	\N
277	1	1	MzQyOTMwNzIxZWI2Yjg5ZmMwMDJlMGQ1Nzc4OWNkOTQ4NzZhNzcwM2JlN2E2MTc0NTUzMDA2ZWJiMGRmNmQ5NQ	1540139922	\N
278	1	1	OTE5YjMzZmUzMmQ1Y2I2YTZjZGZhZWMwMDE0MDBlMzliMDU5MmQ3YjQzMjY3NGQ1OTc1YzM1OTMyYWNkYWJmYg	1540139950	\N
279	1	1	ZTk5OTAxOTE5YWQxMzViYjJmODkzNzFhOTJiNmVhNzc5NWVlMGI2NDBmMzEyNGM2ODFkZDIzNjgyM2FhNGE2Zg	1540140054	\N
280	1	1	ZWQ2ZDRmOWY4MTg4MjVmYzQ4OTAyOGFkZDU4NzQzMTY5N2I0NDNlNjc5ZTAzOTM5YjA3YjliNDhjZTQ5ZTg4Nw	1540140064	\N
281	1	1	MDU3YzM2NmNhNDY0ZjdkODdkZjQwYWQ0ODRlYTdhZDhhYmNhZDMyNDQyYjBiY2RiMWJlNTc3Njk2MjIyMDE2MA	1540140446	\N
282	1	1	MzFhZDZiNGE1YWE3MmMwMjBhMGQ1YmU3OWY0ZWExMWYzMGU3MGVkOTQzZWYwZDkyZDg1YTliZDEyNDVhMzkxZg	1540140674	\N
283	1	1	M2JjZmFmNDEyZWE5YjMxMjMwYTA0ZDRjNDM1ZDlmMmZkN2Y1NTBhMjQ5M2YxZjM5ZWI0ZjEzNDY0MzM3NDA0YQ	1540140778	\N
284	1	1	ZGE3NTg5NTUyMjQ1YzVlODViMjY0YzMwMDA0YzgwODQwY2FiMGFiMzczN2Y3MmYwNmIzNzc5YzU3NzE3NGRlMw	1540140800	\N
285	1	1	NjhhMmQyODc4YWZjNTIyYzIwNGRmNmI3YTY4ZTIyMWY3Nzk1Njk4Y2U4NmY1YTQxN2FjNDVhZmJjMmJkZjdlNw	1540140818	\N
286	1	1	ODE0MGQ1NmMzNGM5OTQwMWRhM2JmMTdmMTI2MmM0NjQ1MDA4Y2ZmNzAwYWU5NDA3NzY1N2U5Yzc0YWVjNTk2MA	1540140845	\N
287	1	1	NDM2ZmZlYmRjY2EyMzg2MmQ5MTM2Y2ZhOWU3OGM1MTAzOWFlYmY0OWE3MjcwODI2MWViMWU3YTdmMTU2ODk4NA	1540140931	\N
288	1	1	Yjk1NzA3NGI4NzBmZmRmMzg0Nzg4YjQwZWZiYWM2NzQ3ZWE1OTExYzQ1ZjVjNTczZDMwNmNkMDIyNGNkZWUyOQ	1540141001	\N
289	1	1	MTgzNzcxMDFlZThjNThmZTc4OTUwOTA4ZDQxZTAwNmQ2MWJlNGFiOWViMTNhZjlhODdlZmNkNDdkMzA5OThjZA	1540141017	\N
290	1	1	NmJhYjQxMmZmZmZjYWM4NTQwYmYxMTk4MzhkYzVhYTA2MDYwYjk3NGRmNjIxZjFhZjhkNGE3OWZlMmU0ODVlYg	1540141115	\N
291	1	1	M2VmNzljOWRmYzE3ODZhNzlmY2NiNDFjODFmY2Y5MTBjNDBjYzA3MTEyMDljOWFkMGI2ZTkyNjc4ZjE1ODZhOA	1540141176	\N
292	1	1	NjAyZDViYjk2ZDExZjllMDQzMTU5OGI3ZjVjNDFhNmRiMTAwOWE3YzkwMDViODk1YzNhOTdmMGY1OTJiZjVkZg	1540141191	\N
293	1	1	ODMyYTI2NWRiYjZjMTEzNDkzMDA0ZWY5N2ViOGJkYmJjMWEyZTc4YzE1NmI0NTE2ZjAyMjYwMDc2ZTIzNDhmYg	1540141197	\N
294	1	1	ZTRlZGFmZDdlYTYzYWYwYzY4NzZjNDczZGY5NGY0Mzk0N2MwMjA5NDNmZTcyMjFmMTJkZTdhOGQ1NTM0ZDM1Mw	1540141219	\N
295	1	1	NDBhOTQ1NDY1OTIzOGEzNzk0YTI0NTFkOGQxNjRjNDZmODQ1MzRiYWI1Y2YxYTZkMmExMTQ3ZGU5NTViMWVkZg	1540141287	\N
296	1	1	OTg3ZDk3NDAzMzk2YzQyNWU5MjJiZTQxZDQxZjQ5NTgwM2YxZTIxZGU5N2VlZjk1YjIzNmJjZTE5YzVmMDM0Ng	1540141309	\N
297	1	1	YmMwMWMzMzExYjgxZWQ4N2RiMWQwNTMwNTQ0NTIwNTVkZTg0MWVlZWJhZTAxY2NjY2IwZDZmZTg3Y2ZjOTJkNQ	1540141356	\N
298	1	1	OTJiNTViMmM1YThmYjdjMTU3MWFhMzM3ZTIyYWNmNTgwOTk0MWFkNDBiMjNkZDNkMjEwOTUyMmFlMGFiMDI0OA	1540141391	\N
299	1	1	NzEwODhiMTkxMWQwOWVkODI3ZmUxNTAwM2RmZDUyNWJlMzY5Yzg5MWVlMDdlMzM2MTE2MWQ5YmRiNDFkNjhjOA	1540141495	\N
300	1	1	MGQ0NmM1ZmJhOWEzMDNjOGVkOTI5MWM2ZDQ4Mjk1OTE0YzQ4YmFlNDc3Y2I4MjE2ODNiNmQyYTRjNTg4YTVhMw	1540141640	\N
301	1	1	Y2E5ZjQ3Y2Q0MjlhMjM5M2E1MDkyMmJlY2M0ZjFmMjYzNDJkODM4ZmQ5NDJlNDNiZmEyMmM2NWQzNzI3NWExYQ	1540141648	\N
302	1	1	YzdkNTUxMWQ2NTdjNDcxMTNmYmYwMjA0ZDliMmZmNjc1MDk3NDhmZTMyZDhlMGU1ODQ0YmQwN2M2YjkzNjFmMg	1540141783	\N
303	1	1	NzE0Y2VmODViZjhmNzMzNjBjYmIyOTM5MjQxYWI3M2RjYzNkODI3MGUzM2Y0NWZmZWMyOGMyMDkyYjMwOTI0NA	1540141945	\N
304	1	1	OTVkMDU2MThiNDU3MWUxMTNmMjAyOTNhZGY5YTQ1YTY1ZDljYzgzYWEzYmFhZWRjYWFkMWE2Y2EwMzQ2NzZmMA	1540141991	\N
305	1	1	NTUzMTZhZDg3NTNlZTEwZDc4ZTgyMzRmZjYxMGZlMzEzNzc1ZWZlZWYyNmIwMmJjN2ZjMzgyZDNiZGJiMDBkZQ	1540142022	\N
306	1	1	NTJhMDU4OWYwZmIzZTRlZDVlODQxZGIyMWIyNWUyZWU5OTBkMjM1MDlmNGJhMzY5ZjMxMjI0MDM3MWQxZTU2ZQ	1540142119	\N
307	1	1	ZWNlZDBlMThkN2MyMjc4NjljNTQxMzJjMTBmNGVhYWNiYTMzODRiNDMyMzc1NGYwYmZhZTg3YjRhMDI1NDIyYg	1540142388	\N
308	1	1	YzNkMmZiZTY4MDkxNGQ4OTA1MWUxOTk3ZjY2MzI3YmIwM2I0NmE4YWVkOWY0ZTZiNDFjNTA4ZDNiZDk0MDY0ZA	1540142491	\N
309	1	1	OTNkYjMwNDc5YWI2Y2Q5NjkyNzAwYjhjMWQ2NTUzNTA5NTk4MDFiYTZkZDU3MWRkYzVjNzE0YTAwYjdiOWZlMg	1540142533	\N
310	1	1	NGIxNTY4ZDkxYTNkYzJkMDdjMmQ1N2I0YjA0YTRiMzA0NGIxM2MzYTAzYWI5NjZkZGRmNTY1YjkzZDE0Y2UwNw	1540142641	\N
311	1	1	NDczOTMyMWQ2NWZkYmI3NWFmYThkNDdlOTE4MmUyMGIzMjU5ZDM4YjhlMjAzMDJkMWRlMmExNzAzYWY1YzdlZg	1540142662	\N
312	1	1	NThmYzQxMzAwYTA1YTE0YWFkNmNmNDZiNDljZWM3MTE0ZWE5YTc0YjlkYjQzYzc5NjA5ZDZkNGEzOTgwNmY1Ng	1540142769	\N
313	1	1	ZjdiM2IzOWNiNWVkODRhNDRmMjhlZGJhOGEzYTdmYmVjNWI5MGQ5ZWE5MzYzODRjMjMzZmEyNGVlNDRiZjg5Yg	1540143381	\N
314	1	1	MGQ1Y2RhODQ3MmEyMWQzODRhODg2NGE2OTIwM2NmZDY2YzczYTU4MTRmNDFlNDMzOTBhZTAzMmJlZGM0NjBiZg	1540143710	\N
315	1	1	MWM4MmMwOWQ4NThlNmZkN2FiNDAyMDU3N2U1MWQyNmMzZjQ1MjZiMmI3MjUxZDJhNzY0NzE1ZGY2YTRlYjI2OA	1540143796	\N
316	1	1	ZDJkOGUyMTgyOWUzMjUyNjBmNDI2YzgzODBiMmRhOThlZWMzYWM3OGIyZjU3NjJiMDQzYzgxM2UzMDgwYWVkOA	1540144280	\N
317	1	1	OTM2ZDYyNGVhOWYxNGViY2RkZDUyNGMzODk3OWRhZjg0MTRiY2Q0ZmFkNTc0NDk5MzQ1ZWIyYWI4YzQ5ZmM1Yg	1540144394	\N
318	1	1	MmIyYjkzZTVmMTAyMTBhZGUyOTE2ODlmMDc3ZDIwNTEzZWQyNGExOTE2NmM5MDRmYmFmNWM2MTg0ZGEwMjU4OQ	1540144416	\N
319	1	1	NzFhNDA3N2VlZTBmYWM1NDRhNmVhNDhmMWY2MTQxM2RlNmZjMTIxYmZmYzJjODBhMGJmMWNmOWY1NDZjYWJiNA	1540144510	\N
320	1	1	MmRiODc0NDA2MDlhMjZiZWY3YzYwMDdhODNhN2YzZDJkZjRkYzkxNmRjZjI4NGQ2OGMyY2NiNzQ5YWVhNjYyYQ	1540144854	\N
321	1	1	MDU3NTM0MDg2YzlmNjBkMjExYTQ0NTkxNDlkNmJhNTQyNzIyZTFlMThlZjM2YjViZjBhMTVhNzg1NjEzZGNhYg	1540144967	\N
322	1	1	ODQ1MWFmMTRiNDViODgxZTJjNmFiNzRkYTZkOTg1MzMyM2ZhOGZkYjY2MWUyZGE0YjMyZmQzMDhkMTYxNjgzOQ	1540145357	\N
323	1	1	ZTJhMjU0ZmEyMzI4MDQzNjJmMWJkYmYzYmJkZTAxOGJmNjI5MTQyNTRhNzg5M2M3MGRmNmVhY2M3NTJlMTA3Mg	1540145745	\N
324	1	1	NWRiYzQ5MTE1MDhlNTY5N2RmNmM1ZWVkMWU4NGNkOGYyMzc2NDg1ZjA1NzQzZGM2YzY2NTZmOWI5Njc0MzNmYw	1540145800	\N
325	1	1	MzRlYmYzYWE1M2ZlOTVlYjdmNTQzY2E0ZjNmODliZWFjY2IzZmJiYzNkNWUxZjY2MmFmMTNjYzE4NmFmMzU2OQ	1540145872	\N
326	1	1	ZDdmMGUzYTA1MmZmNjZjYWRmYzAzM2FhYmVjYjhkYmZkZGIwZTMwMzgyZGJlOWY4ZTU2NzE3MDA2OGZlMTFiZQ	1540146132	\N
327	1	1	MTNiZTI5NmQ4YjliMzc1ZTRmYWVjNjM4ZjQ4MTJiOTU2YTc1Y2QxZTBlMjExZGIwZmZkYWQ2M2VhNTJlNWU1Mg	1540146242	\N
328	1	1	ZGFlOTJlMjM0NmRhNzdjZDdjODIzNzk0MmMxYTljYTM0M2U1MGZkMTZlMGZjZDM0ZTgzY2ZkMDEyYWFkZWY1Mg	1540146427	\N
329	1	1	ZjcwODY4NWU0NGVhMjc4N2NiNmVjNTBiYTMyMzQ2NjdjMzRiNjVmM2JkYzFmZmViYjUyMTJjNDViNzYzOWU3MQ	1540146956	\N
330	1	1	ZmUwOTM2NDdiNmJlMWVhZjE1NzU3NGZkMjI0MzM3MjY5NDBlZmJjM2RiMmYwOGIzZWVjZGU3NDllYjdmMTdjMg	1540147713	\N
331	1	1	ODU3YWQ0MmM1NjEzNmIyZDRkMjkxMDhmNmEzZTkwYWE4NTBkODRkY2VmNjYxYWViMTI1MjI1MTVhNjhlMWQ5Zg	1540148367	\N
332	1	1	ZGMyZmUzOGYwMmU5ZjU4YzZkNmVkOTk2Y2UxNmJjZjYyOWRiN2Q4ODliZTZjZGIyNWQ5MmYwZmQ3YWY2OTc1NQ	1540148480	\N
333	1	1	ODUwOTZlZjczYzM3NTQyNDJjN2IxYTczNzA0YWJkMDc5YzZmNWM1NWFjZjY1ZWJkOTcyODE3YmI5ZjMzMDk5OQ	1540148783	\N
334	1	1	MjUwMTFhYWZlNzlkYjQ3NDhiZDlhMzA5M2EyNTgyNjZkMDUxZDFlNzA2NWJiZTZiNjY3ZDc0YTlmMGIwYTE2Yw	1540149590	\N
335	1	1	MDU5NWNkODEwNDgyZDIxNDlhMjQxY2Q5OTExMTEzZTk4MTViNDVlMGE0Y2NmZThhZjA5MzI3NWZkNzg0NmM5NQ	1540149726	\N
336	1	1	NzhlZDYxYWE1NDU5YjAzYThmYzgzYzQyZjlhNGRjMjNiZDhlNmI2MzI4N2IzYWIwNmNiOWVmODMxYzI4OWU0MA	1540149805	\N
337	1	1	ZDUzN2FkODYzZDc2ZWNiYTNjYThmODJkNTMxYmFhZDFhOWU1NGQwMTRiYWMzYTUwNGI1NThlYmEwYjJhMzVhYQ	1540149810	\N
338	1	1	NGQ1ZmNhODg5ZTcxNGRkZjY1Njc2ZTQ5ZGYwYmQ5NjE2MTgwYmUwNDVlOWEzZjIzMTQyNTQ5NjJmODdhYWM3NQ	1540150041	\N
339	1	1	MWU1NjEwNGNhODg0MjEzODRhYmU0MDk0MzhjNGM1NWI5MjViMDIxN2Y4YTAzYWM5MGYwOTVhMjNjMmJkNzJhYw	1540150786	\N
340	1	1	ZTc4MjIwZDc4NjExYzlmOTZkMGM4MWQ0NjI2ZWVkNWViNDEwZGRhMGNjZmRkNWE0NWI4ODBhMmQ3YTVlODhiZA	1540151085	\N
341	1	1	YTI0ZGI3NmRiZWE0Y2FmY2ZiZWZiMDcxY2VlMzg5MDY1YjU0OTY2MDkwOWEzNDE2MThmYTA2YWQ3MTkwYWYwMA	1540151136	\N
342	1	1	YWEwNzZmNzQ3NjBhOGE2ZWZkYmE5NmJlZWZjNmEzOWQ3NWM5YzkyYjM0NjAxNDNlYjM1ZGQ2Mzg3ZmFhNjU2Mg	1540152231	\N
343	1	1	ZDczNTg5NGRiZmI4NjMwYmM4MjRkMTQ5ZmI3NGEzOWZkNjBiOThlYTE3MWZkMmY3N2RjZjNiNDIyYmVlYzZmMg	1540152844	\N
344	1	1	YTQxMGQ5NzlkMjkwMzYwMzFhNWIzNjBlMDEzNjkxMjFhNTRhMWZkMzZmM2Q5OGM0YjNiMGUyYWYyYzFmYmQwOQ	1540152919	\N
345	1	1	OTM0YjIzOWZkZTEyNzI0ZGM4NGY1YTEzNDA1ZmQyY2Y1NGI2MzNkOGQ2ZjY4MDVmMzhiNzdjMWE4NDY5NGRhZQ	1540152979	\N
346	1	1	MGRkMmNiNTA4NTFmOGNhMmUyYjMwNTgwZWRkYTE3ZGNmNGNiY2I1NjM4ZTVhZWQwM2IyMmY4NDVhZGZjNzVlNA	1540153215	\N
347	1	1	Njg0MmFjYTlhODgwMmRiMWE0ODY0N2YzNmU4Zjc2MTVhNmM2OTIzNmJjZDhkYTk1YTdlZWI0ODkyMDJhMzcxMg	1540153241	\N
348	1	1	YjA1MTc0ZTg2ZDMxMzZiN2QyZTFhMDA3OGYyMTMyNjFmNGU0ZDA5MDY4Y2E1Y2Q3MDNhZGU3MTkzMGMyMWFiZQ	1540154645	\N
349	1	1	NDUzMjFjNGE1N2JkMzNkZmMyOGUyZmMwNDUzNjlhYjc1MTgzMDFmMGIzYjcwMjFjODM5NjA3NDUwNDM0YTM5Yw	1540154680	\N
350	1	1	YzQyYjI0NzFkOThmMGQwZjU1NTdkZWNlZjY0MDM4YjdlZGE0YjM4YjY3YzMwZmQ1ZjA1YjMwYmY0YzY4N2U5NQ	1540154708	\N
351	1	1	MWIwOWY2ZDNlZWU1OWYyMzJiZmFjYzg5YTY1NjBmYmI5OGZkOTNiZTViZmRlODQ0ZDgwZmNkYzAwZjdmNDY5Yg	1540154800	\N
352	1	1	ZjlmN2RlMTYyNGU3MTQ4YmQ4NTdjZTBlYjNiNDAxYTA3MDU0ZTAxM2Q3NGUzOTk0YjM3ZWFlOGM4ZGFhZGMyNA	1540154808	\N
353	1	1	YWQ1Mzc3NDgzMDAyMTEyZDdlNzA1ZGQ2OTJiZDZhYmY3MDJjNmIyMjRjNjQyOWIwNzZmNTQ3Y2ZkNjgxYTM1Yg	1540155045	\N
354	1	1	NGY2ODY0MGIyZGMwZTRjNGRmOTVhYTYwNGQ0ZjRkM2QwZDQ4YmJlNGNhMDllYTE5NDYyZjc3NTkxOWZiODYyZg	1540155070	\N
355	1	1	ZjkxZWY4YTY4OTFmMDYwMmRhYWQ0NmZhZTcyNzI3NjQxM2M4YzIyMTI0OGI2NWU5NmE4YmRkMDUzMmU1MzZmYg	1540155293	\N
356	1	1	YmYyZTAyNmM4NmI5NGNmMjFmNGE3ZGNiYzExZTU0ZGM5NGNhMDAxYTllYWI5MWEwNDJiMDZmMTlhNTY1Njg0Nw	1540155319	\N
357	1	1	OWU1ZTUwMDk3ZmJiY2I5OTliODlmYjVlY2IyNGRjNTQ4OWE4NThhMjY0YmU2MTgwOGIzMzQwNmU2NWEzYWJlZQ	1540155523	\N
358	1	1	ZjQ3MTc5NDYxMTgzMzM4YmU2OGRlNjM5ZGUyNzVlMTM5YzRiNGFhZjRhYmFlZmQ3MmRhM2M2OTVlZDA3MTdmMA	1540155608	\N
359	1	1	NTc1YTJkZTgzMTg4NGUyYjUzYTY5NDY2YWY3OGE5MDVmYjU2MzQ5ZGQ2ZjNlYjQxNWRjYmNkYTQxZGI4N2E1Nw	1540158021	\N
360	1	1	NzEzNmNlZTQ0YzY2OWY4NGFlMDM5ZjQ5MTVkZWExNWZlYWI5OTllMDY3NDg2NWQ1ZWRiNTc1ZjhmYjZjMDg4OQ	1540158688	\N
361	1	1	NWMwZTcyNjMxOWQ0N2Q1NGQwMGQxYzEyYWIyMzE5ZGQxZDUzMmRjZGU5Mjk1NTRlZTJhODMwZmNlNWMxY2UxNg	1540158789	\N
362	1	1	NTQxOWZkOTM4ODViOGZlNzk0ZGRmMzRiMThmN2E2YmY3NDA0OTRmMTFjMzgwYTIzYWNhMzFhNTg1MmNiZGZkYQ	1540158863	\N
363	1	1	OWE4M2JjZjRmOWFjY2IyMmM3YjY0ZDg3NjgyOTNhZmM2ZTk1YmZmZWJmYWM4YjBjMjc1ZGI2MGE5NzNjY2Y3YQ	1540158987	\N
364	1	1	MTc1YzA4NTg5NjcwMGNhNzhkOTlhMjhiZWVkM2Y4YWZiYzg3M2VhYmE2NmE4OTRkOTRhNDFmNGYzOTlhYjJmZg	1540159216	\N
365	1	1	ZDA3OTQ5ZjYwNWYyYjQ5NWQyNmI4NWIzOTdmOWVjM2VhYjU0YTVjYzdlYmVlZmEwNDEyNjI1NTgyYmU1M2EzOQ	1540160052	\N
366	1	1	ZWZiZWYxOGVhNWU0MWViMWNkYjhmZDJhMjNjZjA5ZjEwMzk2NTk4MDBkZjE1Mzc2OGRjZWQ0YjcyY2U0M2Q1Yw	1540160086	\N
367	1	1	ODNjOTc4N2I2ZjkzYzg4NGQ3Y2JhNzkxODFlZjUxMWU4OWZhODYxMzkzYWVkYmYxNzdhYTM5YzViMDEwMjdkYg	1540160928	\N
368	1	1	MmZkZTFhZTk4ZjczZTc5OWJkMWZlYTc3ZWZiODRhOWRiYzI2MzE1YjFlMTExNzc3YmExNGFlM2U2MTczNjI4MQ	1540161147	\N
369	1	1	YzA1MmMyZGY0ODRmZjdiYzNmYThjNjJkZWYxYTg3ZTdjOTE0YjNhNzMwMzBkZTdlOGY2MGUyODQxNmI1YzE1Yw	1540161596	\N
370	1	1	YWUyYmJiODMwMWM1YmNjMjA0YzgwZmFlNDg0ODc4MmRlZmY2ZDJjZTlhMGJkOWE2ZWU1ODk2YTEyODlkNWQxNQ	1540161656	\N
371	1	1	MDEwYzNiOWUyNDYzZGUwOWNmOGY0Mjk0YzdmZTk2MThiN2Q4MDNlZTEzNjA2M2M4ZWZmNDI1MGU0YWM2Yzc2OQ	1540162625	\N
372	1	1	OTE0YTZhMDUzMzdiMWZlZDZlZjE0ODdjNDU4MDQ0NTE2OTI5MzNlZDkzY2E2N2U3NjI4NWY3OWM0NTE0N2I0OA	1540162663	\N
373	1	1	N2JjNjZiYzUxNGRjNDZmMDk2OTNhMjNhZThjNjgzNmNkYTBmN2EyOTdiNTI3OTQxZjVkNDlkZDA1M2EyYmY0Yw	1540162775	\N
374	1	1	ODk2N2QzNDlmNDczZmRlODMyNmUxNzcwYWFiMDI4MzE1MzliYzQ5OTFkYTYyNzhkZmE4ZjEwNmJjNDAwY2Q0Nw	1540163096	\N
375	1	1	YmQ5NDhiNjQzZmQwMjliMzI3MGU1YmFmNzA1NzQ3NTUwOTJiM2Y5ZGM1MjhmYzRiMDBiMjQxMzA3MmQ0YWI1Mw	1540163618	\N
376	1	1	OWMyMzhjNDNhMmU0ZGEyNGU1YTIwNmM4NTdkMGNhMGMyNTZkNDc5NzUyYWIwNjUxMDM2ODZlM2JmNzE0NDFhNw	1540163650	\N
377	1	1	ZWI4M2EwOWM3ZTNmNThjZWEwYWM1OGVkZmQ2Mzg5OTI1YTRiYzUyZjM2YWFlM2VkZDQ1OTQ3YThiYWUxYzQyMA	1540167668	\N
378	1	1	MWZlODhlNzhhN2ZjYjY1OGEzZDJkYjliZjVmYmQ3N2EzMThlZTZkNjk4ZDE1MTA4NWY4NjMwMDRjZGQxMDhjNA	1540167819	\N
379	1	1	NjUzMTUwNGZmOTBhNWVjM2VmOWVhMDg0M2FmYWIwNDFmN2VmMzBkYTQ0NjYxNjg2NWFlYmViOGM2MTFmM2Y3Mg	1540167891	\N
380	1	1	MGUxOTFmZjQ4NzVmYzVjZWVmOTIyODRlZWI0OWM0NTQyMGIyZDVkMDU5YzdlMzM3ZjY4MWFhOWZkNGEwOWE1Mg	1540168082	\N
381	1	1	NzZmMWZkOGQ0ODlhODNjYmEwM2MzYTBjZTNlMmU0YTg5MDRhMjQ2MzEwNTQ5NTVlYzZiNjVjNDQyZmRiNWEzNg	1540168167	\N
382	1	1	ZWY1MmZjNzA5ZTE4YjA5Y2VhYTAyYzlmYzg3MDUyZDU1Y2M2Y2ZhOTk5OTcwMDYxMGJlMmNjYjE2ZjE4NjY5MA	1540168192	\N
384	1	1	OGI3ZmI0NjMzOGMzNDRhNGRlNDg1ZjA2Mjk0MjBhZGU0YWY0YWNjNmU3N2E0NDc1YTQ0ZWViYWI0ODkxZmQ3OA	1540168407	\N
383	1	1	YmJhNzZjNWM0MjQxMDYzYjhjYWUwNzg1YjVlNmZiOTJkZDM3MWVlMzVmYTBmN2UyYWEzYWYxN2RiMDMzYmY1Nw	1540168407	\N
385	1	1	YjdmMWI3Nzk1NjcyNTJhOTRjOTY0YWUxNjllNjJkNjVjMGJiOGU5YzQxNjUxOTg4MmU0NzQ3YTEyN2I1ZmE4Yw	1540168474	\N
386	1	1	YzI4NjcxOTgxNjk3OTU0YTkzNzUwMjgyOWQwNGU2YjYzODY4ZjNhZmI1YTdiYjUwY2U3MDFlMjhlM2IwMTNmMQ	1540169129	\N
387	1	1	ZDYyZjkwNzkxZDJiNzI4ZTYyYmQyNjdiNGFiYjdlYzFlMmMxOWEyMzU0NzcxODcxZWNhMDM1ZDMwN2JkZTY0Zg	1540169314	\N
388	1	1	ODI2YTIwOTY0ZTViNDRhNTI4NDBkZmY4NWI4ZTc5ODU5MzdlZWI5MDdiMGMyZWNjM2RkZDBhMGQ5MGYwOWJkYw	1540169399	\N
389	1	1	ZDljZjhiNDU1NDM4ZDY0YjBiNzA4YWFjNmRlZTBhZmVjMDU5OTRlNzc5NjgxYzNmOTQ0MzNmMTg5NDZiOWIwMA	1540169441	\N
390	1	1	ZDAxODNlNjc2ODZlZjUwMGY3NDM4NDdhYTAyMjNkOTU1Zjc1MjNjNDdmMGUxMDkzY2U4YzE4ZWM2NjcwZGYzZA	1540169608	\N
391	1	1	NzRhYjBkNTlkMjFkYzkyNjU5NDFmMTU0MzMyYWMzYTlhMDZmNjQ4NmU5ZWQwZGIzYjRlNDMwNjU3ZDAxMGM5Ng	1540169692	\N
392	1	1	Y2I5M2NmZTAxZmE1NDVkMmRiNWE5OWRjMWVjY2MwMDI3YTc1NjQ0ZjI5ZWI3ZWVlNjg2MzUxY2EzODI4MTFkNA	1540170826	\N
393	1	1	MDgxMmJhOTYyZjRkODg3NjY3ODkwOTRiY2Y5M2Y0NTY4OGNlNWI4NWQ1MGNkNDg0ZTI4MmM3MTkzOGRkMjQ2MA	1540171181	\N
394	1	1	NDIxMWM4Nzc5ZGMzYTUxZDcwYmQyYTFmY2M5ZDlhOWE2NGM2ZjI3YTllZWQ3NWZmNTk1NDY5ODY2NmJjOTQ4OQ	1540171856	\N
395	1	1	M2EwM2E0YzRjMDAxNmRmZjg2MTFmYjBjMDFkYWU4Y2FiNDI2NzVmNTlmNTQ1ODc4OWZhMWQxNDg1MzM1N2RhNQ	1540172672	\N
396	1	1	YTE5N2ZmNTNkODM0MzA3NWNlN2UyYzkzNDkxMjgwZDY1MWZjYzg4MjYxZjQwNWExMmM5OTIxNWQyY2UzZDhlNA	1540172809	\N
397	1	1	ODk1ZWIwZGQ1NjUxNjlmOTMwZjIyNzY5ZTM3MmQ1MGE1NjMwNTI1YTZmNTMxNjVlZjVmODk0YjNjNTM0ZDE2Yw	1540173330	\N
398	1	1	NDk0OWZiYTE0N2E1NjY2MjQ2ZGMzYjliMTlkYjhiYjUzNGVlZjNmY2NhZDU4MDQwNzdmZTg3OTZhZDBjNTdjNg	1540173475	\N
399	1	1	ZTIxZTg5ZjQxYzUyYTVkNGExNGMwZGIyOTZiOTRhZGVhYmI4M2IxMTM2ZTE4Y2FiOTU2OTU1NGRiNzJjZWYzMg	1540174840	\N
400	1	1	NDMwNTVlODMwMzQ4ODY3ZDI5ODQ4NGFiNjdmZjhlYjcxYTc4MWVjYzZjNzhiNWJhMDMzZjQ3ZTJjYzEzNmUyOA	1540175515	\N
401	1	1	MzE2YTRiM2U4OGIzNTZjYzM1ZjAyYzIyZDc2NDQ0MzE0MGUxMDVlNzY2MDM1N2U1NjM5YjFhMTAzODE4NDY3MQ	1540175576	\N
402	1	1	MTFiNjAxNmNmM2JiZmE5NjM4NzU3M2YwMjhmYTc1YTFiYmFmMTNhNDczNjEwYmYzNjRjZDg3OTE0MTYyOTM4Yw	1540175715	\N
403	1	1	OGM4MWMyNTljYzJiNDM1MmE3YWRhMTk0ZjdkNmU2ZThiMGVjNmU2NmQwNDVmYWY2MjI1NWUyNWZiNGZiYjViOQ	1540175763	\N
404	1	1	M2YzZDg5Zjg0OWQ4YTJjYjRjY2FlNDQ4YmM1NTBkZmI5ZjZjNjM3YmY0ZjY5NWE2YmQ5NjRjMjQzMjJkMzgzZQ	1540175860	\N
405	1	1	MWU3NjFhMDNmZjliODM2YTliZmI2YTFmNzY2ZmZhMTRiN2E5NjNiZmZkZDEyYjUwYjIzYzI5ZDllNmJjODM4ZA	1540176064	\N
406	1	1	YWFhZGMyZjE3OTEzYTRhMzI4ZjBiNjQ3Mzg3OWNjZDU1YTdjODFjZjI4N2FjYzI2NDNlODUwZDMxMjkyZTVkNQ	1540176696	\N
407	1	1	YWI4MGZhMmQzNTQwNDEwODZkM2Y3NmZhMGFkYmYxMGIxYmJmOWMwM2NkY2I4MGZjZDMzM2MzNWQ5NjQzZWViNQ	1540176723	\N
408	1	1	YzAzN2MzNzdjMDdhMmEyYWQyN2FkN2M5NGVmNWY1MDUyMDYyYzU1ZGYzNWQxMjZlYzQ1ZDg3YWUzMGRlMTIzYg	1540177545	\N
409	1	1	MTdmOWQzZGY5MTM0Zjk0NGZhNjgwZTkxMmI4ZTdjZTA0YTNkZjE2MDFjMmQ5ZjdhY2RhM2JhYTUzN2YwYWZmNA	1541345627	\N
410	1	1	OWRiNDcwMmQ3YTdiZTlmNTFjZDQ4ZWM3NmZmN2M2MWYxOGU0NGRmOTU4ZGEwMjM0MmM3YmMyNzBiYTM3NjU5Zg	1541345627	\N
411	1	1	ZDk2Njg3ODcyMGRlNDQ4N2Q2ZTlmYWMxMzY3NjI1YTRjYTFmODZhYWFiYzhlNWYzZDVjMzU0YjFlZGEzMTAxOQ	1541368100	\N
412	1	1	NTlmNzFlNjc1MjIxMzljMDgzZjkxMDRmMzE3NDNkMzgwZTgyZmQ4ZmQ0MzdiMmFiODJkZDllM2JhNDNmODYwYQ	1541368630	\N
414	1	1	MTJlZjJiMmE5YmFlZTA2YWU2NTMzMTE5MmJmMjg4ZGY5ZTcyMmNjYWU3NmYwY2I5MWNmMjg2YzBkZWJmMzE2Ng	1541380598	\N
415	1	1	MDY1NTMwMTc0MTdhODhmNTA3NDBiOTAwOGIzNWM2MzZmNTA5NzEyZDAyZjI5MzdkZDNhMjFiNjFkMDVlNmJmNw	1541380598	\N
413	1	1	NTQzOWIxYTM1MTdmNDZiZDQxODZhZDE0ZDNiN2Y3MWIwMWMxMDM1NGNmNTNlODVlMzQ3OGJiNjk3ZDI0OGRhMg	1541380598	\N
416	1	1	ZGQ2ZGZlZWRiZDc3MjEzMzAyMjcwNTJiMTBjMDI0YTAxNTFiOTA0ZmFiYjM1ODBjZTQwMTVlZDQwODU2NjhkYg	1541380602	\N
418	1	1	MWY3MjMzZjdmYTUwYjBmZTVmOTA2NDdkNTUzNGMyMTE2YjVlNGQ4ODcxZTJmYjY0NWE5MThhMDU5NmRmMGUwNg	1541469050	\N
417	1	1	MzE5NDcwOGU2Zjg3ZTQwMzM0YTc2OWQ1ZjIyYzgwYzE5M2ZkZDhhMWVlYWI3OWFhMTYyZmU4MDZkZDhlNTkwNQ	1541469050	\N
419	1	1	MmNiMWM4MzBjOTc4ZDcwMmJiNTU2NDY1YjIzODdmMTRjMTJiMjdkMmYxNTEyNDJlMjdjMmFkZjBmMjFmNDkzNw	1541469053	\N
420	1	1	OTFhZmYwYjUzNjdhOWVjZjllNzI1Yzk3YTJlNzk5ZjY5ODg0ODVlMmM2N2QwOGU4MTcxNjNmYjJhMGJiOGM4Yg	1541552453	\N
421	1	1	ZTVjOTFjNWM0ZmIwMzdhMzk5YWY2NmRmOGRiNTI5OWU0NTM4NDhkZGIyMmE0N2VjNzA0Y2QxMzM5MmYwNzZkNQ	1541552453	\N
422	1	1	MjQwMGRjODBkYzUzNmU2ODNhYTg5YzZjNDc0MzA2MDM5NTZmNGMwZWIzMzczZDMyNzcyOGFjYzkxOGU2M2FjMw	1541872487	\N
423	1	1	NGZkZmQ4Y2U3NTkwOTY3NzkzM2Y1YTlmZmFmNjI3NTljOGU5YjhlOWMwOTNjYTZmYzkyMjRkYTkwMjE4N2FkNw	1541898644	\N
424	1	1	YTkxNGIzNDBiOThkNDc1YTI4N2U4YjA1MDE1NTA4MmZhMTUwMTljODFkYmZlMzk4YWM3YmMxOTcwYTE4YjJkMA	1541898644	\N
425	1	1	ZWVkYjhmYTlhMDhjMWQwMjk1OGJkMjJhYjg5N2Q2ZWZjYTQwNjlkN2U3YmE1OTc2NTA5MmVlZTk4ZDExY2MxMw	1541947108	\N
426	1	1	YzliMDFlY2FmZjYwOGE5ODkxNzE0YjcxZTZhOTYzODQyOWJkZDFiMWRmY2JjZTQzNmIxN2NiODg4MjNmNGZiYQ	1541986299	\N
428	1	1	YTY4YTkzNWNmMDkzNjRiNTRhYjZlNTdiN2ZjOTBkNTE0ZmYyM2Y5YmQ2OGY0ODkyMDI4NjkxNWRkMzRiOWVhMA	1541987628	\N
427	1	1	Y2JhODYxYjhmNWEyMDYzMWEzMTAxODY2N2YzNjI3YjFjNDMwZDk1OWVjNzIxNTAzNzA0MDZhZTBjNDlmYjQyOQ	1541987628	\N
429	1	1	NjliMmRkOTE0YjZiMWZhYjQ3YjkyYzczMThlZTgwOGM1MjQ0Y2U1YzNhNWY3MTk0ZmFhMTgwZGJiMTNhYmU0MA	1541993115	\N
430	1	1	N2FlYTRlMWE4MGNmZjgyODQyNmRlMjgyZTA0NmNjNzA1NDdjZDkxZWU2ZmU1MjNkYmU0MDY2YTZkMzQ4NTA4YQ	1541993137	\N
431	1	1	OTZmMThlYzY2YzFlMGJlNTBmOTMxMjAzOGM2NDQ2YjE4ZjRhNGFlOWRmYjU1NDcxZGI2YzFkN2EzYTI2MmY5NA	1541997736	\N
432	1	1	Y2JmNTA1ZTQ2MzAwZmZiOTY3YWYyOGYyZDkxOWZmYWVkNzUwMmRjMWI4YjM4NTIwYWQxNWU2Mzc2MmEyMDk0MA	1541998830	\N
433	1	1	NDQ2ZWM3YmEyYmE3NWE0M2JhMDM3MGFmNTI3OWVmMmU0ZjgxODdiNjEyMmFkYzkzNjBkOWUwMjVmYzQyNmY3MQ	1542006831	\N
434	1	1	YWM4MGVkZjEyMDkwYjljZDIwMzFiNDk1OTdlMTZhYTIzNGU1ZGRmZTZiZWZmNWE2MTgyMmU2YjFmZDNjOTc4Yw	1542006831	\N
435	1	1	ZTllOGRiNDFhOWY3YjBmMjU3N2M2MzE4Njg2ZTdmOTA4MGJiYWQwOWU3NDQzMmM2Nzc1MGY5MjhlZWQxOTAxZQ	1542029166	\N
436	1	1	YmIwZTBhZDVkMGY3MzljOGU3OTU5MjJiYzhlNTMwM2NkOWVjMTY4ZjgxNzMyYjI4MDIyN2UwZDY2ODU4ZWZlNw	1542054094	\N
438	1	1	NDljNWNiMmQ0OGZkMzMwNTE0NGZjZDIwMDY3OTQzMGVhN2ZjMGM1NTgzMGU5YTZlZWRkZWIzMDViMTZhYTBjMQ	1542062422	\N
437	1	1	YTYyOWEwODkwYTI4MzI3ODFhN2JkOGFiOTU2MjI5ODdhMmUzZGM4MDYzNTk1YWRhYmFmMDI3OTAxM2QxNGVkYQ	1542062422	\N
439	1	1	MGU1NTY5NzVkM2M2OTZkNjlmNDRjNmUxYmY0OGQ2N2Y1M2EyMzQ0NWJkZDA4ZTZjOGI5YWUzNTczNmVmZDk0YQ	1542062645	\N
440	1	1	ODQ4MTIwN2FlNWI0YmRjYzg0MmZmZWYzMWI1ZWMyODRkMWVlNDQ1M2MyZGRlMjAyMzFkYWJmZWI4NDc5YmZiNw	1542063444	\N
441	1	1	YmM1NGIyYjRmYjg4OWE5NmZkNzMyM2M2M2RmMzVkNTc1ZGYzYjUxOWQyNmE4N2Q5MDU1YTM5NjYwOGY1NTIzYw	1542063447	\N
442	1	1	NTVhYzg2YTA0ZDJjM2ZmMjAzNDQ3NjJkOGY5ZDY4Zjc2ZmE5NTAwZGM3YTdmNzc0ZTAxYzU0ODY0YjYxMzNjOQ	1542114169	\N
443	1	1	ZWIwNDliNjE5OWYwNzA3NzkyZGU0NGVkMWY5YmI1MDUyYzk4OGIxNzIzNTA5NmVmNDYyYTAxNDBhYWFhOTU4ZA	1542114169	\N
444	1	1	MThhYzExNDM1MWQxNDRkYjcxOTIwY2RhMjhmYWFmZjA2OTY5ZjE0OGMxNjJhZDk3OTVmOTJkNjYxZWQ2Zjg5Ng	1542117425	\N
445	1	1	M2M4YjAwMTRlNDNjZGQwYjcyYzg0MDdlNWRiNjIyMTlmZjhiNzg0OTMxZGYzOGU5NDJkNzQyYjc0NjMyNzRhNA	1542127583	\N
446	1	1	NDgxMjIxZDU0ZGFkMWY4ZDYxYWNlOGQ0NDMwMzRmYmEyYzU2OWM0ZTA2MjI5YTgzZTQwZDAzY2NmZWZhZjM2Yg	1542127624	\N
447	1	1	M2YwOTBiNTFiZjkzZDc1MzE0MGVkYWZiMWMxNmZmMjYxYTcyNTdiYzk2YzhkY2MwNzA1OTcxM2Q4NjU1MGMyYQ	1542401349	\N
448	1	1	YmI4OTk1ZDY4ZTZhZDYxODQwYTJkMzEzNzRjYmJiNTY1ZDhmZDU4Njc0MjZjMDQwNDNkZTAyN2MxMDY2MDIyNA	1542644122	\N
449	1	1	YjZjNjUwNzI5NWQyMzAzODI5MDRlZWY0NGRkZDA2Yzk5ZTc1NzQ2NDI1ODVjYmJkOTI3OTA3ZjAxMGI3YjQxMw	1542644130	\N
451	1	1	MDFkZmI3YjExYmVjYzk4NDYyYTYzNTZhZDU4M2UwMTk5YjQyNjYwMGQ3ZDJkMzIwMjA2MWI4YzdiZDUzNjUxNg	1542659280	\N
450	1	1	ZjQ3YmQzOWI1ZDY1MzI1ZDI0NDFlZjI3Mzk0OTA0OTMwZWY0ZTZhMjNkY2ZkNDFmNmIyNjRmYTg3NzNhMDJkYg	1542659280	\N
452	1	1	MGVlZmNhYTYwZDVkZGE3ZTUyOTZhNjliMDJmODQwYzJhY2ZhYzVmMDhjNTM1NDA3OTkzYjljNTZiNTBmMmU5Mg	1542659773	\N
453	1	1	NzZiNWI1Mzk5Zjg3MzI2MGY2Yjk3ZjFiMzVkMzkyNDM4ZmY4ZDc5Y2UzZTg3ZmYzNDQ3ODM0OTkwMmM3OWQ3ZA	1542659896	\N
454	1	1	Y2E2M2I5NjkwNDFiY2YzNjliNWFlYTRiOWE1ODMwZDBlN2JkZDNlYWI1N2ZkZWNhMGQ4ZDUxZGFiOTkyZWFhNg	1542659900	\N
455	1	1	OTYxZjFkNTY1N2ZkNDhmNGVkZDM2MTA1YzIwMDc4NGRmNTdkNjU1YWE2MzIyMTk3ZDM1NjljNWNjYmE2ODE1Mw	1542805755	\N
456	1	1	NWI3NzI4YjUzYzY3YWIzYzBiODA0ZWI5ZGI5MzNiOTYzMjUwYmVhMmFkZmE3YmVkNjY3NmU1Yjg3ZmRhZTVhYQ	1542805923	\N
457	1	1	NTQ1NTAzMTRhNTU5ODU3MGI3Njg2NGJjMTczZmNmMDdhNmQwNDk0MTU2NTA1NjI4ZDQyYjk3NWMwM2RiZDFjOA	1542893618	\N
458	1	1	ZDc3OTNkNTI4OTQ0OWY4NTA5MDIwOWI5OTFmNzhhMDVhZTdhNDRmNjMzMzVkYmU1NjU3MzIwNjdmZjE4ZDlhMA	1542919556	\N
459	1	1	OTBjNjU3Zjg0ZGMwNjU2NTkzZjI2OGUzMTczNWI3OTdhZmRkOTJiYThjMDQ1OTZkYzc5YTEzM2M2ZmY5NTEyNA	1542923463	\N
460	1	1	NjFhYTcwYWYxYTQ2MTIyMTExODdjZDIyOTY1YWFiY2NiZWNkN2Q4ZmYzMmFmOTEzYzk5YzZjYWIxZDUxMGE4NA	1542981809	\N
461	1	1	YjMwNGQyMDAzMTE5ODI2ZTZkYTY3MWRjMWNkYTcwYjhiNjY2YzE5MmVkZTQyZTBmNTIxM2IxMjQyOTJjMWYyYQ	1542989277	\N
462	1	1	NzdkYzg1ZGI1YjhjYjRkYzdkODc2ODZiYmQwZWMwZjk4NWQwMDk2YmE4MzE1NjUxZjViOWNjNTcxYTVmODkxYg	1543009276	\N
463	1	1	OTBiNDQ2NzBkZDQyZWUyZGEyNWFjODlhMDA4NTc5MzY3YjJiMGIyYTYxN2RlMzQyMzc1ZDllMTVjMWNkMDAzZg	1543237157	\N
464	1	1	ZmFkMTMyYTY4ZWJkMDk1YmRjMTI0ODY0ZjkzNzQ4YTk1NDUzMGJiMjU5MmQ0OWRhMDAzNjQ4YzcwNDhjZDBmNQ	1543239320	\N
465	1	1	ZTRhODNjOWE0NjkyOTYyYmJjOTE4MWZiNmFlMWQ5MjM1OTgyNDBhYmQ5OGFlOWNjOWI2NzU5ZjkzODYzN2I4MA	1543242166	\N
466	1	1	NTJjNzg3MGZiMWUxMjgzMWFkM2M2ZmQxYjQyYzg3MDU4MmQ0MjE0YjIzMTU1YWJkMDU1YTQxNDJmYmZhMDM0ZQ	1543245776	\N
467	1	1	YTZjMmM4NjBjZDZmNGM1ZTc2NWZjMzMzMmNkM2FiMzZlZjJjZjlmZDhkN2NlMTMyNzZjNGY5ZTA3OTEyMDFkMA	1543259969	\N
468	1	1	OGNlODAyMDA4MDQ1NzYyNmY2MjQxYTlmOTc5Njk2ZGI2ZTY0ODllMWFiODFjN2I5N2YwZGQ3MDcwYzU2YWFkZg	1543264851	\N
469	1	1	OWYyYTJiYmVhYWMyZDE2ZTI4YzlkNTc4YjU4M2VjMDNkZjk3ZmRjODQ4ZTUwZGM3MmU4YTBkYTNiNTEwYmZhZA	1543268971	\N
470	1	1	ODJjYTk0OWE5ZGJkMGI1YmRkNzAwNjY3YmU4NGM1ZDhhNDYyY2M2NTVjYzE2MDFkMmY0NTkyM2JiZmJmYzgwNw	1543324673	\N
474	1	1	YmQ0NWRiMmYzODU5YmFjMWEwZWU5MTg1YWFlMjBjZTNkZTBhN2MxZTc5YTk1ODhkMDk4MDZlMmM1MjkxMDg1NQ	1543356259	\N
472	1	1	OGJiNWEwMTFjNTM4YTQ5YWVkZjgwNzUzOTkxYjcxYWIwMzE4M2ViNDBiYzJlNWNjZmIzMjk2NTc0MGQ5NTlhZA	1543356259	\N
473	1	1	MTg2NmM1YjMwYjMyODlhMzFmNGM2ODdmY2FkMjk0NTQ1ZGIwNDk5OGYyZTc5ODc1NWFiMzExODUzOTg0NzNmNg	1543356259	\N
471	1	1	ZDFhNTM0NDgyYjIxZGU1MmI5NDU2N2I5OGRjYmJmNGE4MWZiNzgwYzg5Y2M0MDc4ZDBiZjdiM2E3OTlhNDlhYQ	1543356259	\N
475	1	1	ZTJjNDM0ZmEzMjdhYzBjYjE2Y2VkODBjMzJkYzJmMTY1MGM4NjY2ZDc4MmM0Y2E1YzU1YmQxZWJjZDIyMjE0NQ	1543410002	\N
476	1	1	MmRiNTU2YTgzNmYzZThhYjZkZjEzOTgzMjgyMzdlMTEwYzQxZjYyOGI2NWQwMjFkYmQzMWNhMjRhMmVkYTUxNQ	1543435272	\N
477	1	1	MjQ1ZDA1NGU1ZWM5Mzg1MmQzYzk3NTMwY2FjYmI3NTRkOTc1ZTkyOGQ3MmI3NjdiNjY2NTU1MGE0YTMxMzE4Mg	1543518161	\N
478	1	1	ODdhNjAwMDIxYmU0ZGQ1ZjM4MTVkYmFjODg4Zjk1ZDBkM2U2N2FiZGU5ZTZlN2QxZmY2MDJjMGZkOWRiOWY1ZQ	1543519475	\N
479	1	1	MzY4OTk0M2Y3NGYxNjNiMWIxYTU2ZWFjNjcxNmQ1MTE5YmEyMjZhYTU5YTA0ZTlmZDNhYzlhOWUxNzUzYWZlOA	1543521619	\N
480	1	1	NzFkMDAwNzljNzdhNmE4MDM5MGNmMzAxNmZkYzVmMmRhYzcyZTNiODViYWY4MDM2MjU2NTdmNWFkYzY5ZjAyMw	1543523812	\N
481	1	1	N2FiOWU2M2UwMDllZDgxZDY3MDhkMWVlYmI5MzVmODY1YTM4ZTExNDMyMThiOGI5MjE3MWM1NjY0ZjhmYTFkMA	1543583565	\N
482	1	1	NmQ3Y2M3YTc0NzdlYTQwMTJmYjI0Yjk3ODI2YjY4OWQ2ZmJjZDhmYWE4YTVkYTQ5Yzk5MjJkN2ExOGFiZmI1MA	1543615669	\N
483	1	1	OTE5MGNlMzE5ODA3ZTgzZDA1ZTZlNWNlZDE3NDQ1NDQyMjIwYWUxYjAyOTRmZTQwMGU0MThlNmQ4OGVkNzhjYg	1543848971	\N
484	1	1	NzAwOWIxM2ViNTY1N2YxOTZiYTZjNGYzZmQ1ZGI1MDFiMmYxOThkZTVjZDNkOTBjZmZmNmQxMjJkNTIzNzdiOQ	1543867475	\N
485	1	1	NjNhNjE4NDU3ZjdlZWU1MmQ0MDJkZjFhZjA1NDAwMDFmN2ViMDFjYzVlMDQ1NjZkMDY1ZDA1NWNiZWE2NDMxYw	1543867475	\N
486	1	1	NDMyZGI2YWRiNTYxOWI5YmJhMWEzNDExN2M5YTcyNzcyNzVhZDU4NTMwMTllNmUzYjMzNTM1NDFlZWUwNWFmOQ	1543867479	\N
487	1	1	YjFkYTBlNjE1NDA3MmMzNzNlZTdhZTgzZWFiNTQ5YjdhZTZkZTRmMGFhNTJiNWIxMDU0ZTRjZWFjYjYyN2VkZg	1543938445	\N
488	1	1	NjE3YzZhMzEzMWEyOWIwY2QzMjA5YTVhMWM3ZGU0OTM0NzkyNjgwZDM0NDk1OTk2Nzg1ZGFjOGZjY2RjYzc0MQ	1543938446	\N
489	1	1	YzMxNzM4ODQzNzliMzA2MzBkODc1N2YwNTBlYjU5OTAyZjg4MmZiYzk5NDQ4MjgyYzk3Njg4NTNiMzBmOTExZg	1543938540	\N
490	1	1	YzU5NmQzYjM4NWZhY2MwZjFkZTY3MWU2OGZkYTVmMGI3YzFjMzcwMjg2ZDY5M2QxYjViMDBiZmY3YjAxOWY2Yg	1544015042	\N
491	1	1	YjU2ZTgwYWIwZWNlNmE1NjFkNjE3NTJlNmRjZGIxNmMzNjY4ODM2Y2RkMWQ5MjUwYmUzNjk1ZWYwYTE2MmQ3ZQ	1544034876	\N
492	1	1	NjAwZmNhMjAzZjk1OTczNjY0YzkzM2IyMjAxM2EwODE4YTRmNTZiYjMwNDczNmQzZGQyYWQxY2QyNmJhN2QwNA	1544036153	\N
493	1	1	N2EwYWZhMWRhYzQ5YTFhNzljY2YyYjY4MTU1ODFhNDZmMDkzYzM1Mzk1ZTk5MGE5NWQ1MDcyYmQ3Mzc2M2ViNA	1544036709	\N
494	1	1	MjQxYjc4MTYxNDRhNmIwZDYzMDBhMTBmNTI4YjM2YTY3OWZkY2RiNWQ2ZTAwMWRiZTNmYTVjYzhhYjkyOGJjMA	1544037217	\N
495	1	1	Njc5YjQ2MzQ2NjJkY2M3ODEyN2U5ZGMwMjVhOThiZjk2ODAwNTU0ZDlkYjlhYmJiMjE2NGUwZjVmZGY0MWFhNg	1544109378	\N
496	1	1	YjQ0NWY2MTAzNTEyZGZiMTI0YTdmNmFjYmUzY2JiZWU0NmZjODVmOTg1NTdkZjMyMDgwNmE1NThhMDk1NGQzNA	1544109378	\N
497	1	1	Yzg3Yzg5MDY4MWZlODdiYThhZTExOWQ5YTg1Mzc4ZDg0Njg3Mzg2YWI5NzAzNmJhMDQzNmIwZjY4ODI3Yzk4OA	1544112787	\N
498	1	1	YzJjOGVkYWY5OWMxZjlhM2MyODBiNTljN2I2NTVlZGQxOTgxYjI2OTNjNWNiZDEwMDVjNjM3NzU3YzAxNTc5Ng	1544122265	\N
499	1	1	ZTdkYjdlYzczZTYyYzQwNmI1ZjU5NzZjODUwNTZhYTc5OGRmMDQyODk3NmM0Njc4ZTEzM2FiNGUzYmZkMWVkMw	1544135627	\N
500	1	1	OWQ3NzEyNTQ5NWU2NDljNTA3ODljMDgyZjI2ODZkOTY5YmEwYTYzNGUyMGQ4MmFmZTcyYTlhYWNhN2ZkODAzNw	1545181412	\N
501	1	1	NGI3NmY4NGUyZDk3YTBiZTI0ZWJmMmFhZDhlNWUxZDc4Y2I5ZDFiZjhhMzdmN2NmZTFmMWM1YTZmMTBmZDBmMg	1545924776	\N
502	1	1	ZDU0OTAzMTIzNGY4MjlmMGY5NjdhOGViZGU5OTM5ODYzMjBhZmUzMGJjNjk0N2M2NDNmYzMwMGFkOTYwODQyYQ	1545924776	\N
\.


--
-- Name: oauth2_access_tokens_id_seq; Type: SEQUENCE SET; Schema: oauth; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_access_tokens_id_seq', 502, true);


--
-- Data for Name: oauth2_auth_codes; Type: TABLE DATA; Schema: oauth; Owner: postgres
--

COPY oauth2_auth_codes (id, client_id, user_id, token, redirect_uri, expires_at, scope) FROM stdin;
\.


--
-- Name: oauth2_auth_codes_id_seq; Type: SEQUENCE SET; Schema: oauth; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_auth_codes_id_seq', 1, false);


--
-- Data for Name: oauth2_clients; Type: TABLE DATA; Schema: oauth; Owner: postgres
--

COPY oauth2_clients (id, random_id, redirect_uris, secret, allowed_grant_types) FROM stdin;
1	3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4	a:0:{}	4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k	a:1:{i:0;s:8:"password";}
\.


--
-- Name: oauth2_clients_id_seq; Type: SEQUENCE SET; Schema: oauth; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_clients_id_seq', 1, false);


--
-- Data for Name: oauth2_refresh_tokens; Type: TABLE DATA; Schema: oauth; Owner: postgres
--

COPY oauth2_refresh_tokens (id, client_id, user_id, token, expires_at, scope) FROM stdin;
1	1	1	YzZkYjVjNTQxMjI0MGEwNWVkNTRiMWZlOGE0NmY4ZTM0NDVkODQwZTllOWFjZjhjOWIwMjljZmE0MGFmZDAxMA	1538061335	\N
2	1	1	MTczNmRlMDkxN2Q5MTM1MTk2YmI3MmFkNjI2ZjY4YjlmNzg0ZjVhNDY4MDg1NjVlZmRlMmRmNjY2YTBhZDM0NA	1538061550	\N
3	1	1	ZmY4NTVhNWQ1OGViZGVjNzc2OTU2NTIxNDMxNmIwNDJiYzRjYjU5NTUzNDk3NGE3NGY4OGVlNzNlMWM1NGY3MQ	1538062019	\N
4	1	1	MTI4N2E1N2EwNjM1MzM5ODM0Y2QyZTQ4NzM2MTc2NjRhYzQwODI3MjhkNTBhOTI0NGY2ODA3MDAzMzdlZjYzOQ	1538062054	\N
5	1	1	MjVhZGQ1NmY5ZGJmMGQyMDZhZDUxNDEwOTY4ZjE0ZDIxZjUyNjUzMWYwYjYxZmM1YjcwNjQ0OTgyNTUzZmFlOA	1538062059	\N
6	1	1	MTQ1OTE1MDg2NjAwZThhY2Y0MGUzZDRlZWJhNTMxMmU4MGVjYThmMDQ1YzY2ZWRhMGUwYzk0NTM0MGQ0YWNhMQ	1538062083	\N
7	1	1	NzFlMWY3YjM4MTc4YmYxOTc4OWM2ZmQzMTY0YTM2NDNlNDMzZTY4NjM2MGYxMGZiMjQ5YzFkZjc4NDNjOGJjYw	1538062133	\N
8	1	1	OGZjYWE3NDBhMDBkODU3Yzc3MmNkZjExMjdkMTY3MzdlZjNjODJlZmI3ODQ5MDkwZGM4MTdiN2EyZDI5ZTZmYg	1538062172	\N
9	1	1	YTkyMzQ0OWIzMDdkMWJkNGY1NGViNjcyZjZhNzg3ODVkNDMxZDRkYjQzOTk2OWFlMTE0ZjIxZTFjOWQ3YjcwYg	1538063129	\N
10	1	1	ZDliZjlkMjAyOGQwODg2NTc2YWNiN2VlMjAzMWQ4Yzg0NzQ5NDM1NWI5M2RhY2M3MmZkNGEyYzVmODhkMTliOQ	1538063162	\N
11	1	1	ZjQwYmZmNzFiNTUwYzJlOTdkZWU2NTE1NTE5ZjM5ZmNkNDlhZjE2ZDE4YjVmNmFlODFkZjNhNWUwZmE1YTk1NA	1538141945	\N
12	1	1	OWJlMGQ5MDJlNGI1Y2I5ODNmYWJiNmRkOWUwMjIxODhmOGFhNjNhNjIwZDkwMWE4MGU5NmQ0M2FmODliNDc4Mw	1538142549	\N
13	1	1	MDVlODZjNjUwMzEwOGI4NzQxYzE1NGZlZTA4YmZhYzhkMzQ4MDg0MDBmNjEyMzc3Zjg5NDNlMDBhMTVmMjRlMw	1538143796	\N
14	1	1	NDQwM2JlZDgyMTU5ZTExYzEwYWJmMjg0MDU2MzMzNWRhYTgwOTJkY2ZmOGYwZmEyNzViNThlMDY5ZDMxMDkzOQ	1538148476	\N
15	1	1	M2ExYzk4ZDRmYzRkY2UxNzFmZjEzMzE2NjM3M2M0NDdlNDc5YzgyOGEwNTZkNjI3Y2ExZTQ1YTliM2E4MjJhNg	1538152503	\N
16	1	1	YjMzYzJkOGI3ZmUyZGQwY2IzZTM0ZjkwNjU2N2VmYTRlNmNjYmI3M2IxZjE0NjFhN2YxMzA5N2FlMzE5NTgxMg	1538158554	\N
17	1	1	NzM5Njg3YTdlNDRlMDZmY2NmOGU2ZjhhY2I0YTdhYTBhOWZhZmE0OGMzOTRkOTViNWFjYjUwZGNmZDQyZTM1Ng	1538163077	\N
18	1	1	M2YxMWM2OGU1ZjcxMzNlOGIyZGE4YzFmN2M3NzBhYzA0MDQ4YmE3NThiN2NjYTAwMjY4MDM5MGNhZjYwN2Y0Mw	1538169265	\N
19	1	1	OTFkNjJkYzhkM2E2MzM1NTdkZWY2NWRhYjg4NWNiNjRlYjdmODkzY2YzMDVhZWVjNjZmMjlmZTBiNjFmNGYyNg	1538173940	\N
20	1	1	YTRlYTMzZjkyMGUwNjk2NmQ3NjExZDQzMjRlZDU3NmMzZWI0NDU4ZjFhZDRkNzcyZWY3ZjU3YWVmZTIwMTQ2Yw	1538173972	\N
21	1	1	NmY4MjdlMjFkNjZjN2FhMDBkYzZmYTM0YjBkM2E3NTdjZjZmYzI2NjYzNWY3NThjYTdkODQwNTU3M2IwNjViZg	1538398754	\N
22	1	1	OGNjYTlkNDk0NzVhMzBjMGFjYWExMjBjN2ZjMTQ3YWY1ZjA1YjlhZWE1ZjIxYWFlNjVmMDg4YjVlZTZjMWRlZQ	1538412743	\N
23	1	1	YTdjMDlhMzczZGI5N2U1MDE3MDYwZWNmYjYxYmE4ZjFiNWJjMDZlMzZiNWVjNWM1NDEyMjU3Zjk1ZDEwODk5Zg	1538418156	\N
24	1	1	ZTViYWM4NzM0OTg5NmNjNjM5OWZhODg4YTZjYmFkNDZkNzUyNmQyYjliMTAxMWQ4YTljODVlNzFlMDdhNWZhYg	1538419896	\N
25	1	1	MTQ3YmYxMzhlMzMwY2RmNWU2YjMxNmNkNDUzNDgyNmQ5N2M5MGRmNzRkZDYyZWJiZGQyZmFjZWYwM2Q3NzFhYg	1538420057	\N
26	1	1	YTExZTE3ZDJlY2ZjMDQ2MmM5NTE3YTNmNjU4ZmViNjBlZmE2NWEzMjQ0YTFmN2VkNWQ1NDNmZGI0MGZiMjJjYQ	1538420094	\N
27	1	1	ODg5YmUzMTg1NDYxNGI5ODY0Nzc1NWVkOTYzNDljYjdmNjMzMmU4ODgzYjgwYTFhZjY5YTQyN2U3N2JkZDk0ZA	1538420127	\N
28	1	1	ODU5NzRhYTE0NDJjNGJiMTU0Y2Q4NGMyYjU4MDc5MjkzNzdkYzUwM2YyM2I1ZGE3MzhjMDc0Y2M0OTZjYmZhYQ	1538420356	\N
29	1	1	ZWNkYmYzMDhlYmQ5ZTEzNmI1NDQ0NmM3YjhmNjBiZjU4MzBiYzUxYjQyNmY5NTE0OWFjNzNmMDAyN2YzNDUyMw	1538424041	\N
30	1	1	MGYxMmFhZTQ2OTVlN2JkNGUwYmU2MjdjMzdlY2NhYjc0NDZmYmEwNzBjN2JmNjc4NDVhY2JjNjUzMTYyZTZmNw	1538431046	\N
31	1	1	MzY5ZWFlZGRjNmI2ZTNlODc2Y2Y2ZTA1YTYyYWM3NTZmMDMwYTQ4NzMwM2IzNjYzMWQ5Y2JhZDU5NjQwYTZmMA	1538483874	\N
32	1	1	Njk5ODhlNThhODA5ZjZmNjhhOTM4ZDk2ZDM1Nzc0NWMyYWEyNWQ0MTZjNjYyYWMwMmZiM2JiYjBjN2MzNzA2OA	1538483899	\N
33	1	1	OGQxZTlmYTk3YzIzOTE3YjJmMWIzZjg1MjVjNTE1NmM1YmRhMDRmYmVlNzVmZmIyOTJhZjdhNjRiOTA0ZjE4Zg	1538483980	\N
34	1	1	YzkxZWFiMWJiZjM1NDAwN2E3MWMwMzg2Njk3YjI2ZDUwODZmNmNjMDU1YTAyZmEzZDIzOTI0OGRmOTczZmU5ZQ	1538484050	\N
35	1	1	ZGQ2ZTQ4MDUzY2U0NzY2YzUwMWQ4OWZhNGUyZTA1NDY2MTVlNThmMjAwY2M4MGZkMDIxNzU3YmYzYjQ1NmM1MA	1538484094	\N
36	1	1	MGVlNTk1ZGQ4YjllMmE2OGE1ZmY1NGU5Yjk5ZmQxOTMzMTExMzIwNGE5YzA0YTg4ZWRmMzIxOTk2N2RkYWZmMg	1538484145	\N
37	1	1	NTk1MDc0YzMwZjkwZjg5NjY4N2U0MjhjOTZhZDAzMGU5YTIxNDEzMGRmODM1OGM2MmE5MjkzMTFiNTliMmRlZA	1538484222	\N
38	1	1	YTlkYmU1ZWQxZDVhNjQyNWZhNGU0MThkMTQ1NGY1ZmMzNzc4Nzg2MTJkM2YzYzg4OGM2ZWQ3MDI5ZWE4YjkyMQ	1538491930	\N
39	1	1	MjQ5MDg1YTcyZTA5YjY2YjUzODVhZWQzYjJmZGFhNmEwNjE2OTYzNzYzZTM5NTlkYWZjZTI1OWI0NTc5OTNkMw	1538491979	\N
40	1	1	ZmUyOTg0MWU3NTQ3YWFmOTgxMzk0MjFiNTE2MjExNDY5Njk1OTgyNGM5NmJlMDAyOTA1MTFlOWJmYzA2NzdmZg	1538492014	\N
41	1	1	YWVhMzE4ODlhOTMwYTU4MDBkMWY4MDE3ODdkNmU0ODZkZWYwNDQ5ZWE5MjY5NmRmZjRiZjU3YzMyZTk4ZmUxOA	1538497788	\N
42	1	1	NGY0NGY5ZjRmMjE1MjI5NjEyMjdiNTY4ODZlMjUwOGI1ZTM2Njk2NTc0M2E3ODUxM2I1YzJlY2M5ZWY2MzZhNQ	1538503897	\N
43	1	1	YjVkZTJkYzRjODg4MmRjYWFhOGQ3NjBhMGI2MTkxNGM3N2RiNGYzMDM3NjU2MjBmMDkwNDliNWIzOTc1MjY3ZA	1538507847	\N
44	1	1	ZDliMDJlMjVhODMwM2NkNGFkZWI4YjM2NTgzNmVhZmM1YTAzZjVhOTY4N2FhMTVkNjg3NGJlZDYxNmMyZDQxOA	1538511108	\N
45	1	1	MTYxM2M0ZWVjYmRhNmVlMDhhYTc4Zjg3NDY5ZDY5ZDViZTE3NzI5YTMwYzYyOWJmNjZlY2EwYzU3MTc2NGQ5Mw	1538511176	\N
46	1	1	YTAxZTE4N2M0MDdlZTI0NjJhY2RlNjE5ZTcxM2FiNWUyYzM2MjY4MmU0ODdjNzdlNjljZTdlOTU4MWFkZDY4Nw	1538514051	\N
47	1	1	NTVhMjEyMGM1NjlkMjM2NThhYjJiMmM0OGFlYjZjNGQxMGZkZTFhMTVhNzY3M2FhM2ExNmYxMTJiZmRlNzMxOA	1538515588	\N
48	1	1	ZjlhZWU3NGFjYTI3MTYyNDM2ZTc0ODM3ZmY1ZGYyMjVkOGQ0M2MzMDQ5YzY5ZjExNTM1OTdmMGZjYWU0NmM1Yg	1538516321	\N
49	1	1	MTMzZGMxNTA5MzhjNzE4YmNhM2M5YWRmZTAwYmVhYmVjNGRhNWIxYmU0YjFmNjhiNDliODY3NjU3NWU2OWY3Zg	1538516422	\N
50	1	1	MTBlNGZiODc1MzIwNTU2Y2M2MDFkMmRkZGJmYzNlODRmNWY0NDUyZjRkNzM5NTU0MWY4Y2RlMWI5OTM5NmM5OQ	1538525827	\N
51	1	1	Y2E2NzM5ZTZkYWZjMjA1NDgzZTZiNTc4MDAxMzYyODllMjQ2NGVlOWVlZTJkNDBlNjc3NmM4Nzk5MDE1MzllZQ	1538526268	\N
52	1	1	NjBhNzQxYzJlNGFmYjc4ZGQ1NmMyZjBjYWY3YzJiOTRlZWJlNzU5NDU1NjViMjU5OTlmNjlmMWZjMTU0Njg1YQ	1538526632	\N
53	1	1	NWRiMWFjOTdjYWI0ZGI4MWFmZmRmOGI5NDYwMjdkMWE2NDY5YzIyNTU2MmQ4ZGFkMDM4YzVlODRmNGZiYWI4YQ	1538527182	\N
54	1	1	MDljZmVlMWExOWIwOWUyZGEzYmZiMjlkN2MwOTA5YjFjMjViZjAyYTA4MTZmYjUyZTkwODg2NGQyY2ZkNmQyMg	1538527273	\N
55	1	1	ODdmZDFmNzk5ZTNjYjU4OWU3ZDA4ZDE5ZDdlNzllNThjODkxZmIyYzQ2ZTZkNzUwZjIxNDRmNjk2OGU1ZTg4ZQ	1538527551	\N
56	1	1	OWE1ZDY1NWVkZjcyMDljMTkyMzdmZmFmYTllMzlhYjQ0MmI3NmViMzNiYWZiMjgyNDU2NWJlNDgzYWIyYTE1Zg	1538527746	\N
57	1	1	MmFiYTk3YmRiZmY1Y2YxN2VhMWZhNTJhNjNmZTk0ZjAzMjdkZWFlMjY1MTAyYWJkMDAwY2VlYWFhYzM2MjQ2Yw	1538527992	\N
58	1	1	NTgxMzRkM2YwMWRiMjA0OTlmZjIwYzY2ZDhjZWE1Njc3MTdkNDEwM2Y4ZTVmZjg1MGI4ODJlNzNmY2M3NTU0Zg	1538528286	\N
59	1	1	YThlYzc2Y2FmNmI0ZDIyN2FlMzIzMDZhNzg4MDVjOGJhMmFiZDMzYzRlMWFhMTFhMDQ2Y2YzZmRiNWY3YWJiNA	1538528526	\N
60	1	1	YzU0MGU5ODBjMjgzMmY3YzI2YTdjOTUzYTY5MTk1MjEwMDk1MjE3YzA3OTIxY2I1MDEyNjE3MDYyMDk5MzU1Mw	1538528949	\N
61	1	1	NzAzYWI5NDkzOTI1YzNiNTZmZTg4ZDQ0NDk5YTFhZGFjODE0NmZmMTJlZGY0YzliMDVmMzE0YzFhOWYzYjdlNg	1538529973	\N
62	1	1	MWJjZmU1MDVhYThhZDFmNjk0Y2FlYTI5NmI4MWM4Y2ZiOTQ2MzBjNTFjNDBjMDI1NmFiNGJjNTkxYTE4NDJlMQ	1538530285	\N
63	1	1	NDFlNDcxY2U5YjcyNTMyM2M0Zjc1ZDg2YWVmNTIyYTA4MzUxMzk3MzZhNDMwMWMyYTRhOGUxY2UxZTg4NmIzZQ	1538531056	\N
64	1	1	NWRlNjI5ZmY5MDFmMDkyZDdmMmFlZTAzZWZjOGQ3MjViZjk4ODZkNTRjYTA2ODBhNDBmODViMDZiYzNjYmE1ZQ	1538531157	\N
65	1	1	M2IyY2ZiOTAyODA0YTcwNjc4Y2VlZjY4MTkwZDJiOTY1NmIxOTMyZTVkNmZiOTllMzIxNzJmZTczMWU3YmE5Mg	1539525222	\N
66	1	1	ZjI4MmI4ZWZjNzZkOGQzNzgyNDQ0NDJmZjY0YTFhNDEwODdlYzY0N2YzNDdmZjFlNWUyZDBmMGY0MzYwNzI3Nw	1539527448	\N
67	1	1	MjVmYWQ4ODQ2Yzc1ZmQxZDNmYmE2YjYxNDFmNGJlNzM1ODkyY2NmZWNjMDdiOTA0MGYxYjExNDc4ZTQ4NDNlMA	1539527478	\N
68	1	1	Yzg0NTE4MzgwZmEzM2YwMTYwMTViMzk5YmIwZjczZjNlZDFmNGJlOTgxZDk0YzVlNWVjZTEyNzJlMThlZWZhYw	1539540015	\N
69	1	1	NWFlODI0MWQzZjIyNjI5YWIxNmJmYzk1ZDVkYjI2MGNlMWNjOGVmZWQ0YmM0ZjFjMDk4NGY0M2YzN2ZkMzUwMQ	1539551369	\N
70	1	1	MGQ4NmUxZjkyZjhkNzU1ZmI1ZGE1MmUwYzFjYmIxZGMzYWE2NjEzNGQ0NjE2OWZhY2ZiZGIyOWZkYWMwNjYwMw	1539567139	\N
71	1	1	Zjc0NTM3Zjc5YzVjYTI1MjZlN2ExOTBhOGVhY2ZjNGQ0YzNjYzkzYTY3MGRjYzhhMzUwZmQ1MzVhOWUzYzQ3Ng	1539567611	\N
72	1	1	MzcyODcyZjg4M2MwYjg0NGY5YTJiMDdmY2MyOGRhOTM0OGEzMjAyZjlmYWEwM2ZiZTBmOTA3MzU2OWEwMjgyZA	1539567889	\N
73	1	1	M2RjYzRjOGYxNjNhOTYxNDcxYWQ2ZTFiNmU5YWJhYmY5MDU3NzkzZDExNDM3ZDY5NjQwNjQ5MmEwYzQyZWRlYQ	1539569526	\N
74	1	1	ZTRkNjViM2U1N2FkYjc3NTVmNzI5MGM1NGZhYWJhNGU2Y2M2YmFhMmVlZjNiNjAzMGY1NDI2ZTBkODUzZTg4MA	1540429153	\N
75	1	1	N2U5ZTYzNjEwZWNlOTJhYTBmOTM1YzNmNDI4MDc0OWJiMjJiYjJiMTFkODIwMGM0N2JkM2MzMmE1OGY3MmJjYg	1540663173	\N
76	1	1	YTMyNzcwYjY3MDQyZGM4YmVjMDZiOTk4OGM0YzM3YjlmMTdmM2I5OGQ4Y2E0NDAxOWUxZWRjNTA2YzZmMjc5Yw	1540663371	\N
77	1	1	ODRjMjM5OTY5YTIzMzMzMDE0M2I1YTIyNTIzNTZjM2YzODdhOTQxNmQ0YmJhNDUxYjY0YWExZjI2ZTg0OGE5MA	1540665382	\N
78	1	1	YjE2MmE1OThhN2JlN2U5ZWQ5MDVjNDg1NDZhZWUxNzE4YTcxZGZiYWY5ZTA5MDlhNTllZDQ2ZGEwYzQ4NDc4MA	1540666186	\N
79	1	1	MDYyNWI5MjNiZTQwZDlkNTYxOTcwNDhiNzU2ZWM4Y2E0NDg1YmYwNjZlOTY4OWRjMjc4MzVmZjE4YzVlZmVkYQ	1540673037	\N
80	1	1	YmQ3MDM5NDRhMTAyMmYwMWVlNmM4OTdmYzMyNDc0MDdkYjVmYjc3ZmM5MzE4Njc1NDg3ZTA2Yzg2NjhjNTgxZA	1540678532	\N
81	1	1	MjVhODhhNDlkODg3NjRkMGM1OGVjOTQ5ZDc1OTgzNzdkYmVmMTYwMzc1OWExYWM5NTI1NmI3YTUwNzliNmI4Mw	1540680340	\N
82	1	1	N2ZkMjA4NWNjNzEyZDM0MzVjYjFiODQxNDI0OWQxNzA4ODI5YTY3NDkwMTJlMTM4NjhiNTBkM2FhMzZhODJlYw	1540681753	\N
83	1	1	NzY3NzMwMDM4NDJmNzc4MjBjOTA4YTA4MjI4MzAyZTFiMTRhMDdjNGVjYmQ3ZTk5NjEyYTUyMDdlOWJmODhjNw	1540681781	\N
84	1	1	MjhmZWJjMmJlNjc5MTk2YTU4NDcyYzUyZjJjNGNlMzc4YTBiM2FmYzRiMmE5OTU1NWQ5MTVkNjViYWYzNjk1Zg	1540681800	\N
85	1	1	NjQyOWZjMjQxNTk2MzM1MjUxMGFjMWZlM2QxMTQ4ZGMzODEyNjc3MDljNGUzMmMwZjExNmUwMmNlYWY0NmYzMg	1540681879	\N
86	1	1	OTcxYmQ1MDJmMjM2OThlZGI0NGM0MTVmZjJmNzExMjBlZTM2ZDc4YTg2NDg3YjUwMTFmM2ZhMzJiNmExMDdhZQ	1540682069	\N
87	1	1	ZGM0MzE4MGU4MDA1MjFiYWU2YWI4NmY0Mzc4MjJlNDA1YWJkMDE1ZTJiYTI2ZjAzNDRjNDc0MDdjN2JjODE0NA	1540682076	\N
88	1	1	OWRjMDYyM2QyZDYyMzRiZGVlYTE1MGE2NjhkMjk1Yzg4NmRkNWJiNDFiNGNkODc0ZjhhNDZkZWQyMzc5ZTEwMw	1540685455	\N
89	1	1	YzgzNTNlMWQ3NDU4ZDQ3NWUxODNjMTMyYmMwMzZhOGQxOWJhNmM2Y2UzM2FmMmRkOWJmNDhiODRlOGExYWQ1Ng	1540685480	\N
90	1	1	ZjY3OTBmNDQwNzQwNjkzNDI0YWVlM2Q3MTBmZThhMDRlMDczMGNkZWJlNjczOWNkZDAyYzMwMzA0OGE3OGM0NA	1540685720	\N
91	1	1	MGE1OGNiYzI0MTFmYjcyODQ1NmY1MDkxZjdmNjgzNmJiYWFkMWZhYjUwOTM0ZTZhNzA4NTliZTk5OGNmOGZjMA	1540685847	\N
92	1	1	OTI3MjQ4OTg0MzdhNGJjNDdlNzE0ZWRhN2JjZjIwNmMxYWYyOGI4OGYyMWI2ZDQwZmRkMjE1M2NlNzY2YzRkOQ	1540685868	\N
93	1	1	MWZhMTczZDE5Yzg4ZDJhMzEzODFiYjZmZjliNTJkZDE5NjhiYTZiZWViYmJlZTkxMjIxMGRjMWY4ZjRhMzE3Zg	1540686057	\N
94	1	1	YjY4YTJjNjQzODgwNTljNzJjOGU4YTkwOTZhODA5M2NlN2U5MTRkYWFmZTYyNDYxZmU3NzMyMDIzNTVmZjY4Ng	1540686121	\N
95	1	1	M2UxODMxODgzZDRkOTI5ZmIwZTUxMDI0NGJhOWNhMTkzNjk4NDAxMWFkOTAxMmRlYjNlODFiNDIzMmQyMDEwYw	1540686192	\N
96	1	1	ZWEzZWM1MmI4YjYyNGUzOTdhZTg0NjQ5ZWI3MTY5NjA1YjM5NTBlN2ZjNTdiYzg4MGVmMzBjMGZiNmVlNTc5ZQ	1540686241	\N
97	1	1	YzA3NGI0NjE4ZTdkN2EzN2JkNTc0ZWY5YTAzYzQzZWViMWEwZGI3NmIxY2NmYWRjNjZjOWUwNWE5ZDUxM2I5Yw	1540686421	\N
98	1	1	Y2FiZGU3YWIwMDBmN2QyYWRjYWQyMDg2NmVhZDdiZTdlOTVkMWM0NGFlZDkwZmVlOGMzNGY4ZDY2YzQ1ODYwZg	1540686922	\N
99	1	1	ZDA0NmZjOWI0MmFhMjIxNGRmMjMxZDI4YmJlMTA3NGUzZGFmYjEzYmFiMjI1ZjcxNjFiZWI0MzliYTRiZDRhMg	1540686981	\N
100	1	1	MDQ2NzQ5Yjc1MjIxZjQ5Mjk5NDE4OWJjYzhkNzJkODk0MWQ5YWQwYmM4ZWFkMzIxNzFkNmQwNWJhOTViZTBiZQ	1540688369	\N
101	1	1	M2FkYWQ0OTdkNzExZDE2NTk4ZTliNzZhM2IzZjljNThmMmE5YWU2NjgyOTVhNzJjYTVmOGEwMzJmN2ZkZjkxMw	1540688376	\N
102	1	1	MGUzOGVlNjZhYTBkMTgwNzk1Yjk2YzM2MzhjMjJiZWRhOGQ3NDk3Nzc5MTdiNGFlMmU5Y2M5N2M3Y2JkNjVkMg	1540688553	\N
103	1	1	ZTBiOWU2MDU2MGZjN2RmYWYwY2Y1NDAyOGRmY2JkNmNhMzJjNTI2NDcyYWRlNzFkYTU5YWI3ZGMzOWMyMDY4Ng	1540688786	\N
104	1	1	ODZmMGFkMGM5ZmUxM2IxMWY3ZmFiNzEzNTIzMmM5MDRhMmMxZTliMGZhYTAwNjI0Y2UyYzVlNzk3NmUyNWI3Ng	1540688797	\N
105	1	1	NjcxMjEwYTAwMmRiMzc4NmNlOTgwNjFlNmU2MjBhYmVhYjk4N2RhMTU5YWIxMmQ1NGFkODE5ZDJlYTRlNmU5NQ	1540689035	\N
106	1	1	YmI3YjhiMjAzMWQzZDY0NmNiN2Q2ODhjNzAwNmRhYmUwZDAwNjRkNzA3OWQ5NWJiMWQ3NTVlNTkzMzQ3M2YyZQ	1540689172	\N
107	1	1	YzVlY2YxNzkwYjgxNTNjZjY4ZWE5OGY4NWZmZTZmZDdhZjRmZjQ2OGE3OThkMmU3OWU1YzAyYjBlMmVmOTk3NQ	1540689186	\N
108	1	1	NTNhOTY0Nzk1YWIwNTE2MzRhZThjMzc1YjhmZTZmMmJmYzEwMjg1YTA0YmVlYWU0MGNjNjc4YjM1YTM2OTc0Yg	1540689232	\N
109	1	1	YTBiYjk2YmMyMTQ3ODMxNThiZDFkYzA1YWQ1OWJhMjk1NzI5NTZiOTA1MjNkMzczODVhZmUyNTUzMDRiYjkyOA	1540689540	\N
110	1	1	ZjdhMzY2NjM1NzQ5ZGFiNzJjMjI5MzY0NjA2NDA5NTNjNjExNTFhZjFlZTAyYTRmYzQ2MTJlYmMxNzBiNGIyZA	1540693480	\N
111	1	1	MDMxYzMyMGFjOGVjZjhkYWNiMWJkYTE5MTA2NzUwYWE3MmYxMDM0YTViMmNkMzQwNTVmZDBiYzJhODQzNDMyYw	1540693531	\N
112	1	1	NGU3OGNmZGRlZWJmMTMyYmM1ZGRkOTZhYmViYTExNjZkM2Q0MWExZWYzYzRjM2E0YmRjZmZjYWIyZDYzNGNmYQ	1540693703	\N
113	1	1	MmMxNjE3OWFmZWJlOWRlYWU0MzIxYzQwYWUzM2E1ZjFkOTFlMzVkYWY0OGZkZjVhN2FiODMzYzc1MTg0ZTBiMw	1540694192	\N
114	1	1	YTlkYmM4ZmM5ODI1ZDljNjBlYjFmNjQwNjNkNWZlMDRkNGJlMmRlYTQ3MWUwNGNlMTQyNDY0MWEyODNjMTRhMA	1540694244	\N
115	1	1	ZWQ1YTA2ODJhOWUwNWU4NjZjODdjZjE0NGZmMjZiNzRkYmNkZDk3MWMwOGRiMDIyZjRkMDUxMGVhMjA5MzE3Ng	1540733155	\N
116	1	1	YTY0OTAzMDNlNzE5MmZlOGU0ZTY2NmEzMTVkMTQxNzViM2ZkYzIwMDUwMzA1NGQzOGYxYjdmNjc3ODQ0NjBjNw	1540733814	\N
117	1	1	Mzk2ZWIzYzVmY2Q0MDY1NThjNDNmNTBiZTk1NWEzM2FhNGE1MmNiNjdhYjMzMjQyZmRmMDlkYTBiZmZlNDY0Mw	1540733852	\N
118	1	1	YTgwMGQ3OWYyNjBhMTg0MGRlODNjNjlhNGNkZWQ1ZTBkYWNkZGVjZjk1Y2M1ZWJkODFlYWFiOGMwZTYyMTAzMA	1540733860	\N
119	1	1	ZmIxOTRjN2JjNzVlZDlmZDE5NzQwMjkyMGM3ZWRmMjc3NWNjMjg5ZTllZGI4OWZjNGExNGFiYjYyOGNhZmI0Mg	1540733866	\N
120	1	1	ODI0YzFiZGRlNTFiM2ExMjU0ODA3MzZjMTY3ZjgxNDFhN2FiMmQzMTc0NWVkODVlYjg1NzQ3ZjJmZjU2NWZiNA	1540734153	\N
121	1	1	ZGY5ZDUzZGE3OWJhMGJlM2JiMDIzMjZmOWMwMGQ2ZjhlMWIzZjdmMzYyODk5NTcyZmE0NDhlNzJmNjUzNzljMw	1540734347	\N
122	1	1	MGM3ZjVlOWQzYjhlNzI3NTAwMzk1YTdlZWY0OGU5NjQ4Y2FjMGI1YTdmMzM2N2I3OTg1NzFmNzRhNTJkZjgxYg	1540734469	\N
123	1	1	YTQyZjk1MjcyM2NiN2NkOTY2M2JhMjUzZGUyZWYwOGFiOGQzODQyZWUzMjA1ODhkZDI3Y2U5ZmQxOGUwZjRmZg	1540734636	\N
124	1	1	YjIyOTZkOWFjYzQ0YWZjODA2MjVjOWY1OGVkMGQ4MDNjNGI0MDljNGEzZDA5MWU0YmQxNzM0ZGUxZDBjZjRlMg	1540734716	\N
125	1	1	YjJiYzA4OWU2N2FiMmJhYWQxYzdjMzJjZTExMWRhY2Y1YWRkMDA0NGMyOGRjMWNjMWRhYmZhNmY1MmQxZmE2YQ	1540734770	\N
126	1	1	ZTA3MjA2MWM5OGIxNWU3MWUwNmU0MWFlOGYwZDUyMTcyMjA5MDNmYTU4ZDBjMWRjYTQ5MjU3NTIyNmZmZjY1Mw	1540734781	\N
127	1	1	OTM2MGE0MzZiMjM0NzQ3ODRkNGRlNjg4OWUyYjJkM2ZhNzM0ZjY5MjUxNjk2MDcyOTMyOTZjNTRkNGM2OGE5Mg	1540734810	\N
128	1	1	ZmZlMmM3MTk0ZTZkOTIyM2U4OTYwZDEyZjEyMGQyNWUxYzAyNTFhMzU2ZDg1NWFhNjI2OGQzOWI4MDJjNjI2Yw	1540734815	\N
129	1	1	OWUwODVhNmJjOWQyY2NjYmQ1NTAyNDBlMDE1ZTcxMTk4M2RkNzU2MzJjNzA0ZWFmZmViNWM5NjRjOTlmYzFjMA	1540734955	\N
130	1	1	MTM1NjI1NjE0OGY0YjAyYWRjNTZiZDE2MjJhNDdlMjZmNTM5ODAwYzU3NWIzNmMyMjQ2ZGQxZTlkODg5ZDc3Nw	1540734976	\N
131	1	1	ODJiNWQ3ZDM4ZmRjNzBlNDBjY2E3MjdlNGVhNDMwZjRkMDUwZjk1MzQxNmI5ZGZlOTBkYjQyZjZjY2Q5YjE3MQ	1540735089	\N
132	1	1	MjBjNjcyMTdjMjJhYWI4ZjRjZDdhNmYyMjU2NzQwZGFlYWMwZDk3YmI1ZDMwN2ZlOTdlN2E2MTI3M2NmMzE2Ng	1540735283	\N
133	1	1	YjkwZGQ0MmQ0ZWExZjJiN2E2ZWJmNWQ5YjdkNzNjNGMxYmQ2N2E3OTM5MGY2MzRkN2JjNDlmYWI4OGQwYjQ1Yw	1540735344	\N
134	1	1	N2RkMmQ0MzJlNmU3YzU5OWUxNmU2MWFlZTkyZjZkOGRiMWNhNmQzMmIyYzkyODQ5Y2Y0NjA2NmNlOGU3ZjAwYw	1540735430	\N
135	1	1	OGUwNTc5MTFlM2ViZTlkOGFhODk2YjhmMDAwNjA5ZDYzNGRjYTU1NDE3ZjBkMGIwOTY0MTZjNWQ5MmY2ZGFjYg	1540735527	\N
136	1	1	ODVjYWI3MmRhMjA1MTUwNTA2YjA5NmFhZTkwNGY0MzkzZWVkOGQ2YjBmNmU4NDdlNDVjMmJiNTY5MzI2NjBjZA	1540735534	\N
137	1	1	NWZmMjVlZGE0MGUwNmFkNmY0ZTgyZWM2MjFkOGQ0MzEzYTEyODkyMDE4M2VkZTEzMWRhMmU4ODU3YjhhODA1MQ	1540736807	\N
138	1	1	MTRjN2MzYTgwZWVkNGY5NjU4OGQzYWY2MTJkNmVhM2IyMTc0OGE2OWQ2ODMzN2RmMTIzNWI4MDA3MzM1MzQ3Yg	1540736841	\N
139	1	1	YWM1ZTc3Y2MxNGQ3ZDAyYzAxY2UwZmNjOGRhNWVlNGQyMGIzZTliNzA1OWUxZTI5MjI2OTI5ZTAxZTI2NDk4Zg	1540736909	\N
140	1	1	ZDRkYzllZWU2YTI0OTczNWE1OGEwMTI4ZTk2NjIzM2Y0MDcwZjQ2NTE5NTMwMWFhZTY5OGQ4Mzk1YmY4NDI5Nw	1540737262	\N
141	1	1	YjNlZjQyY2UyNWI5N2YzYzc1MDUyZWM3Njg1ZDNhNmFkOWUwMGI2MjkwYmJmNjVkODliMDY1NWVhMThkMzYwNQ	1540766847	\N
142	1	1	MDViZTQwZmYxN2M5ODY4NjEyYjhmZTExZTJkODMxNDU3ZDdhNWI5NTUxNjgxY2Q2Njg2MDliYTlkN2RiYTUyYg	1540766987	\N
143	1	1	M2VhNTRiOWRiZTI1NzJiMmY2YzkxMDgyZWI0MWZhYjM3NDRkNjFkZTAwODlkMmQyNjdjZTNjZDdkYjJhNWE0NA	1540767964	\N
144	1	1	ZmI1ZjI2N2NmYTdjNGMwMzdiZTA3Y2JlNDExZWUwMTRkNzc3NDZlMDU2Y2Y2OGZlOTc2MjYxMjdiZDQyMjVkZQ	1540769794	\N
145	1	1	ZDBiY2VlNjMwYTdlOTg4ODI0ZmIzMmYzMTVkMjExM2FkNmZiNjMyOGE0NGI3NTAyMDg2ZjgxZDhkYTg4ODY3YQ	1540769844	\N
146	1	1	Y2E3ZWI1NDJhYTlhY2NlZDJmMjM0MmIxOGI2NjhkZjdjOTdkZmRmMGQyZDg0ZWI5YzdiNGQ4ZDUxMGJlOTA1Yw	1540771300	\N
147	1	1	MWUxYzY4NjQ1YjU0YjkyNGIzMWU5MjBlYzE0YzhjZmE5OWY3ZTJhMTUwMmFmN2JlMWVmZTU0Y2IzMGFiZDkyMw	1540773569	\N
148	1	1	YzYxZGJhMDg5YWYwMTNmNzJiNjM2YmExZDU3ZmVmZDdlN2I2YmI2ZWY4YWI3NTkyNzk0ODhkMmE2MTg0OGI5ZQ	1540781707	\N
149	1	1	YzRhYjgzNmI3N2U0NWQyZGUyY2ZhNTlkZDg3ZTcyODA1NDg5NzAxMjI2NDI4M2NkNzZiMjhiNjQ2YTZjYTY2Nw	1540782040	\N
150	1	1	ZmI5NTg3NjBlZDc4NTY4YWM0ZmUxNzY0ZWE3OTA4MjI1ZjdmMGNiNWYxN2EwMTUzNzYzMjU4ZDRjZTE4MjY1Yg	1540782121	\N
151	1	1	YmYxNWU4NmIwNzI2ODljZmZhM2MwN2UyYzQ3MTJiNjMyYWJiNTE1ZTMxMTlhOTg1YjAzMmE4ZDMzMDM2YWY5Mg	1540782519	\N
152	1	1	NDc3MWQ4MGNjMmJmZGYyMjU5YzRiZTBiMTQ4MTBmYTJmZGNiOGE3ZmFlZjFlNWIzZjY5YWM2NzFhYWQ4ZmE1Yw	1540782600	\N
153	1	1	OTM0Y2E2N2I2M2YwOWJhMGNlZmM0ZmY5MzMyOWMwMjFhNmY5ZjJkZWJjM2IyZjExNWI2OTk3NzhmNmJkNGE3Nw	1540783113	\N
154	1	1	ZjQyM2UzZDc5YTQyOWI2NzhkZDUzNzQ3ZGEwZjlmOGYxYWVhMTljYTFlZDJlNDgxZjkxNWY4OWQ2OTM4MWYzNw	1540783390	\N
155	1	1	MTgwY2EyZDE5OGU4MDgzNGNmN2M4YjMxZTYzOTRiYWVmOTZkNDg1NjQyNmYyMjdhNGE2NmI1ZGZmOGE3Zjc5Yg	1540783421	\N
156	1	1	ZGNjMTNiMmYzMGQxZWIxMGYxY2UxZTVjYzY3OGE5NjE2NTAyMmY0NTIxMDAwODIxNjY0MzI1MWNiZTQ5NTIzYg	1540783702	\N
157	1	1	OWVmZjkzZWIxMjVmNzEzZjcyOTVjYzJkZDZhOTc5NmNmYWEzMzU2MzZiYmY1NzBhYzYzZDgzOWNiMGQxNGNhZQ	1540783925	\N
158	1	1	YmM2NGVkYzUzODdiY2FjZWYyYWRmNDMxYjAwMmE4MWI4NWIxYjBiOGI1ZmE0ODk3ODA2MDQ3MGM1ZjAxM2MxMg	1540784788	\N
159	1	1	MjQ0Y2IxOWJlZjI1MGViYTQyYzMzMWE5Yzc2ZjA0ZWY4OGQ3NzI5MDllNTg3YzU1ZmQ5MDU2OTlmNTU2NGNlMg	1540786855	\N
160	1	1	ZTYyMWM1MzE4NDBlN2MzODM1OGEyOTQyYTAxZjhmNWZkMGY5ZWUzYjBmMTM5ZjM3MTc4NDBiMWViYmVlYjcxNQ	1541275383	\N
161	1	1	YjhkYTVkMTQ2N2UwZjliZDJiOWFmYzI1NWEyMWEzY2RlYTI2NmU5M2Q3M2QyZDM1Y2Q3YTEwZDVjMWRjOTA2MQ	1541276714	\N
162	1	1	MTQ4ZTFmZGE5YTZhNjhiYmNlN2NhOTNkYTk0NzkxOGQwNzJiNmQ5NWY5ZWU4NDkxZmJiNmU3NjE4NWYxNmMxMw	1541276806	\N
163	1	1	NWNmZDZkOTA4ZTc2YTdlZjA0ZjM5YTAxMTJhNmQyZGYwZjZmNGYzNDVhMmQ3ZTk1ZDliY2YyZjM4NGU4YzBiMw	1541276815	\N
164	1	1	NjkxOTkxYTE3YjBmZDE3NTk5MGJhOTUxNjExY2Q2ZTJiZjI5YjhmYmViN2ZlMjAxMTI1MDNlNTY3Y2UyNTAxNg	1541276828	\N
165	1	1	MjkxNDgyYmE3NWVhODQ1MDY2YzRjODUxZDFlYjJmOTQwZWJlOTliY2YxMWY5N2ZlODEyYjMwNDE2NzRjMjVlOQ	1541277154	\N
166	1	1	ZWM0NjBlZDNmMDg0Y2E1N2M2NGNhZDc4MmU5ODQ2YTA0OTE1MTY3ZGMxOWIwZjhhZjUwOWMwOTM3YWM0OTQ5OA	1541277222	\N
167	1	1	MTc5OTk4YTNjOTRmNjIyNzBkMjc5Zjg3Y2QyNTg0ZTU1NmExNWM1YjUzMmY0OTI3OWUwODBiYzY3ZWRlMzlmOQ	1541277506	\N
168	1	1	YzA4OGE2MmIzMDgxZDUwODM5MzlkMDY1MzQ1ZWFkODk3MzIyNDUyMjg5OGYyYWJiNjkwMGZlNDdlZTU3NmRkMg	1541277572	\N
169	1	1	MTQ1ZWMwOTE4ZTcxYjNhY2IxNWJiYzc2ZjFhYWZlMmFmMmU3NWVjZTU2NzNkMzEzZWEyNzUwMDJmNzg4NzNkMg	1541277778	\N
170	1	1	ZGJiMjU0ZTMwNDY2YzMwZjYzNTNhNDIyNjdjNTQzOWM1NTQ3OWFiYjlkMDcwYWY4NmJkMzUwYTRjMTI0MDdhMg	1541278281	\N
171	1	1	ZTNiMjNhYjdhZTRkMDE5ZmYyN2UzMzAxZWZkY2RhOTFkOGJlNjQxNzRhNTM3NzIxNTBlODNlZDQ5ZGQzMDE5ZQ	1541278479	\N
172	1	1	Y2RiZTZhZDcwNDQ3YzI2ZjRiMTllM2Q4NTM0YmRlNzMzMjAyZGQxZTc2MzZmOWFkMDQyOWUyNzM3Y2NmMjA1MQ	1541278492	\N
173	1	1	NzVkMjY2ZDk2Yjc3MGQ4ZTQ1ZWRhODA3NzlmMGNlNzdmM2VkOGU3MGE1NzM3OWQ1NDVkMWZlOWFhODJjMDkwNg	1541278525	\N
174	1	1	NTQ0NjBjZTBmY2RlNmFkZjUxOWFkMjg2M2ZhNDViZmM5M2VjZjExMTMzY2NhYTU3NTM4ZGFiMzNiNjJjOWYzMg	1541280778	\N
175	1	1	YjdkYWM4YzQ2MGE3OWE3YzA4NzVjOGY4YTNhNjIxYzFkMjAxODEyZDZhNDQ1NzQ5M2E4YjVmYmY0ZDU1ZDI5Ng	1541280814	\N
176	1	1	NjI5N2U0ZDI1ODBiZmRlMjNmYjU2NTE5NmVmODg3ZjE0NDE4YjYxYzRhZDMyOGM1ZmMxNGI1ODkxZmUzYzkzMA	1541280844	\N
177	1	1	MWM1MDM2NjIzYWE0NjIwY2Y1ZTQ5NWQ0ZWQ1ZjFhZDZiNDcwNGZkODg4NmQwYTAxMDUyYmU3ZjcyMjllMzM5ZA	1541280859	\N
178	1	1	ZGE2Zjg2YTYxZGVkMDQzYzYxNjE4YzhhMzg1OWM5NTAyZWE4ZGNjODAyN2JjY2NmYjIyNGM1YTY2NTAzMTg4ZA	1541280884	\N
179	1	1	Nzc3NTVjMDIyMjA3MjFmZjU0ODdmYWZkMjQxOTdjMDMwMjg4Mzc5ZWY4YzJhNjc5ZjMyYjhjNGRlOThlMTg5OQ	1541280948	\N
180	1	1	ZTMwMGRkYzkzNzE2NGNhOTc1NGVjZjhkZjhiZWM2MWM1MmUxZWUyMDkzNDRjNDY3MTVjZDdiNDU3ZDU4MGU0MA	1541280951	\N
181	1	1	NzE0OGM0YTE1NWQzYWU4M2Y2NTQyNzg4NTc1MWRiOGMxY2ZhY2JkNTNjNmJlOWQxMTZiYzQzODhkMzI3NDBmOA	1541280961	\N
182	1	1	MTI2YTM2MjMwOTY4Nzc4Y2E4MDg1Yjc2MzE0OWNiZWI1NDVjNjdmNTI3NmJlNTE3MDY1NjVhNDJmNTIyZDNlZQ	1541281008	\N
183	1	1	MTVhYThhMDQ0NjA4MjFmZWI1OGJhZTBlM2JmMWEzMWNlNzI5MjYwZTgxNWZiNjE3ZjU1NzA4MGRlYmM0OTI0Mw	1541281027	\N
184	1	1	NzM5ZGVmNjI5ODIzMzJmNTE4YzViNGRmYWY4MWUwZDUxM2YwNGRlMjQ3NjBjYWJjNTI3Yjk1ZWM4YjEzMzc3OA	1541281072	\N
185	1	1	OWQ3NWIwMzg2MDI2M2U4ODBiNzU5YmMwMjE1NTg2ZjkxODhjZTBiOWNkZjYzMWJiOTMyODc1NGI0ZDVlMTAyZg	1541281317	\N
186	1	1	Y2VlN2ViZThhYmM2ZThmYmQzODhlYjU5MTBhNDNlMjg2YTgzOTY5NGI1ZWNlNjdlOTljOGIyYWM2MDA4MTNlNA	1541281393	\N
187	1	1	ZjA1ZDI4NTk1ZTEwMjE3NzNmNTgwNDYxNjkwZGI3OTBkZjI0NTg0ODViMzA0MTNjMzUxYjI4OTkwMTg3N2Y4NA	1541281410	\N
188	1	1	YjAyYzY5ZDQ0MjI3NDc4MjhlY2Q5ZmQzZGM1NTBhMzJiYjc2NDU1NzhmZWFiMTA2YTlkNjA5M2VmMGRhZTQ5OA	1541281517	\N
189	1	1	OGY3MmIzYjJmNDRhYWYxY2M1MDUwMDJkM2EyYWUzMjhmN2I2ZTc1NmQxMmEyYzM4Nzg2YjNiMmFlYThjMDYwYw	1541281869	\N
190	1	1	ZjZlMzk0MDkyMTlkN2Y4NjZlOTYwMzVhOTRlZGJhOWY4ZDExYTQ3OTY1MzBlNWI1Njc1YjJiZjY4NzdhYmE5OQ	1541290103	\N
191	1	1	MGVmMjg0Mjc1MDhiMjAyZmIxYTgxY2UwYWUyNTZhNDQ5NGVmZjc2MjVmYTcxNjE3Nzg4NTEzZjlmYWYzMGE4Nw	1541290681	\N
192	1	1	Y2ZiYzIyMzI1MWE1NDZlNmExMjcxNDYyZWE4MjA1OGNmZTlkNjJjYTI4MWM5ZDk3ZmMyZDFlNWY2MzMxNGY3YQ	1541290719	\N
193	1	1	ZjY4MDI4ZGZkNDVmMDc1MDgyNzBjOGY4ZTQ3MmIxMWE2OTgxNjM5MDdjMDVhYjA3OTk0MDQzMTQxNzQwZGE1ZA	1541290800	\N
194	1	1	MWQ2ODg2NjA4MWFjYjQxYmUwOTM1NzA4NjE0MmVmNTViODllNDA3OWYxM2MzOGU0NzYyNWNjZjE0ODllMDA3Nw	1541290839	\N
195	1	1	MjBhMDM1OWJmMjUyYmIxNGY0YjcwNzA5Zjk2YmRhYjhiMjQwZDE2ZTE5NWUxNTA2MWViYjMxMGM1YTZjYWE2Mw	1541290952	\N
196	1	1	YjAwYzdmNzZhYmQ3MTM0MGM5ZjA3MzM3MGJhZWZhNDk2NzFjMzg5YTZjNDU0OGZmZTA4NmZiMzYyODBlNWY2OQ	1541290990	\N
197	1	1	NjdiMGM0N2U2NmM5YTNlYzk5ZWZhMDgzYzhkYzIxNGY1NmI3MDRhY2JkNjlhZjI4NGM0ODBmZmFlOTVhMTBkMg	1541291352	\N
198	1	1	ZTBkNzcxM2M3NDVhYTE3Mzk5MDhhNGJiODdhM2MwMjBlMWRjNTdhNTZiYzJkNjkzZWUzMmM2ZDEzMzhhMjNiNw	1541291359	\N
199	1	1	ZDM0MDI0ZjRmOGRlNTQ4MGVmNGE2ZTI0MzUyNzJjMDAwY2UyMjcxNmQwMThiYmIyOTg5M2U3NGU0Y2QwYjk5Ng	1541291378	\N
200	1	1	ZmUwYTRjY2QyNGFmZDUyYjE5ZTc0NTE2OGFlYzc2NmY4YjYyZWU1YTA2MWQ3YzliZGY3MDZkODkyZTJjYTYyNg	1541291384	\N
201	1	1	YjIxZjAwNzkwNzRmNDY2N2MxMDQxOGE2ZjA4NThmZDcxYWI4NDVkYTcwY2Q3ZjI3YzVmNzNjMzdkNWMyNzAzYg	1541291413	\N
202	1	1	NWYyMGFmNzc0OTA1NzI5ZGFjOWE2YTA5OWIwOTZkYmZlNGRlODAzNTE0YTRiNjY0NzA0NzE5ODAxMTU5NzNiMw	1541293101	\N
203	1	1	ZmI0YjhhM2M0ZGZjOGYzOTRiM2U3MzY0ZjNlYjg1Yzc0YjVhNTJmNTU3YTAwMWYzM2FhYmJjODg0MjYwYzZiOQ	1541293159	\N
204	1	1	MjQzYjVkYzY3Yjk0MjBmYmIyMjQxODkwZTFiOTEyOTIyZThmODEwODdkN2NiNWZkZTRlZTg2Mjc4NzUyMDE5Yw	1541293509	\N
205	1	1	OGM0MTM4YjMxMDc5YzBjMDVhYzMzNzY1MjVmOWU5MDEyNzQxOGU2MzczMDVmMWIxNjliYzU1NTA4Yjg3ODdjZQ	1541293621	\N
206	1	1	NWEzN2NmMTU5YTNjY2IxN2I2ZDhhMzI5YmM2MDVmMDhmOTI1ZmRmY2UzY2U3NDc3NmZlOWM2MGE2Nzg1ZDM0NQ	1541293678	\N
207	1	1	NGFiYTZmYmUwYTk3MjUxM2NjZWZmMWU3YjI1ZjdlY2VhYThjMTA0MzhlYzI5ZWFhMTMzZTRjMDBiMTk4NjE4Yg	1541293697	\N
208	1	1	YTYzMmU3YmM4ZjUwYzI5YzI4M2M2MDNiZGNkOTYwZWU1MjExNjE4NDNlYjgwNTlkYmE0M2U4ZTliOTU1ZDczMg	1541293716	\N
209	1	1	ZjNmNjY4YWI5Yjc5NzZmMzljZjcwOWU1OTUyNThkMTMyZDJkMjQwYmNlNTM1OGMxMzZkYzk3M2I5MjJkMDA4ZA	1541293858	\N
210	1	1	NTI5NzdkYzJlODIxOTMyMDBmNGQyOTM3Y2MzMjRlYTBmNDM2ZGNhZDllYzg1ZmE0OGZjNWI2NjFmNjczNGI3OA	1541293867	\N
211	1	1	MmU4YzBjZDYwODk5ZGNhOTRmZDU2NWI1ZDYwNTg3N2EyMjgzNDFiMWIzNWViYTk1MzI0N2UzOTA0ZjUyYjQ2Nw	1541295064	\N
212	1	1	N2VjYmE2MzQyODVkZDg5YzE5YzIzOTJkZTBjM2UwNzRjNGZjMDY2YThhZmYzYjRiYTdjYzQzNGIyMzJkYjBkMQ	1541295134	\N
213	1	1	ZDMxMGY2ZmI0M2YwNTU3MGY1YTNjMzM1ZTQ2YjA2MzU2NDRlMDdjNjAzYzVhYTZhODU4NDFlM2Y4YTJlMjdjOQ	1541295273	\N
214	1	1	YzE4ZGZjMDcxMGIxY2UxNjhhMTEwZDk5MmM2OGYwMGZmMWY4Y2VlYjI1NmJlZTUyYzY3NWMxZTA2YjFkNzdlNQ	1541295298	\N
215	1	1	ZTg2YzFiYjllM2JiYjIzNjViZmNjMWYwNjdjYTg3OTg5YTllOWI5MWY3OWU1NzdkZTE0NDE5MjM4MWUwMjJmNQ	1541295427	\N
216	1	1	MzFjZTczM2E0YTVlNWU1Y2YxM2Q1YWFjNmVmYTZkYWMyNDZjZWIwNTZlYTVmOTRlZWE2ODU5N2NlYjAxMDQzYg	1541295436	\N
217	1	1	MmQyMGY2MTBiMGQyYjYxNGZlMDVjNmVjMDVmYWMwZDA0YTZlNzViZDU3OGFhMmZkNWJjYjM4NTQwMzIyYjU3MQ	1541295449	\N
218	1	1	NjM3NWIyYWE2N2ZjN2M2MjJjYTQ1NzBhNmEzYTU4OTAyNDZhNTYxZDFhY2MzMjMwYzI4NGYxNTE5OTlhYTcxYg	1541295478	\N
219	1	1	Njc0OWY0MDdhNTg5Njg1Y2Q4YmU3NmU0Y2YwZmVmYTQ4ZjkwZGFhZmE3YTBlN2U3ZmVhYjVkMmMzZmQ5YmM5YQ	1541295650	\N
220	1	1	MjRjN2EyMjY5ZjQxOTJmMjQyNmU0MGRiZjI4NTNmNmM4OWI0MThiOGFkNmRlMjg2YmQ1N2NmMGNlNDRiYTBkMQ	1541295680	\N
221	1	1	NDRkNGQxNDQ2ZDVmOTUzMGMwNWQ4NWQyOWMzN2FmYWVmZmUyMmI4NTIzMTkwNTg5NTM2MDc4YTFjZmZhNzA1ZQ	1541295741	\N
222	1	1	MDI0M2ZhMTJhYmRjYWU2MDZhZWQzYjQzYWU5Y2U4NzVjNjY1M2U5ZjBkM2ZhY2MwMjJkMjVhMDdmZTNkNjA0Yw	1541295779	\N
223	1	1	YWIwZGFmN2FiOGJhMzBkY2RlYzAyYzJjM2FlZGU4ODM4NGZjNjM0NmMxNmQyZTI3Yzc4YWMzMzE0NDZjZWMwNQ	1541295931	\N
224	1	1	Mzg2MzJjNjY0ZTcyOGM4ZGJhNTYxODJmYjY0MzA2MmYyZThlN2ZlZDgyMjA3YTc3YzI4MDhhZmUwNTM0ZWU0Mw	1541296138	\N
225	1	1	NjE3YTUwYjJhMmFmYjEyNjgyOTkzYzdlNGJkZWUyOGIzOTIyY2RmMmM2NWE5NzRkY2E1YjMxNDg0NTE4ODc4MQ	1541296183	\N
226	1	1	YWZlNzk2ZjUyYTE2ODkwYmY5NzViZWIyYjliYTYzNWNmYzRkMjg3MjQ1YWJjM2ExYTRhMmY1NjVkZjE1MTVjMg	1541297730	\N
227	1	1	MTZmMGVkOTQ3NmQyZTcxMmM2YmY3MmI2NDkyYmI0NmMwOGE1MzY5ZjBlZDgwNzVlNzM2ODZhMTljZmRlYjRiYQ	1541297757	\N
228	1	1	MmE4YWU0NjQ0MDBkZmVhYWU3OGM2ZjVjNjM4YzdjMDJjYjdhNmJlOTkxYTc3YmQ4NmQwMTAwMGQ3OTk5ZmYwMg	1541298143	\N
229	1	1	MDYzZjY1NGI4ZWI5ZWRiYzVhZjRiOGQxOWIyMzE3OTUxMGQwMDljODg5YjczN2I0ZmQxMjVjMjBkZmUyMzQ0Yg	1541298224	\N
230	1	1	NjVlNWNkYjJmNzJhZDI0YWJkM2ViYTgyOWNhYTBjNjI3ZDkyYWRhZGRhZTkzNjdjODAxY2EwOWI0NTg4M2EwZQ	1541298235	\N
231	1	1	ODgwNzcxMzcxNjdiY2ZkNzgzMDNkYTg5NDBmYTVjYjY4NmYyZDNjOTA3ZGRiYTY1NjdmNzAxZGYwZjY2YjI2OA	1541298249	\N
232	1	1	YjI5MjJhYTgwNTE2OWYwMDlkMjQ5MmUyZjhiODRiNjhlYTZlNjllOWY2ZjZjZTk5YTE3OGFhMGUyOWRiYTQ3MA	1541298458	\N
233	1	1	ZTU3YmNhMTNmMjlkMTc0MDYwOTVjOTI1MzcyNmIxODBiZmJlZmU3NWJmYTNlOWFlNThhYTZkMGUxYmIwYWYwNg	1541299234	\N
234	1	1	MWY0M2NiN2JmYTk5MzE0OGZhZjIxMGJlODA1YzBjYTIwM2Q4YjEzYzIzMjM5NzI4YjdiYjg4NTgzMzc1ZTY4ZA	1541299486	\N
235	1	1	ODRhMzkxOWZmYWVhOTk0YmUyYTVhOWE0NWM5MzBmMjcyZTk2MzdjODMxM2M4N2JkNjBlZGU0OTVjMjU0NTU2Mw	1541299658	\N
236	1	1	NzU5OWNhOWY3OGFlZTQwMDA5Y2I4MGVlZGM3NjhlMmQ0ZTI3NjE1NDkwOGJkZDljMTUxYzYxNDc3YzVlN2ZhNA	1541299670	\N
237	1	1	M2JiMzcyODYwODUxMjFhNGFmODNlMGFjMDRlN2EwNzI4NTQyODcyNTg2Yzk1Y2FmNTUwN2I0NDg4NjgzYjZkNQ	1541300466	\N
238	1	1	M2RlNjhkOGIxMDI0YzYyNWMyZjkyMWNiNDUyNmMxZjQyMmFlZWE0NTA2ODkyODkxMzJkODYzMmFiNDA1YTc4MA	1541300487	\N
239	1	1	MGNkNmU3Yjk1Yjg2YWYyYjIyODM3ZWY1M2ExNDUzYmRjZWM2ZDc3NjY5ZDBhM2IwNTYzZTE5YWQ5NjVlYzk3MA	1541300507	\N
240	1	1	ZWM2YzI5MjQzOGViZmQwZTlmNTFjZGUxYmI5MzhlODQyODgxZWU1NTZlMjgxNjI0NjhlNTZjNzM3ZTJmMGUzZg	1541300535	\N
241	1	1	MGY5ZGIwZWRkYWIxOWMwMDczOGExYzJkZTQwNDg0Mzc2ODg5MDkyMGJjYzhjNmYyOWZmMDU3OWVkNzY4YWI0NA	1541301309	\N
242	1	1	MzgxMDA0ODNkMzE4ZGE4ZjIxYTViYzU0ZDgxZmFkYmIzYjNlYTE4Yjg4Y2FjZjZmZjgwZTZmNmY2NzQ0ZTRiNg	1541301399	\N
243	1	1	MjM3OTM1YmM1ODJlYmI2MDNmMTQyYmJkMTJmOGMwYTNlODdiMzliOGU2NmU5NThjM2U1NmNmZGExMDRlM2EyMw	1541301515	\N
244	1	1	OGNmODVmNmUwOWFlZWNiMzZmN2YxYmFiODZlNjQ2YTI4NzI4MmY4YTgzZTI5YzkzYjc3ZTcyMmM4N2Y2NTczNQ	1541302714	\N
245	1	1	NTI0YzFlZTBlMjNmMTdiODRhZjY0ZTM2ZmYyM2MxMzhhODEzMmQ0YjBmOWJlNzU0NWFkMDZkNmE3MWU0YTMxZQ	1541302847	\N
246	1	1	YTkyNzRmNjNmMDdiYWYwN2UxMjNlNTQyNGRhNTQ2ZWVkNjM4MmUxMjlhMDI1YTg1NzZhZDA3ODc0MzgyOWM3Yw	1541302927	\N
247	1	1	MWRjNzY1Y2QyZTk2NGViNDYwOGU5ZGYwN2FiYzUzYzlkYzJkNGU2MTZjMDczY2I0NDY5NGYzN2EzMGZhMDQ0MA	1541303004	\N
248	1	1	ZDU2MjMxNmNkYTdhMmQ4NzFlMzVkZjE2ZDQ1ZGE4NWU4MzM0N2JmN2QyMjU4YmFhY2YyY2JlYWZiNjA4OGFmZg	1541303177	\N
249	1	1	N2Q1ZGNlOWE3MWU2YmM5MGQxMjUzNTY5NGI5OWY2Yjk3NDBiZjVkMDdkYzU4OGViNDc1MDllZThlOTYwZmY3ZA	1541303181	\N
250	1	1	ZTEzNDZiMTdkMWFkMTcxZDdiNjE2NzQ0M2ZmZjQwMzA1MjY1ZTU2OTJhM2VkMjg1NGE2ODFlZDljMmYwYWMyZQ	1541303304	\N
251	1	1	ZmMzMzEyMzMxZTU0ZjUwZDk3ZDExZTA4NTg1MDBlZjg0NGU5MmU4MjFhNTBiMTA2ZTg2Nzk2ZTViMjZhYTRhYw	1541303383	\N
252	1	1	N2FiNzIwZjg5YWNkNjA2MWNlNjFkYTU0ZTQ0YWVmYzY1MTRiYjRiYmI0OTNhYmY2MjZiODBjNTExNDViODYwZg	1541303410	\N
253	1	1	NGQ3NDE4ZjdkMzhhZGM1ZWQ5MjVjNDI0ZWZiMzM4NGI5NTg3YjI1MTIwOGY1Y2ZiNjYzMTA1M2EyMjEzYmM3MA	1541303445	\N
254	1	1	YjNiZjNlODBhZmE2ZGJlOTY3OTIwYjAzMjU2MjA3ZGVlMzMyM2UyN2IzNDRkMmQyNWFkOGI0ODZmYmNkODI1MQ	1541303448	\N
255	1	1	MjBkNGMxYzU4ODEzYmY5MWEyNjhkMjYxYmNlODVlMTE4ZmZiMDQ2OWRiNjFmM2I1MzNhZTY3YjYwMDVhNGY0Nw	1541303503	\N
256	1	1	MTg1ZjgzZGM3ODU1OTRjMzkyMzA4NDRhMjBjNTI5NTRhNzNkYTY3NzJiYjA2ZmRhMWE2ZWMwNGRmMTgyNTU0YQ	1541303586	\N
257	1	1	YWY2ODNjZGE2MmY0YWYyYjYxOTE4NWQ0MzgyYWFjZTc0MjkyMTEyYmI0NDkzMzE0MTAwODAxNGQyYTg4MzRiYw	1541303643	\N
258	1	1	YmRmM2M0Y2FlZDM0MWUwZWJlM2I5ZGNjYzY4NDY2MzQ3NWVkMTc1NTUxYmMzNzNiNGVhYmFiZTBlNGUyMGVmOQ	1541303673	\N
259	1	1	MzE0OWU3OGUyZGM4OTJiODJhYzBkN2Q5M2I5ODc4YmMzNDU3ZDQ3M2MxODdlMGRjODJjNzBiZGM0N2NmNzNjMA	1541303754	\N
260	1	1	YmQyMDgwMjU1MmM2MTJhMWE5ZTdlYTQ2NjI1YjQ5ZDBkOGE4ODA0ZTg0NDE0OTg2MmZkYzhiNTBhNWUwNmNmZA	1541303779	\N
261	1	1	YWQyM2Q0ZTFiODdkMGYyZWM5NWI2MDU1ODIwODQ4OTNmMGMwZDEzNGI3Y2ViMjdkYWJkMjc0ZGZjNTI3MTY0NA	1541303906	\N
262	1	1	YTg3MGI5NGViNTQ2ZWE0ODU1MmVhYTQ0YjY2OGNlY2E1NzE1NTIxOGYwMTc4MDVmODhkMjgwMjIzNjU2NDdlNw	1541303920	\N
263	1	1	ODg1ZWNiY2NiN2IwNDY3MDNiY2VmM2Q4MDA4M2FjMTkyZmQyYmJmOTRkNDRhOTE3ZjcwMDQ4MzY2YWNiMzMzNw	1541304497	\N
264	1	1	ODAwNTIzNGIyNWU0NTBhYzVkNjRjYzY3YzkzMGM3YWYxNWJjZDk0NzAzYTFmMDRhOTI3YjJhYjRiNTljMzIxOQ	1541304509	\N
265	1	1	MTdiMGE2YjE5OTAzNTdiZWE4OWE3OWU0NjFlNDkxYjMyY2U2ZWJhMmFiNjEzZTRlZDhlMDE1MTE5MjY3YzIyNw	1541344525	\N
266	1	1	NjlmNDQ1NDU1MTc1ODBjYThhMjllZGM3Y2FhNWZjZGYyZTNhY2QyOTJiOThjMTA1Mjk2OWJjNDcwNTRlOWI3MA	1541344573	\N
267	1	1	NDY4N2Q1MWM2NjM4NGY4M2U4ZDFlNTdiY2JjMGFhZTM0YjJmNGJjZGM2OTA3MWIwOWQ5ZDUwMWE1MGUzYjdiYw	1541344604	\N
268	1	1	NWEyMzg0NjEwZGMxOWFkYTYyMzg4NWRhNGUwYWYyNDhkNTQ5NjM4YjkzZTYzZTRiNjAyMDA4OGI4ZTQ5ZmZmZQ	1541344766	\N
269	1	1	ZDBkMTIyMWM4OTAwODE1MDM2ZTZhYmJhZjJmN2Q1MWVlMWI1YmJjYmVjMjY2YTE5MDZiNGIyZDQ3YjkyZDY3OQ	1541345000	\N
270	1	1	N2ZiMzU4NmRlNjdjMjAyOGU5ZWQ0MDMyZTk5MjE5NGQ2NTg4ODc0ZDM5NWJhNzQyMWU3MjExNjI2MmM0YzEwMQ	1541345344	\N
271	1	1	YzJhMjJkOTUwYzhkMThhZjMzN2YwMDFiOTZjZTVlMzhjY2Q1NDVmMGIwNDc0MWQ5ZDQzMjFlYTJkMzkzZTk5Ng	1541345382	\N
272	1	1	ODY2NDNkY2Y4NTU4ZmZhOThhOTYyYTk2YTU0MmRhYTZmOTIyM2VjYzU2Yzk4ZTdhYzc2Y2ZmZDQ4Mzc4NTEwMQ	1541345440	\N
273	1	1	ZDdhNDM4NjcyZWNiZTQyZDExMjAxMmJlNzJmZGFkYzk1OTA3MzEzODA5NmNmOGU1ODY0MDQzYTE4MDVlZDY3MA	1541345532	\N
274	1	1	YWUxMzZkYjBlNDcwMTY4NTkzY2IzMjUyN2Y1ZThjNDc2M2UyNjAwYzFhMDhjMjVmZThmZDBjMDk2ZTE5MTg0Ng	1541345532	\N
275	1	1	ODZlMjZkNWM3OGIxOWE3Y2Q1N2Q3YWE1OTljYTE4MzdjZmYwMzQzMWUzZDJhYTU4NTRiYzU4MTMxZjgwYTA5OQ	1541345542	\N
276	1	1	YzU2MTVjOGIwMDVkZTY2YzA5Njk1OWQyY2YwOTg5OGE3Zjc2YzQyM2ViZGI0OTdhNGM0N2Y0MDNhY2Q1ZTk2MQ	1541345585	\N
277	1	1	YWViNDljOTA1NzliZWE4ODhmZGQ1MjgzNTc2NmU1YjRlMjMwZDZlNmM0ODNhZTBkZGM3YjViODMwNzAwYTE4MA	1541345922	\N
278	1	1	YzgwMDNlNmViZTkzNGQzZWIwMjhjMDc4YzBiMDZkY2E1NDIwZTE5NDVkYjYyZTdhMTUxOTVmYTgxYjI1MzVlNg	1541345950	\N
279	1	1	N2QzYjc5ZDljOGZkMzkwYTk3OTU0MzkzNjlkZWI1NzI2NDQxOTUyMTBiYjZhZTAxMGYzNDQ2ODc2ODc2MjljOA	1541346054	\N
280	1	1	YzVhMjZjMGE3YTZkNTc0MDdjMzNiMDIyMTMzNjBiZDU2MjgwZmJhZDJhNzZlYWZlMmQ5ZjgyOTdhNzVhYTM3MA	1541346064	\N
281	1	1	MzhiMjBjNDgxOTI3YTIwZGZiMjg2YjUzNDJiZDRmZTIwN2I3NTBmMDQ3NDJkYjI2ODc5OTU0ZDllZGEzZmFlMw	1541346446	\N
282	1	1	YzA1M2RjOGViYzAxYjAwNTAyMGIzY2ZjMjM4MGM2MzRhYmY0MjZlNzcwYThiMjc1MjIxZmM0YzMxNjU5ZGZhOA	1541346674	\N
283	1	1	MGI3OWRlZjMyODhiYTM3YzdhMjY1ZmU5MWM0MTU5ODNhYmQ1ZDIzOGJiNDNkNDFkZTFkZTIwMjk0OGFkMDUwYg	1541346778	\N
284	1	1	NWU2ZjRiMTZkMTNjNmMyMzcyNjNhZTgzMzQxNDg5OGJiNDI2NzRkYzdiZmU0YWEwYWJhMmVlNzdmMTFmYTE0Mg	1541346800	\N
285	1	1	MTdiOTFiZjI2ZThhNTI4NjQ1M2VkNzNkZTc3MWIyZjRhMWYwYjY1ZDgwZmRjM2ZlOWE4MGJjZWFmYzI5N2Y3Yg	1541346818	\N
286	1	1	MGY0MzFlYWU3M2NkYWY1NjEwNDJmYWZmODJkN2RmNmUzNDczZDgzZmJmODZmYjE3NDE1ZGIwZGM3MDg4YTg3Zg	1541346845	\N
287	1	1	ZWNmY2NmZmQ4YjdkZjlmODA5MTRjZGYwMWVmOGVkZWM1MjcyN2YzNGNiZGYyMzYyZTQ1NTgxYzQ4Njk3ODRhOA	1541346931	\N
288	1	1	YjdkMDhhZGE2YWUzYTIzOTNhZDhmMjNiYWM4ODU2ZTRiYWYwODg4NTMyYzcxMjhkNjg5ZWVkZGUwNmI3OWJmMQ	1541347001	\N
289	1	1	NDc3NzFhMmY3NzFlNmRlNzcyMDJiODM0YzNjNjVkOGU1OWEwNWM4MDYxNTE1NjkyMWU2YzlkNzUwNTViMGQ2Ng	1541347017	\N
290	1	1	MmQzMWM2YTQzODU0ZTQzMTcxMTRjZmNjZTU2YjVhODNjODMyMjdlMjg1ZDdhODVmMmFkZGE4NTkxMzFhZjZjYg	1541347116	\N
291	1	1	M2QxZjQ3OTFjYTViYTMyMjNjMjM3YTBhNDM5ZDE0OTAxNDQ4OWQ1YzY3N2EyZGQzNzUxN2U3ZjI4YTdkN2JiMw	1541347176	\N
292	1	1	MTFlNmI3Y2E1MWIwZWJhNmY1MTcyNTkyZTMzNjQ2ZDBlZGJjYmE5ZjUxNDk4ZTQzMjk0OGM4MDBiNTkxZGNjYw	1541347191	\N
293	1	1	ZmM0ZTVjNjg5ZjM0NzcwN2Q5ZDg3YjU2ZDA5MzhhMDJlOTJiYjMxNjdmNTg1M2VhNDI4YzQ0ZWMwMWM4MTQ1MQ	1541347197	\N
294	1	1	NTEwNDE4MDc0NTdmODhkNTIxNDk5YmRlYmQzZjJkNDRjY2MxZWIxNzdkYWZlOTEyMGZiMmQ0MTZmOTIwOTNmYg	1541347219	\N
295	1	1	ODllZWJjMGM1MWY3ZTMwODE4YTRlMTY3NzMyMjQyNDAzYzI1ZWI5MDcyZWUzN2UzNmRhZmZiNTZmNjM2ODJjYw	1541347287	\N
296	1	1	N2FjMmZjN2I2ZmQwZGEzNjM2MTdmYzUyOTk4NjhkYjNiYWEzMzczZDI5ZjgzMGZlN2U0YjkyZjhhNDM5YjUwYg	1541347309	\N
297	1	1	MTE1YTAyZThjNWNkZjM4MWZlY2Q1ZmZiNjQyZGM2MTFkMmNhOTAyZjNjNTE5ZDZjYTM5NGJkN2M4Njc0NzMzYw	1541347356	\N
298	1	1	M2QzNTUzYzBhNzc1NjhiOTZjYmFhMzkyMmE1OWQwNGI2ZGM1MTBhNjMzNTQxMTRiOTI2MTVlNTJjMTRjZTdlNA	1541347391	\N
299	1	1	YWZhMTRjMjE2YTY5YTE0MWQwOTMwNTRhZmNkYjg1ZjcwZWJlYjE5MTJkMTZiN2Q5MWU2OTI3OGY4MmViNGFiNw	1541347495	\N
300	1	1	ZTBiYzNmMGE4ZDg0MmNjMzE4YzA3ZjM1ZjY5OGM0ZTNjZmRkOGMxMjAwNzYyODJjODdjY2M1ZjE4YjFiMmZkZg	1541347640	\N
301	1	1	NmViMWI0ZjBjMjllYmM2N2RkMDUwOWM5MzM1ODM5MDJiNTE0Y2E4Njc1ZmZmNjdlYTQ1Y2I5OTdmMTc0ZGZmNw	1541347648	\N
302	1	1	NDAwMDg1ZWRiODFmMzUxNTU3ZmNiMWMxMjRkMzZmYTMzNWU0NTEwNGRlMjBmNDJmMTI1NzYxYmE4MjE0YjU1Nw	1541347784	\N
303	1	1	ZGQ4NWI1NWU0OGNjNWQ4NWNlZWI2NGI4NmIyNTI0NTY5ZTgyZWVmYWUxODk1NDBkNzc1M2VlMDE1ZTA4NzQ1NQ	1541347945	\N
304	1	1	ZDg4NTY3NzhhY2NjNWNlMzlkMzA4NjAwNDBmNjcyZjAxODE3MDAyOTgyYTA3ZjJmZGM5Mjk2MTRmNTY3ZGI1Yw	1541347991	\N
305	1	1	NWM5MmUyMzE5NTIzOTQyNTA0NWEzZmY1YjNhMDAxNjM3Zjk4ODg4YjhiNzgzM2U5MDE3YjhlMTM0NzRjMDI2YQ	1541348022	\N
306	1	1	ODI5OGZkMzMzMWE0YjJhODhkMDBkYmM4YjMwMmM2Y2U1YjBlNmZkZDE5YTA1YzA5NTQzNTI0YmY4MjM2YjM1OA	1541348119	\N
307	1	1	MTg3ZjM5YzFjNDY5NDllNmZkZTgyYjY5YWU4YmE5NTBhNGI1ZTQ5MmU3MDgyNDg3ODQzYjE3ZGQyZTNmODYxOA	1541348388	\N
308	1	1	NmEwM2JiZGJmZTg0MDg3MGQ3NDE5ZjVmMGJkMGEzMTBmNzA4MDFjZTc4MGI3MDEyMWZkYjVhMjBkOWVkMjMyMw	1541348491	\N
309	1	1	MjBkMTcxMTU1OTBkZWZiMTUxOWVhZDgwMjA1OGI3NTExOGFhZmJhODljMTE1Yjc5ZjhkOTIwZmZmOTBlM2Y1Ng	1541348533	\N
310	1	1	ODdlYTRlNjhmZTY2Y2UxMDc1MDQ5NDlkNDQ4Y2VlMGUyODgwMTlmM2IxNGI0MGQ2Y2Y3ODI0NzJmNDQ3OWU1YQ	1541348641	\N
311	1	1	MmQwNDA0MWRhNTBmYTYzYjQ4MTE0NTUxODU4ZmEyZGYyNzRmMDg0NzJmMWIyNTk3NzAyNjM4ZDljOTA1MmMyNw	1541348662	\N
312	1	1	NzE4YTU4ODdhNzkyNDNjMDlkMDU0MzMzMDNhMDM1YmMwZmU0YzM2MGU2MDViZDViY2Q5MjJhNDM1YTlhZTZhYQ	1541348769	\N
313	1	1	YWE0ZTRlMWZlOWNhYTIyZWY2NzE5NjYyNDQxMzM5MjU3YjA4YjQ0YmQ1NDRiNDJkMTQzN2JjNWM4MTNjMTRhMw	1541349381	\N
314	1	1	OWZjN2NjZGNhZDA4ODBjNWViM2ZlN2NkZDU0YjQ4ZjQ5NjM1YjJlZjdiMWE0N2FkOWViNDY2MTgwMWE1YTM1NA	1541349710	\N
315	1	1	YzgxZGUwOTJkMDIwMzAwNTMwZDk0NjUxZTZmM2FlZDdlMDExNTY5NWQ2MWU2MGZlYjJkYTk0NDg1ZmIxY2UwMQ	1541349796	\N
316	1	1	NTU3NzE5NzQ1MGI1YzI2NGZjZjQ3OWFjYWJhMzQxOWIxZjRmMTM3NzM4ZTM2MDQ4Yjk5NGZjY2I2ZTU4ZjFjMw	1541350280	\N
317	1	1	YTM1MWJiN2NkNGE2ZTg4MGQ1M2JmZGQ4ZjJiNTM5Yzg5ZmE3OWI0N2E1Zjg4OGY5ZTAzNTVhYTUwMDU0ODg2Nw	1541350394	\N
318	1	1	OGVmNmYxNGIxMDMxYTQ1NmNmZDAwZGE5NGJmMGE5ZDA3ZmUyOTIzOGFjMWRhOTA3YjA5ZTM2ZTRmZDljNDA3Yw	1541350416	\N
319	1	1	NTk0OGM1MmVlY2M1OWU0NTRmOTllZDAwZmFjYTM1MzM5Y2M0ZDhmODBkNGUxM2E5OWVkMmE4ZmNlZmQ4ZTg3ZQ	1541350510	\N
320	1	1	NTM3OGUwZjkzMjljNjY5ZTk5ZWI1ODk5ODBhYjQ1MmI1ODM5M2VjNzFlYmQ1MGM5MWVkNzNjNjBjMWNkOWJkOQ	1541350855	\N
321	1	1	MjI4YmVkMzBkMWNhMGU5ZTQxODU5ZGNlMWMzNjM2Y2UyZGIyMDgxOTJkNTg3ODcwYmYzMmRjZTdiOTVhYjJmMg	1541350967	\N
322	1	1	MWVlOTczMjNmYWI3MzAwODMxMTQyNDEwYmEzZGFmNjEyOTJmOTRiOGI0YWMyMjdhZGE2ZWFlNTdiY2QwYTRmOQ	1541351357	\N
323	1	1	MWQ5MGVjMTg2NTM5ZGY2NzUxYTcyNDk2ZTlmYWVjMjUxMWEzZGQ5ZDhkMzM1OWFlZDU2YjFmOWFjMWJiZTgwYw	1541351746	\N
324	1	1	MDk1Nzk5OWVmMmNmMTcxZjg0ZWUzYzIzYmJlNTI0ZDdkMDdkN2NkNDFmZDY1ZGRhZDgyMzVkYmZjYjZjMWEzOA	1541351800	\N
325	1	1	Mzg1MDMzOTNmN2UyMDViM2NiYmI4YTVmNWJhMzVjZjg1NjRkZmQ0MmIzYzgzYjMyMGU0ZDRmZTBmMzU2YmYyNw	1541351872	\N
326	1	1	ZjJjYTExNzEyZTEwYzQ4MDkwZTk5NDcyMTY2ZjQwODgwZjZhODZlYzI3YzE2OTBkODdkYzMxZDgzMWRjODYzYw	1541352132	\N
327	1	1	MDc4ZWZhYjFlOWY5ZjZmZGMwYWFmMTE0NzQ4NzM3NWIyM2ViNjFlYmQ5NGYzMDdlZjdjYjE2NjczMmVkYmRjNw	1541352243	\N
328	1	1	YmY5ZTY2OWFlZTZkZTI0OGNhOTI5ZTIwMDg0OTM4MjU4ZTNjYjBlYWFlM2NkOWM5ODlmZjAzZWM1NjIzOGFlOQ	1541352428	\N
329	1	1	OGU2MzA4OTEyYTU4NGNjMzI5MDExYWExODlkZTQ1YzVmNzQyMTI0YTQ5OTA5ZmYzZDQzZTEyYjlhMzJkNDJkYQ	1541352956	\N
330	1	1	ZjdlNzIxMjA1ODYxOWRkYmY0ZmJjN2JmNTk0OTcxYWViODNmYjllMWM1MGU3NjBmNDJhMWM3MTc5NmFkOTIxMg	1541353714	\N
331	1	1	MTQ3ZDBjNWYwNDRiOGJjZWM2YThiNGY1YmU4ODFiZjM1ZWQ0YmQ3NDFlNDNmMGI2NDUzN2QwNWIyZDZiM2M1Yw	1541354367	\N
332	1	1	MjFjZGNiYTYwYmZlNDA5MjFkYTI4MDI2NGExNGQ0NjVjZmQ5ODExYzIzNWU3NTYyMDhiYTMzM2VhZTUxYjhlZQ	1541354480	\N
333	1	1	ZGY3MjU5Yjk0ODAzY2Y1N2NkZDExYzc2NDMwYjhhMDFlOWEwNGEzZTZkMTM3NGQ3ZDM1NzY2YjMwZjgyMDVjNQ	1541354783	\N
334	1	1	MWMyOWJjYjM4ZjQ4N2EwYmI5NGVmNjcxNWQ5ZTc3NWQ5ZDkyODJhNmU1NGMxNzkwNjM4ZjFjZWJkMjI2YTA2ZA	1541355590	\N
335	1	1	MzAxMzcyNTVjY2ZlZDNjNjkwNDkxZTVlN2Y1YmExMDAzMTU1Y2FlMDhlM2QxOTc3M2I0Njc5M2I0NTVkYmIxOQ	1541355726	\N
336	1	1	ODY3NTE4ZjM2ODg0NGY2ODc5NjJjM2U0ZDJhOWY5MTRmNzVkODQxZTMxMzMwMzZjNTRhNTkwMTcwNjk0MTBhMA	1541355806	\N
337	1	1	ZTE0ZDAyZTEwOTlmZDQ2NmMwMmUwNTgyNGYwMDM1ODY4MTE4ZGIwOGQ3NWE5Y2Q2NzAwNzExMjJmNjg3ZTNmMw	1541355810	\N
338	1	1	OTQyOWM5MjA0MjM3MzBmNzg2NjE5ZWVmMDE2NGZlYmExMTcwMzA5Y2UwMDkwMmQ2NTg2MWFhNTVkZTQwZGQyMQ	1541356042	\N
339	1	1	MTE0ZGM5MDg1Yjk3OWEzMGZlZWYyNzhmZmNlMjA1ZTZiYjBlNWRkN2U4ZDc2YWYyMjk5NjU4NjIzOTczMzQzNQ	1541356786	\N
340	1	1	NTRlM2E0ZDY3NTM1ZTZkNzJmOGNhYTlkM2VhOWU4NDlmODRjMzJjYmQ4YWY2ZDZlZWM1MzQ0MDJiZDkwNzY5ZQ	1541357085	\N
341	1	1	OWVmNjdjNjhjNzM5ODQ1ZDk2YmZhMTcwOGNjNzYxMDA5MTBjZDAzNjdhZDAxZDJjYWJmNTYyMjdhNTljODA1OQ	1541357136	\N
342	1	1	Njc5Zjc1ZWU3ZDE1MDQ4YjcyYjgyNzliYTY2NWM3NTk0ZDNiMTliMmEzNDQyMDFlOWZmYmMwNGM5NjFhYWViOA	1541358232	\N
343	1	1	MmZlMjlkNDU5MmQzYmUzM2MyZjYzM2QyN2E1ZDYyYTMwY2FmZGQwMDgwOWUwNWQyMWIwYjIzODJhNjQ0ZjM2Ng	1541358844	\N
344	1	1	ZWQxMjRmMDdlNGE1YjAyMjI3YmVmYTNhMjRkMzMyNjRjZjA4NWQzNDIzZTVhYzQ2N2IwODZlNjcyMjIzYzg3NQ	1541358919	\N
345	1	1	M2ZjZmY0N2I5OWUwZWVjNTUxMjQxNDYzMzRjNzI0ZmIwMjI5YWIyMWYyNTc3ZDU5ZTgwNDBkOTY3YjdjMDY5OA	1541358979	\N
346	1	1	MWIyNmU4NmE5ZWExNDFjZmUxNDYyZjA0MzE2ZTk0NmMwMTNhYWYzYjMxNGYxOTJkMzJkYmM2ZDQyNDAyZTk3MQ	1541359215	\N
347	1	1	Zjc4ZDU1MjY2ZTVhNzg0MDkyNGFhMzJkYWU5MWU5ZmU3OGI1YzNjMTZhMDI5MDNiNTVlMDczYzI5MTQ4MTZiNw	1541359241	\N
348	1	1	ZTQzZmZjNTFiYzllZGIyNWYzZGI2MWZjYWEwY2QwMGUyYzNjZjkxZGZjMWRmYmU3ZDc3ZWY1ZTM4YjRiMWJkYw	1541360645	\N
349	1	1	ODQ3NjE3NDM1YWViNmQ0MDFkNjQ0MzhjNTI2NzZjY2ExNTI2NWFkZjc0ODg2OTU3M2E2NTMzNjljZWI1MDY4NA	1541360680	\N
350	1	1	MDIzMTk3M2I5ZGFhM2JiNjIxYTkxNDkyOTgwZDUxM2ViNmQyNWZkNjNiYjljZjVlYzYwNmM3YjczMWE2NGY2Ng	1541360708	\N
351	1	1	NThiMWRkYzYxOWQ1YjhhNzhkYzRkZjAyMTQ1NGEwZTkzNDFmZWE1N2ZjOGEyNjZhNjcyZWJkODZmNjZhNDk5Yw	1541360800	\N
352	1	1	MTlmYTE4YWQ3ODg1ZDcwNGNjNDA1NjdhYzVjZmFjNDNhMzM4MTE4ZmYxMzc2ZDkyN2YyM2JiNDU2MzMzMzhmOA	1541360808	\N
353	1	1	MTk0ZjNlNzRjNmEyOGM3ZWFkMzUyMDM5NDhkMTBlNGI1ZThmZTRjMWFjNzdhM2Q1MmZiMDE5NjQ5OGNlZjI0MQ	1541361045	\N
354	1	1	MjdjN2FiMjE3Yzg5OTY1OWJhZWUwN2U4MmMxNzNhYmZhMmM1ZmUxZGFjODU5ODdkNDE1NmRkNjBlMTEzYjEwYQ	1541361070	\N
355	1	1	MzQwZjdmNGVkMDlhNmI4NzFjYWE2Y2IzM2NlNzA4NDc4NWU4MzhlNzk1OThmZWY0NmYxNzU5M2JlYTIxNTRmMA	1541361293	\N
356	1	1	Yzc5NjBlZWI3ZGI3NDJkMjY4NzdlMGRiZTdmMGVlNTNmNjFmNTIxYzZhY2ZhMzljMzc5Nzc3YWE2NmY4ZThkYw	1541361319	\N
357	1	1	YWFhM2U3ZmY3ZGU1MTc4MjQxMzMwZmQzYmJlMTM0OWY3Njk5MDVmY2EwZWVlYWE1N2E0ZWZjYTRmMzdlMDFjMw	1541361523	\N
358	1	1	NGUxMTYyOGE4ZTY5Y2UzMWUxYTVmOGMzMWRhMTBiMThhYjkzYzdkZGU1NWZhZjBkMGFjMTMyNDc4Y2ZmOWM1Zg	1541361608	\N
359	1	1	NGRmZmQxOWYxMWY1Y2E4NzU3NWYxZWMzZTIwYmE0ZTNhYThkNTAxZjY2YzU3YWFhYTRlNDgwODdmNjJlYzBkNQ	1541364021	\N
360	1	1	YTFiNTY2MWI1NjEyNDg4NDY0ODhiODU1M2E2NjBhYWQ1YzliYTMxNzU1MmU5ODEzYmYwZmUwMmM2MDdmYzM4OQ	1541364688	\N
361	1	1	ZTE4NTIxNWQ1YzM5NWJhYThmMTc2Y2YwMzM5MjRhN2VhZGQzYWFiYWM4MDczOWY2OTVhYzQ5MmU2ZWFmZjA5Ng	1541364789	\N
362	1	1	MTUyMTJlMzRkN2ZlMWZjZjNlODRhYTI0MTViMjI5Yjk4ZjQxYmUwMDQzYTI3NGRmM2I3NTBmZTJkZWNhOWQ1Mw	1541364863	\N
363	1	1	YmIzNmVhOTVkZDkzNGQ3YzNiZjliNTI4ODJlMmU3ZDEzNmQ3MGM3MTFmMjU0NTk3NWVjZTEwMjg3ZGE0MGIzOA	1541364988	\N
364	1	1	MjIyM2Q3ODZiZGFiOWRmZjk1NWY2YmEyMTBmNGQxZTQ4OGNkMDI5NDgyNzA5MmIzNzI1MTNjNWNjMzc2MzBhNg	1541365216	\N
365	1	1	MGQxZTFkNWRmNjc3N2QzZGI5MWU1NjJhODg4MjMwNDdhMDM1YTg5MDM1NGJkZWJmZjk4Y2RjZjcyNzRmMzA1Yw	1541366053	\N
366	1	1	YTJlYTVkNTIzYmU1OWE3NmJhZDk2NGNjNmE2OTQzNDg1NTNhZWNkMWFlOGZlZTY0YTZiNzA0MDMyMTg5NmY5ZA	1541366086	\N
367	1	1	MGE3ZjUwYWNiMmNmOWZlOGE2ZmNlMWUxMTUxZGFiODllMGQ1YTNjNjJiNjQ0OWY0MWExNDdhNzY0ZTgzNDEwNQ	1541366929	\N
368	1	1	M2E3YTRhNWMyZjgwNmUwZGE0Y2Q3ZDc3NWM2MmE1NTljZmZkNzBjOTgxNTYyOGRkMWIyZmJjYTVlYmU3YmRkMA	1541367147	\N
369	1	1	NDdhYmJmYmYyYmNhZTRjNGVmMjBiNDJmYmE4NmExNjY4OWNhZDE1NjJmODUyODEyMzQ1YzQ5ZTgzN2EzMjg3ZQ	1541367596	\N
370	1	1	YzVmMDJlZTUwNGNkODUyNzNjYjI5ODk1NWFlZTUzNDc5NWFhODQ4NDE2ZTdmOGFkYjI5NjBhMjk2YWVkOWVlZA	1541367656	\N
371	1	1	YTRlZTk3NWJjMzE0YmNkNjBmYmJmZWMzZTc3MTY0NDg5MDI1NDA4ZWFlOWE4MDVkNDZjNWZmMzdkMDVjYTgyZg	1541368625	\N
372	1	1	OWI5YjYyM2M3ZTliYjcyNTUwOWQyYzIyZDgyYWJlZDcyYWQ0MWY0Y2ZiNWJmNDI3ZDNiMTIyM2VkN2ViNWY3Yg	1541368663	\N
373	1	1	NGU4MjA5Yjk2MDRjYzFhNGRhMTk4ZTc0ZmVhNGY3YWExYmJjMGYxNTU1YzNiNjRjMWU0ODMyZTM0NTNhYTMxNQ	1541368776	\N
374	1	1	ODQ0ZWI0NDViYjZmMTI1ODAxODRjOWYxOWI1M2U3Zjk2YTA2NDc3MWZlNjdjYWFkMGYwYzY3Y2FiYjY4YjFiZg	1541369097	\N
375	1	1	YTliYmQ2YjE3ZDhkMTk0Mzg2MzFmZGZhODRlOGIzYzBiNjZhOGNlNGVmOTc3NjMzNjYyZjM1NmYwNTc0OWUxMQ	1541369618	\N
376	1	1	NWVkYjA3OTdiN2JkNGE5YTllMzZjNTg1YmJkNzYxYWJkMmIzNjczNWM0NzFmNzRjOWFkMjFjOTE3MDc0YjY2NQ	1541369650	\N
377	1	1	NDI1ZGYxYjVmNDFlNmRjYjgxZTdlMjg3OTFkZGE1YjZiNGJmMTdmMDY3YTRlODQ5MjNlZTZhM2QxNDhjY2UyYQ	1541373669	\N
378	1	1	MDUwMzZhOWJmMmZlNjcxNmFmNWYzOGIwMDAzZDU3YWM5Y2Y5ZTUzMDZjYzYxNDFmODdmYjZmMWE3ODY0YzkyYQ	1541373820	\N
379	1	1	MTFiZDJkZTc4ZGQzOTNjZGRhMTVhZmZjY2RjNWNhOTU4YTNlN2E4NzM4ZGJkMzhlZTA2YWQwODU4MjJjNDhmYw	1541373891	\N
380	1	1	MGI3N2ZlNDhjZDRmMTQ1M2ZkYTYwZmM5NDkzZmU2NDAzMWFmMDFhMTdmNTdiODdjZmVhNzMwYjJjOWFmNzkwZA	1541374082	\N
381	1	1	ZGU4NmE4NTg0ZjlhNjcwMzNiY2RlMTNmZGFjYzlhZjZmMzRjMjRiODZkNTM1Y2RiZGQ0OWNhNjJmNzAzYzQwMQ	1541374167	\N
382	1	1	NmQwNmJlZTQ5YmU0MDliYzRlZjEzMzgwMWQ4NGNjZjcwNjBhYTk0MjVkMjczZjkxNTA3MDQ2ZmQ2MzlkZTVmYg	1541374192	\N
384	1	1	MmFlN2YxOTYyN2U1ZTdjOWY4OWNlZTA1YzNmZTFjMWE2NDRkMjE4ZGI5NjljN2FmZjE3MzA0YTFkY2ZhMzQ5ZQ	1541374407	\N
383	1	1	NzRhOTc0YWQzNTlkMWEwODBhYjYxMjJlMjgwMjMwMDgxZmYzOGZmNWNiMDgxNmRhYjdmYjM2MDkyNTcwNDJjOQ	1541374407	\N
385	1	1	ZjE0ZWNjODg0OGI5NGFhOGY5OWMzOWU2YmQ3NTM0NDU2N2ZmMmQ3M2Q5Nzc0Y2Y0MDZjZDVhZmI1Njc1ZjQ2OA	1541374474	\N
386	1	1	NTNkMGQyMmI0MDBkNDA2OTcxYWExNjZkYjYwNjhhNGYxYTdhMDNiODBmMDdiOGFhZTM4ODQzNDMyZTY1ZjVjNw	1541375129	\N
387	1	1	ODRiMzI2ZjhiMTcxNWE5ZmE5MzE5ZjlhMTZlMWQ5ZTU5MmVmNTQ1ZTVmZDI5YWRjZjhiMWVmN2M2ZDkxY2NjYg	1541375314	\N
388	1	1	ZjU1Mjc4YWE1ZjRkMWU5YTY0MWZmYTk2ODY5MjFlYWEwOWY5MjkwMWVhZDQ2ZGIzZWJlNDVhOWE1MWRiOTAzYQ	1541375399	\N
389	1	1	ZTMzNzQ3MmY2NjkwNGNhODUwMzQwMjc2ZjBlNmIxN2YzMTE0MDgyYmM2OWUwNjMwNjA3YTI3NjNiNDQ1NmMyOQ	1541375441	\N
390	1	1	MjQyODVkN2IwMzRiNWVlNDgxZGFkOTQzZmQwMDUzNTJhNTNjN2RhNzYzMTc5MWIzMmMzZDYzNWFhMGJlMTYwZA	1541375608	\N
391	1	1	ZTU4N2VhYjhkMWRiOWNlNjRlYjRkY2ExYjBjN2FmZTUxMTFkYTU0ZGVjM2VkYTVkMGZjOTAyYjc5ZTQ0YWRiZA	1541375692	\N
392	1	1	ZmQwMjIxMjJjZmU1Yjk2OTYyYmMzYmU3MmVjOTFjOGQ3NzhmNGZjMzJmOTlhN2IxN2E1YzIxNDRlOTFjN2EyOQ	1541376827	\N
393	1	1	NzI1YTVkMmEzZDY1NzJjZDY1YmZjYjA4ZTAyZmE5ZGZmNDUwNjgzYWVlNWQ5ZWNiMjQxYWMyMTBmZGE0NjJhYw	1541377181	\N
394	1	1	MzlhZjgzZTFkNGM5YjFkZmFiZjY2Y2U5NzViMjdkNmU5NDFhMDQ5NGZlNzgwODVkMzgxODRjYzBiZTRjNzZiYw	1541377856	\N
395	1	1	MjA2NDc2NDk1OTNkNjNhNmQ1YzhjMDU1ZDE2YjVmOTM5ZjY0NzY4YTgxM2VmMmIxYWU5M2M5NjNmMGU2ODY2OQ	1541378672	\N
396	1	1	OWQ4NzVlM2RjNDJjMjY0MGUxZmM4ZTBkNTUwNWE3ZTY2YWQ3NGNkZGRhYzIwYmIwMjc2NDY0MDgwZDVjMDVjYQ	1541378809	\N
397	1	1	ZGZiYTRjYWM3YWI5MTRkOGI5OGQwMGQ3N2NlYjdkMDRlYjI1ZGY0NGRjMzI3MzRiOGU4ZjRiZWIwY2EwYWE4YQ	1541379330	\N
398	1	1	YjZjNWJiYjljNTQ4YTMyODIzZDIzZTQ5ZGJlYzI4YTkwZTBlNjQyMzgzNDJkNTlkMDM1NzM4ODJjMDhmZmI3NQ	1541379476	\N
399	1	1	YmJkYWQyNzZmOTAwN2VjNWE1OGI2YzA0MmMzZjRmNzk4Y2QzMTdiMmI4M2UzODkyODc2M2VlODliOWUyMzU4Zg	1541380840	\N
400	1	1	NmZmYjM2Y2JhNGM4ZGVmNmJlZjViMWE0YzE4MGMwNTYzMTM3MzE1NGY0Zjc2ZDA3OTZmMDE3ZGIzNDg1MmI4OA	1541381515	\N
401	1	1	MGE0ZDU2MzNmZDk3YjQ2OGI3MDk0MmQzOTc5NTM2NzFiNmI4MjQ3ZWJmMDVmODEzMmNjY2M2MTU0YjljMmY3Mw	1541381576	\N
402	1	1	NzE3ZDkyMzhiODZhZDRmMmNjNzc3NzQ3Zjg4NzZiYmU3ODhiODY3NjQyYWVjYjM2M2NjNGY0NTA2MWIzYzIyOA	1541381715	\N
403	1	1	OTVmMjRjMWZiYjllYjZhYThmYTM2ZTY3ZjcwMjVmNWFhODBhMTliNWZjM2Y2MzAwMTcwMGI2NTJiYmE2Mjg0MQ	1541381763	\N
404	1	1	MzRkZTk2ZjdmYWNlN2Y4NmRhNjMxYzI4ZmIzMTNkN2RlMzgxNzhlMTFhMGIzM2YyNWQ5MmZjNjVlOTUzMjQ5YQ	1541381860	\N
405	1	1	NTViYWY1NTkxZjA5ZGNmNmE2Y2RkOWUzYjNjN2YxY2RmMDFiMTUzMTdmZDA2ZWIyMDk3N2RlYzA0OTQ4YjlkMQ	1541382065	\N
406	1	1	NDk0OWQ5YWQ0MWQxNjVhZmFjMDJlMmIzNTllY2QwYjE4N2ZkOWQ0YTZjMWMwYjljMmZlODQwZjRkOTFmODM0Nw	1541382696	\N
407	1	1	OWRjMTE4ZmRiNzM2ZmZhOThiMDcxMmZkMDhkMzUzNDNmNDA5YTJiODEyZjM0N2Y4MDI3ZmM5NzExNmJkYWI5Zg	1541382723	\N
408	1	1	YjVmMTk3OWMwNWNmZGU5YjhjMDJiYzYxNGUxZjczMTUyMTRmM2IxOWIxY2JkYjUwN2Q0ZGY3ODY1YTMyOGRkZA	1541383545	\N
409	1	1	ZjZhMmU1NmY4MGRiODgwZjIyMmM5ZDBkZTlkODk2ZDUyMzVlZTZmODNhMzBlYmM3YzI2ZWFhYmFmYzcxNjc0Mg	1542551628	\N
410	1	1	NGIyYjczM2JjOGY5ZjIwODUxZWZiNTNkNWVjZmVlOWI4N2E5ODhkNTY4NzhhYTVkNTJmZWFhODdlNWZmZTU3Zg	1542551628	\N
411	1	1	NjhkN2NkYmE5MjlhZDkwMWFkNjc3ZTIxNTE4MzU3MDcyZDA0OGRhOTkyYWNjYWI1YjE2Mzg3NTdiYTM2OTUzOA	1542574100	\N
412	1	1	N2Q2NTNiNzdmOTZkNTcyNzQ1ZGE0NWFhMTdmODY4ZDY5NDU1NjVhZDk0NGM0MjFjODEwOWNiMmFjOWEwMzY2ZQ	1542574630	\N
414	1	1	NDA1MmFkMTdjNTljYmRlNTZmNjMyOGNlYTQwOTM0ZThhNzVmZjJmOTRhZWFiNzlhOGVjZmQ0Nzg2YTkwNjE5Mw	1542586598	\N
415	1	1	MWNlODU1OWY4N2YzYTY1OWExNDg1NzNiMjQ0NjQyMjViYmI3ODE0NmRmMjQ5YTM1M2RmMDcxNjVkNGNjYzAzMQ	1542586598	\N
413	1	1	MDY3YjhlYjcxYzYzYTkwYWE3N2Y4NDc5MWIyYTY4YzNkOWQ4ODhiZjliNjdlYzk4YWEyZGE1MGY0YzI3Y2RlNA	1542586598	\N
416	1	1	YzViNGQzMDE4ZTQxMGQzYzZmYmUzZTE3YWQ5OTE2NmVkZTQ4NGU4MTMwYjQ5NjZkNTA4NzQzMTE1NGIzYTNkMQ	1542586602	\N
418	1	1	NjY3MDg4NzkyOTFiMzY4MGQwNDg2YTI0YjY1NDQxYzE0ZjE3OTA0NjQxN2VlM2NkMDY4NjBmZjFlNjA1OWU5ZQ	1542675051	\N
417	1	1	YTliMDJjMThiYmZiZmUxNTgyMTcxM2JjMDVkMWYwMGJhMWE0YTFjZjAzZGMyNmU5ZGNiNmZjZGI5YWZiZjkxYQ	1542675051	\N
419	1	1	NDRlYjBiYTY1OTdkYjQ1Y2VhMjUzYTE5Mjk1OWYyNDFhNTJkYjcyNmI1NDhlZDllMzgwZjZjZWZmOThiMDNjYw	1542675053	\N
420	1	1	NTUxNmE3ZDcyYzYzZWE1ODZkODcwNjk3YTcxYTQxMzJhYWQ5NjhkZWZhNTg4MmZlYzZlMjJkYzBhMzY4NWY4OA	1542758454	\N
421	1	1	Y2FhNTcwYzBiOWExMTIyYTc4ZWRlZGUzYjRiOTE0Y2ZlZGY2ZWE4Y2FkYjVjNTk5OGNhM2NjZTJiYjgzNTVjYg	1542758454	\N
422	1	1	N2NmMDU0YzljN2ExMjM4MmYzODBkMTBhOWU1NWQzOGZkMDI2ODI5ZDQ2N2U2YWJiNGIwMmJjY2E1YzViMzg1Yg	1543078488	\N
424	1	1	Yzc3ZjljODc0MzAxZTMzMWEzMDU4ZDhiOTM1ZDhiZDQ2OWM2OTQzMjk2N2ZjZWU0NTgwZWJjMmRiYjAzYjViYw	1543104647	\N
423	1	1	ZmU5NjI5ZDY3Mjc4YTAwODIyZmU5MDAzMmViMzUwNzFkNWRkZGM0MDI2MmUyM2FmYjI5OWQwZmUxNzE3Yzc5Yg	1543104647	\N
425	1	1	MWYxNmYwZjM4YmY5N2NjYmJhY2U2OGU4NmNiNjRlMDA0MGNkYTI0NTA4OTgyY2ZmNGM5Njg3MDUyODg4OTgyNg	1543153109	\N
426	1	1	ODA3MjZiOGY2NTMwMzY4NDljM2I4ODNhYzY2ZmUzY2I2ZWNmOTNiNWU4YzM5ZWE2OWViODRlYmI3OGNkOTFkNA	1543192300	\N
427	1	1	MWZlM2E5ZTA0OWIxNTc2OTZmOWZiMTIwZmQ2ZDBkOTNiZjk2Zjk3M2IwMWNiN2YxMDNlMjhkODM2ODEzZTNkZg	1543193628	\N
428	1	1	ZDMxNzhjMDUzNGFkNjFjMzE3ZDkyYzA0ZDg0ZmE5ZjU5MTY0MzlmMzgyNzBhZjg2OWJmNGI0ZDBkYTViYzEyNQ	1543193628	\N
429	1	1	YjdiYWMwYWNjMmJhYTdiMzNiOTgwZDk3ZjZiODg2MGI0NTA5YWM3OWVlNWM0ZTc4ZTVmZWJhMmFiZmI1MGM4Yg	1543199117	\N
430	1	1	ZWI3ZTlhNmZiN2Y2ZWU4Y2VmODdjYTIwNjk4ZWI5NGEwMDQxOWIzNjkxNTMwMjdjMjE4N2Q2ZmFlYjkzOWY2OA	1543199137	\N
431	1	1	MTg0NTZiYmMwNTZkMTI0MWU3ZTg5ODgyN2MyNzJmMmJmOTFjMDhlYThjYjM1Y2Q3NTdhYjUyYzM3Y2ZlYmZmNg	1543203736	\N
432	1	1	Zjc2OGMyNGIxN2ZjOWE3N2I3MDY4MjMxZGFkM2Q0MzRmYWMyYzE5YzI5NGM5MDQ4MDg4NjJjYTQ5MDFkOTJlZA	1543204830	\N
433	1	1	M2Q2OWUzYzhkYzRlYWZmZmYzNDE5YzQwMTNiMzcwZDhhYzE5ZTUzOWZkYWRlMDAzNTgzYjU0MmMwMjhjZGMzMA	1543212831	\N
434	1	1	MDJkMWFmYjkzMDMzMWFhMDE1ZGNlYmY0YjE1YmNhNmRjNDYyNjdkM2Q3N2I0NjRhZTBjOGUxMThiMmFiZmE3Mg	1543212831	\N
435	1	1	MTJmOGIyMWNlMTBkOTNjZDA5ZjJhMmM4MGViNmYxOWUxNGI1ZjU0MjdhYjI0NDM5ZDBjMzMzYmJiZDFkMjI3Mg	1543235166	\N
436	1	1	NDQ5YjQ1YTIyZGZhMDJmYmJjZTUyMmQ2NzBmNzM1YTY1MDQ3ZjY0ZGZhMzI1MTIyMjIwZDdiN2U4N2VkNTBiMQ	1543260095	\N
438	1	1	ZmJiMzc3ZTg4MzIwYTM5ZGJkY2ZmYzI0YWQxYjU2ODlmMzJhZjExMDdkOGMyZjExZGJhMzA5NGYyODg5Yzk3Nw	1543268422	\N
437	1	1	YjYxODVhNTkzYTU5YjgzNGU1MWYzMjkwNDEyYmU2YmVjMjgzMmNhMTgwYzEzNWI1ZWY4YzhhOGFhZmUxNzc3Yg	1543268422	\N
439	1	1	MmE4NjhhM2VlNzk3MDY4NDQxOTFkZGQwZjM0ZDRiOWI4MmMyN2FhYTVmZGJlNTY3ZDQxMTk2ODI5YjVlMmFjNg	1543268645	\N
440	1	1	YzY2YjgwYjJjYWQ5NDNjMjY0OThjOWExYmNiYjIyYzZmMDBiYWI5Yjk1YTRmMTg0NGQzYjBkZjlhNjZiYjM3MQ	1543269445	\N
441	1	1	NGFmNzUxMTEyY2I3ZjkwMjFhYjU0Mzc4MzdjZDdhN2U1ZjY2YTVlZWUwMjYxNGFhMTA1ZDhhZmZiMTFiODg4MQ	1543269447	\N
442	1	1	MTg3MDBjNDhiZGIxNzgzY2Y1NmI5ZjI1MWE3YmNmYzIxMDdiZGFhNTc3Y2RiNTEzNGI0ZWU0YTcyODgzNzc4Nw	1543320170	\N
443	1	1	OGVlNDllMzQ4N2Q4NmM5NGNmNWUxZWE4MmQ5NWNlMjg3NTI2NTBlNWQyNjNlNjA2MjcyMzIzMTY1ODM0YzEzMg	1543320170	\N
444	1	1	MTdhYTY3MjQxZDVmN2FlYTc1MzIzMWM0MDhlMjkyNGRjOWUyYzFiMTQyMmZjOGY3NmI0ZmZiMWI4MjFiZDBmNw	1543323425	\N
445	1	1	ZGM4YTE3OTdlOWZlMjE1YzcwZDc3MTYxYjMyNzkzYWM4ODljM2U4MTY0YWQ3MDA1YWI5NmI0MDkzZmJjZGRlNg	1543333583	\N
446	1	1	NjZjOTRlZjRmM2NlNDJkNzE4ODg5ODk3NzQyZTE5NDc5ODhkYjI5ZWMxMDBlMzA5ZDdhOWUxZDg5YzFhZjc0MQ	1543333625	\N
447	1	1	NzQxOGQ0MjlmZWQ0ODM3ZjdlN2ExOGQzZWYzMTIxNmQ4MzViZmFiMTA2ZDJkMTczZjA5MGRhY2VkN2Y3OWQ2OA	1543607352	\N
448	1	1	ZTQ3NWIxMGU3MWFlZDExNDcyNGEzMjZiMGYwZmE3NTE5ZGJjYTBjZDk3MDlmNmFiYWQzY2E0MGFlYjBjNmExYw	1543850123	\N
449	1	1	ZTdhYzNjZDE5Y2RjZTZmZTMxYzQ0ODM5M2Q3YjllMDAyMWJkZjIxMmE4YjZmOTcwNzllYjc2YmMwYTI1OTIyNg	1543850130	\N
450	1	1	MTY5MjljYmU4MTQ1NjRhMTVjMDUwZDdjMmYzYzVjYThkYzZmYzRmNzZmYjgyOTYxNTVlYTZjZjE2NzVjOGU3MQ	1543865280	\N
451	1	1	MDAyYWRjOGI4OTk2YjNhNDYyMjRkM2JlYmUzNjY0NWYwMmNjNzZhNWQzOGFhMGE0NjRmYzU2MWVkYWViNjdmZA	1543865280	\N
452	1	1	YjQ5MTgzNWEyNTliMTQwMTQ1Y2ViNGExZWVhMjM1MzFkNmJkNjllZWQ5OTZkNTQ4MWQzNDkyZGM4NDg5ZTFkNw	1543865773	\N
453	1	1	NjNkOGM5OTQzYzgxMzEyNDhiYzAyNjI1YWNiYWQzNzRhNzQ0MzYwMzFlZTlkMTM3ZWI0ZGVhNTczYWQ5ZDg0Ng	1543865896	\N
454	1	1	ODA1ZGYxYzgyYzVkMWFiNzcyY2YyMWVlNjYxZjNlMDQ5ODAwZGEwYmRmNGRkYzI0ZDA0NmEwNzc5MWJmZmY1Ng	1543865901	\N
455	1	1	OWY3MDdhZjI4MTIxOTIyYTJmMTY3MzcyZDdjMDVmNDMxODhhOWVkOTFkODQ3ZDRjMzk4ZWNmMjQzMjg3NTY0Zg	1544011755	\N
456	1	1	NjFhMzRhNTU0YmM5OWRlNjBkNjVkYzZlYzEyMmMyYzZiMDY5ZWU0MmQ4NzdhYjk2ODAxMWY5MGI1MWNhZTYxNg	1544011924	\N
457	1	1	OTMyMzdmZTA3NDg2MTA3NjRhOTNhODI3M2U0YjMzYjFjNGZkYTYzNGE3YmQ1NGRkMjA4ODkzNjM0OGYwZTQ5Yg	1544099618	\N
458	1	1	YjI3OWM4MjdiMmI0NGYxMzFhOGE2MTU5ZDI4MGNlZWNkN2JkOGIxNzI4ZTMwZmVmZWEzY2VkOTA1NDVmZDk2YQ	1544125556	\N
459	1	1	YWI1NTZmZTJmMWQ1ZDJkZGEwMTAzOTkwZTAxMDM2YzM4MTA3NTVhMDdmYTQ2NDliZGE5ZjdhZDBkOGIyZjkwNA	1544129463	\N
460	1	1	NGRlYmNjOTM5MDAxZTQ0NjBkYTZlYmE2MzdhN2Y4NWIwNzc4ZGYxNzQzYTk3ZGVmNTBkMGE3MTQ0YmRjYmRmMA	1544187810	\N
461	1	1	OTYxNmU0ZDU5YzEyMzM4ZTc3ZDlkNTQwMDJjMTU3Nzc5NDY5ZTQxOTU4Y2Y4MzAzYmZiMjk1NjIyNzFkNTY3Zg	1544195277	\N
462	1	1	ZjI1ZDQ0ZmE5NTllNzQ0ODM0ZDdlOTk0ODhkYTUxYTNkNGM1MGVlMjg2OWI1NWFmMzc5MTlhODIxNWE1MTA2Ng	1544215278	\N
463	1	1	YTg4NjhkMDM4MzZjMzM1ZmVjODlkZWQ5NjNiMjU2NjRlN2VjMzBkMjQxNGNmZjkzZmI5ODVlOTJiNTVlNGMzOA	1544443157	\N
464	1	1	YzgzODc0ZGEyYmYyODczOTQ5OTI3YjgyYTM1MmI5YzM4NDA0NTI3Y2I4OWEyMTBlZjhjZDcxMzBkYzVmYWMxNA	1544445320	\N
465	1	1	NjQ5MDdkYjAzYTNkZTFiNzZlYjNkMGEzN2E0ZDJjMTY4ZDkwZDkzNzUzYjg2OTRiYjY1MGY4YTg1NmUxOTNkYg	1544448166	\N
466	1	1	YTRhYWJjNTRkZTllZmUzNjc4OGFkNzgzMGI5YWViNDhhODRlY2UzYTFmZDMxM2U5OTNiNDM1OGZkNGQ0YTViOA	1544451776	\N
467	1	1	ZDE1MzBmNTY4MTZhZjA1MmMyMGI2ZGZjMzQzYjA4NWYyM2YzZGEwMjEwODhhNGVhOTQwMWQwNjgwZTRlN2M0MA	1544465969	\N
468	1	1	ODI1OWM1OWNjZjU4NjA4YWNiNTE2OTBjNjY0NmNmZWY2MDA0NTQ1OWUxOTNmMjViNWIxOTU1OWFhNzkzNGYxYw	1544470851	\N
469	1	1	ZTg2YTgyMDAyMmExYzYzYmU3MDQ3OGMxYzg1ZTQ2MWUyMTQ0YTZlY2VmZjEwNDRiZmQzNDgxNjNjNTFlNWM2Mw	1544474972	\N
470	1	1	ZTBmYzIxZjNjYWNjZDRiMTE1NWJlZGZlOGE3ZTg4ZTRlMTdjMTQzMTA2MmYzNGJhY2I4NmFkNzMyMDU2NmY1Mg	1544530674	\N
471	1	1	MjkzMGY3ZmY3NWFjMDUyNzM2ZTBiNzc2ZmUzYzQ4Y2ZlYTIwMzNhNmI3ZDFkODJlOGQwYWFkOGIzMWQwOTFiZA	1544562259	\N
474	1	1	MjU3N2IwMzk4YzE5YzZlMjk4ZjBkY2I5YjcwNGUwZWU2Yjg4ZDA4MDBkZjZjMWMxNzI2NTUwYWJhNDA5YmE3Yw	1544562259	\N
472	1	1	MjZjMmE0NjY3YTk0NzI1ZDlhNWZlMWI2NTNlZjFlZGQyNzhiMjBlNjUwYWUzYTIzN2I4NGNlNGE5MjQ0MTAyOQ	1544562259	\N
473	1	1	ZGVlZjJhMWY4NjI0YWYxMzhhMzUxMGE1ZjQxYTg2NGM3YzM0MmUzZWU2NTU2MDgwYTU3MWVkMTRlZDQ0ZGRkYQ	1544562259	\N
475	1	1	Y2Q1NmQ4NzhlMmU1ZGM3YmRhYzE5YmU0NzkwZDkyN2UxNmZiMzExZTNmYmI3NmNhM2Y1NjZkODUwYjc3NmE3Yg	1544616003	\N
476	1	1	MWVlNTRhZGEyYmU5NGYyODEwNTdiYjc4NmI4Y2NjODY4MTExM2YyOWUyNWUyYzMyZjEyN2NlOWM2NzNhYjFmYQ	1544641272	\N
477	1	1	MDdkMzU4MGNmMTMzMmU3YTI2YmNlM2UyZDhmNjcyNDY1M2Q3MWM3OGUzNzE1ZTUyNWY4MjI1ZGY1NTZkNzczZA	1544724161	\N
478	1	1	Mzk2MWZiM2NiYzY2NTI2MzMzZmRjMDk3ZDczZTU1NzU0YjU0ZWY3OWRhOGUxZTkzMTMwMzA1ZThlYzI1NmQxZA	1544725475	\N
479	1	1	YmU0YzY1OTRkMzBmNWI4ZGRhM2RmMmQxZmMzOTRhMTNkNTcyZjI1MzcyMDlmNWJmN2Y5MjgxMmRkZmM3MWRmNQ	1544727619	\N
480	1	1	ZjZkNmJkNDg1NmE0Yjg0NjUzZjE5ZTg3NGVjYTM4N2YyZjc4MGVjM2MwZmRlNzAxODJlYmM2Y2M5OGQ0MGZjMA	1544729812	\N
481	1	1	MDFjYTRkNWI1MjcwZDFjOTUwMjI3YjFhOTc1YjRlN2ZlMTI3NWExNmQ0NWNjZmNjMjFkZDEyY2E5OGZmNDQwZg	1544789566	\N
482	1	1	ZGMwZTNkMTQ1ODBjMzRhMjdmMGZiMTg3OWI3ZTJhZDJjNjY3MjRlMGM2YmM1YjUxOGFmZTA3MmZiOTc4M2NhNQ	1544821669	\N
483	1	1	NjBmMWIyZDdmNWJlZDdjOWNkYTA3ZDI5ZGNkNjBlNDY0MTZhMzk5OGJhZGIzMzMxZWUxM2YwYTQxYmY2YWJlYg	1545054972	\N
485	1	1	MmZlOWUxNWFlYzAxYjRjMTM1ODNmMjFjZWFlYjhiZDlhOWYxM2I0MDlkZWYxODJlNzVhMDZiZGU3ZjcxYmU4OA	1545073475	\N
484	1	1	ZmFjYjY3ODJkMTg4YWMyNjYxMWMwMzkwMGNlYjYxYTBkNDc2MTgxY2JjYTJmNDllYjMxNmFmMTkxNzNlNzJhOA	1545073475	\N
486	1	1	YmEwN2VjNTkyYTdmODVmZGM2YTY5YWFiMjUyYWFlYTdhZjdmYjAxZjRlN2YwMjY0YTUxOWU1MjE0ODQ0ZWQwMw	1545073479	\N
487	1	1	MzMxZjU2Y2IwNDIzZDcyMWRmYzRkNmYyYTljYWYyZmEwMmYwOTc5ZmZmOWEwZmJlZmFmZDQ0ZDc5ZTc5ZTljNw	1545144446	\N
488	1	1	Y2RhMzc3ZjljNzcwMGZiZTA1YjllMWZmOTYyZjcwNjMyOTg1MmM1ODc3MjQ3ZmJhOTA4ZDEzNTQ0NzdmMjcwOQ	1545144446	\N
489	1	1	OWM2YzMzMzNhYmM2NzljNjZlY2M3OTliZDE4MWE3YzIzNWFkNjU2Yzg0ZjVhMmQ3NzZiNDA1NDU4NmRkZmY1Nw	1545144540	\N
490	1	1	ZDRiZDI1OTYxODk0MTY3OTNiYjllNDFmOWJkNmUzOGZjMjMxNjQ1ZGY5ODM4YzkxODRlYWI5M2QyZmQ2OTQzZg	1545221043	\N
491	1	1	OWY4NDdhZTY5ZmEyNGMyNzI2NDBmMjUxYTVhZWJhNGM5ODY3OWQ1ZTMzMGQxMWNhMjgzMTU2MDE0YTY1NGZjOQ	1545240876	\N
492	1	1	M2ZmNWQ4NmVkNmQ1ZDlhZTg1NDY5M2E1ZGI3N2E2YjEyNjU2NmY3ZjY4NTRiYWRmNGFkY2YwODlhMDM5ODNhOQ	1545242153	\N
493	1	1	YTA1N2NjNDFjNmE1YTE5YThiYjM3ODk0NDAyNDI1MmJiYTdjYTY0MzlhMDA2NWQyMDY4Njk1OWNjMjQyMDY2ZA	1545242709	\N
494	1	1	ZWI2Mjc5ZmY4ZWU5N2Q5YmFlNDU1MGRlMGI2NTE1MDQ1YjJkNzEyOTRiNDAzZDU3OTY3YWNkMzIxNDBiYWRmZQ	1545243218	\N
496	1	1	ZGVlNGUyMTk3MzMzMzdjMTJlN2YxMDk5ZjU1OTc0ZTZjNjczOGRmZGQzNGQwNDdiNWQ4MWYzYzg0ZGQ3MDgwMw	1545315378	\N
495	1	1	NGFjZGY5M2YyYjU1YmVjN2M0OWY2ZDgwODkxZWFiNGFiZDU3NDY2NDA4MjJjOWNhZmM5NjIyMzU1YjZmNzVmZg	1545315378	\N
497	1	1	Y2NiNjFlOTg0OTk3MmFiOGE4ZjkxNjNmNjNiZjY5MTI0YTAwZWVhM2JmOGRkZTUwOWQ2OGMyYzJkYmVmMTU1Ng	1545318787	\N
498	1	1	MDRiNTg5YzFmMzdkYjYwMzAzOWZlYjc1YWM3ZDhmODA1M2Q1MTBiYTI1ZDQ4MWI1NWZhOWM0NWU3MzI0NTIyNA	1545328266	\N
499	1	1	ZTk0ZWI3NDBlYzk1NDBlZjQ2OGNmNjM4OGYyMWRkMzQ5MThlNzg5MDZlYzBhYzA2ZDdjMDI4MDQ1ODEwZDJhNA	1545341627	\N
500	1	1	MzAwZTU4OWY2YTFmNGVjYzUyMjBmYjM2Y2Y2OGQxMDNiODQwNGZiYzA0MTM4YTM4YWEzZGNhMDdjMzk4NjI5Mg	1546387412	\N
501	1	1	YmUyMDE4ZDczNmEwMWZmOWNkYTk2ZmVjOWM2NjJjODhkYjhjMzFmZGJmM2Y4MjVmMjI1NzI2ZTE0OWNjNmJhMQ	1547130776	\N
502	1	1	MWU4MGNmODZlZjUxNTE1NWYxOWMzM2ExNjM2YTkwZjI5NjgwYWVmYTM1YzgyMzgwYWFmMmQ1YmY2ZWRiYzY3OA	1547130776	\N
\.


--
-- Name: oauth2_refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: oauth; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_refresh_tokens_id_seq', 502, true);


SET search_path = plataforma, pg_catalog;

--
-- Name: correlativo; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('correlativo', 298, true);


--
-- Data for Name: etapa; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY etapa (id, fecha_inicio1, fecha_final1, monto1, fecha_inicio2, fecha_final2, monto2, fecha_inicio3, fecha_final3, monto3, fecha_inicio4, fecha_final4, monto4, fecha_inicio5, fecha_final5, monto5, proyecto_id, fecha_inicio6, fecha_final6, monto6, fecha_inicio7, fecha_final7, monto7, fecha_inicio8, fecha_final8, monto8, fecha_inicio9, fecha_final9, monto9, fecha_inicio10, fecha_final10, monto10) FROM stdin;
1	2019-01-04	2019-01-04	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2019-01-01	2019-01-02	454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	2019-01-01	2019-01-02	1	2019-01-03	2019-01-04	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	2019-01-01	2019-01-02	453454	2019-01-03	2019-01-04	435345	2019-01-05	2019-01-06	234234	\N	\N	\N	\N	\N	\N	15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	2019-01-01	2019-01-02	1	2019-01-03	2019-01-04	2	2019-01-05	2019-01-06	3	2019-01-07	2019-01-08	4	2019-01-09	2019-01-10	5	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	2019-01-03	2019-01-03	23233	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	2019-01-01	2019-01-02	23432	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	2019-01-01	2019-01-02	232332	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	2019-01-01	2019-01-02	23	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	2019-01-04	2019-01-04	\N	21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	2019-01-01	2019-01-03	342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	2019-01-01	2019-01-02	43535	2019-01-03	2019-01-04	34232	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	2019-01-01	2019-01-02	1	2019-01-03	2019-01-04	2	2019-01-05	2019-01-06	3	2019-01-07	2019-01-08	4	2019-01-09	2019-01-10	5	24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	2019-01-02	2019-01-01	345345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	2019-01-01	2019-01-03	43232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	2019-01-01	2019-01-03	2342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	2019-01-01	2019-02-07	400000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	2019-01-01	2019-01-04	234234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	2019-01-01	2019-01-02	1	2019-01-03	2019-01-04	2	2019-01-05	2019-01-06	3	2019-01-07	2019-01-08	4	2019-01-09	2019-01-10	5	30	2019-01-01	2019-01-02	6	2019-01-03	2019-01-04	7	2019-01-05	2019-01-06	8	2019-01-07	2019-01-08	9	2019-01-09	2019-01-10	10
20	2019-01-03	2019-01-03	234324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	2019-01-01	2019-01-20	44324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	2019-01-02	2019-01-31	40000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	2019-01-02	2019-01-01	23121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	2019-01-01	2019-01-02	31231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	2019-01-24	2019-01-09	34234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	2019-01-01	2019-01-01	45644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	2019-01-04	2019-01-02	876786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: etapa_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('etapa_id_seq', 67, true);


--
-- Data for Name: grupo; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY grupo (id, nombre_grupo) FROM stdin;
2	imagen
3	imagen
1	documentos
\.


--
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('grupo_id_seq', 3, true);


--
-- Data for Name: institucion; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY institucion (id, nombre_institucion, descripcion, direccion, telefono, correo_electronico, jefe_entidad, tipo) FROM stdin;
1	MINISTERIO DE PLANIFICACION DEL DESARROLLO						DENUNCIA
2	YACIMIENTOS PETROLIFEROS FISCALES BOLIVIANOS-CORPORACIÓN	YPFB					UT
3	EMPRESA NACIONAL DE ELECTRICIDAD						UT
4	AGENCIA NACIONAL DE HIDROCARBUROS						UT
5	ADMINISTRADORA BOLIVIANA DE CARRETERAS						UT
6	ADUANA NACIONAL						UT
7	GOBERNACION LA PAZ						UT
8	GOBERNACION ORURO						UT
9	GOBERNACION POTOSI						UT
10	GOBERNACIÓN COCHABAMBA						UT
11	GOBERNACION CHUQUISACA						UT
12	GOBERNACION TARIJA						UT
13	GOBERNACION SANTA CRUZ						UT
14	GOBERNACION PANDO						UT
15	GOBERNACION DE BENI						UT
\.


--
-- Name: institucion_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('institucion_id_seq', 1, false);


--
-- Data for Name: mensaje; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY mensaje (id, nombre_completo, numero_telefono, email, mensaje) FROM stdin;
1	SERAS	1235413	SERAS	SERAS
2	asdasd	123123	jeorozco44@hotmail.com	asdasdasda
4	werwer	1234	werwe	werwer
5	adasdas	123	asdasd	asdasd
9	werwer	12234	werwe	werwer
10	sdfsd	123	sdf	sdfsd
11	sdfs	79120220	sdfsdf	sdfsdf
12	sdfsd	342	sdfsdf	sdfsdf
13	sdfsdf	234234	jeorozco44@hotmail.com	32423
14	werwe	324234	34234	srewrwer
15	sdfsd	32432	jeorozco44@hotmail.com	sdfsdf
16	werwe	32432	jeorozco.2012@gmail.com	werw
17	werwer	12312	elizabeth-velez@gmail.com	sdfsdfsd
18	werwe	21312312	jeorozco.2012@gmail.com	qweqwe
19	werwer	79120220	jeorozco44@hotmail.com	werwerwer
22	324234	79120220	SDFSDF	SDFSDF
23	werwe	32432	jeorozco44@hotmail.com	ertertert
\.


--
-- Name: mensaje_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('mensaje_id_seq', 23, true);


--
-- Data for Name: meta; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY meta (id, pilares_id, descripcion) FROM stdin;
1	1	Erradicación de la pobreza extrema material y reducción significativa de la pobreza\r\nmoderada
2	1	Combatir la pobreza social
3	1	En Bolivia, ya no existen las comunidades cautivas, ninguna forma de pongueaje y\r\nesclavismo, y explotación en el trabajo infantil
4	1	Combatir la discriminación y el racismo\r\n
5	1	Combatir la pobreza espiritual\r\n
6	1	Construir un ser humano integral para Vivir Bien
8	2	El 100% de las bolivianas y los bolivianos cuentan con servicios de comunicación telefónica\r\ne internet\r\n
9	2	El 100% de las bolivianas y los bolivianos cuentan con servicios de energía eléctrica y luz\r\n
7	2	El 100% de las bolivianas y los bolivianos cuentan con servicios de agua y alcantarillado\r\nsanitario
10	2	El 100% de las bolivianas y los bolivianos están integrados a través de sistemas de\r\ntransporte en sus diferentes modalidades
11	2	El 100% de las bolivianas y los bolivianos acceden a viviendas dignas con servicios básicos
12	2	Las bolivianas y bolivianos cuentan con servicio de gas domiciliario
13	3	Acceso universal al servicio de salud
14	3	Integración de salud convencional y ancestral con personal altamente comprometido y\r\ncapacitado
15	3	Acceso universal a la educación\r\n
16	3	Fortalecimiento del sistema educativo\r\n
17	3	Garantía del deporte como derecho desde el Estado\r\n
18	3	Acceso universal al deporte
19	4	Investigación y desarrollo de tecnología
20	4	Innovación Tecnológica de Alimentos Nutritivos
21	4	Tecnología con saberes
22	4	Medicina ancestral y natural
23	4	Formación y especialización profesional científica
24	5	Independencia financiera externa
25	5	Sistema financiero para el desarrollo integral
26	5	Inversión Extranjera Social\r\n
27	5	Triplicar las Reservas Financieras Internacionales
28	5	Mercados justos
29	6	Consolidación del sector hidrocarburífero, minero y otros
30	6	País productor, transformador y exportador “Complejos productivos” y Turismo
31	6	Producción agropecuaria con énfasis en la agricultura familiar comunitaria y campesina.
32	6	Sistemas productivos óptimos: agropecuaria
33	6	Los bosques escenarios integrales de producción y transformación de alimentos y recursos\r\nde la biodiversidad
34	6	Sistemas productivos eficientes
35	6	Sistemas universales de acceso a insumos, tecnología, asistencia técnica y otros servicios de\r\napoyo a la producción
36	6	Saneamiento de la propiedad agraria.
37	6	Democratización de los medios y factores de producción con énfasis en el sector micro\r\nempresarial y comunitario
38	6	Empleo para una Vida Digna.
39	6	Desarrollo integral, empleo digno y crecimiento económico en todos los municipios y\r\ndepartamentos
40	6	Aprovechamiento de los beneficios de los tratados comerciales, con promoción a la\r\nexportación de los productos elaborados en el país
41	7	Los recursos naturales y servicios estratégicos sin excepción han sido nacionalizados y están\r\nsiendo administrados por el Estado Plurinacional de Bolivia\r\n
42	7	Fortalecimiento de los procesos de industrialización y transformación en armonía y equilibrio\r\ncon la Madre Tierra: eléctrico
43	8	Eliminar el hambre, la desnutrición y reducir la malnutrición
44	8	Acceso universal a la Alimentación Complementaria Escolar (ACE)
45	8	Soberanía a través de la producción local de alimentos
46	8	En Bolivia se reconoce y fomenta la diversificación de la producción, la protección a las\r\nvariedades locales y el fomento a las culturas y tradiciones alimentarias
47	8	En Bolivia se reconoce y fomenta la diversificación de la producción, la protección a las\r\nvariedades locales y el fomento a las culturas y tradiciones alimentarias
48	9	Reconocimiento internacional de los derechos de la Madre Tierra
49	9	Reconocimiento de mecanismos internacionales no basados en el mercado y promoción de\r\nla gestión comunitaria de pueblos indígenas y comunidades locales
50	9	Desarrollo del conjunto de las actividades económico -productivas, en el marco del respeto y\r\ncomplementariedad con los derechos de la Madre Tierra.
51	9	Sistema Plurinacional de Áreas Protegidas
52	9	Desarrollo de sistemas productivos sustentables en el marco de procesos de gestión\r\nterritoria
53	9	Incremento de la cobertura boscosa
54	9	Agua y prevención de riesgos por cambio climático: gestión integral
55	9	Aire Puro, ríos sin contaminación y procesamiento de residuos sólidos y líquidos.
56	10	Acuerdos Internacionales para resolver la crisis climática que incorporan la posición\r\nboliviana sobre el cambio climático
57	10	Reconocimiento Internacional de los Derechos de la Madre Tierra
58	10	Construcción de mecanismos para el Desarrollo Integral y la Integración entre los Estados y\r\nsus Pueblos
59	10	Fortalecimiento de los procesos de Integración Multilateral y profundización del\r\nRelacionamiento Bilateral
60	10	Promoción de una organización mundial de los pueblos y de la Madre Tierra sin hegemonías\r\nen el marco de la democracia de los pueblos
61	10	Atención digna para los bolivianos y bolivianas en el exterior
62	11	Gestión pública transparente, con servidores públicos éticos, competentes y comprometidos\r\nque luchan contra la corrupción
63	11	Sistema judicial transparente que garantiza justicia para todos y todas.
64	11	Seguridad Ciudadana para una Vida sin Violencia\r\n
65	11	Defensa Integral del Estado y Complementariedad en el Desarrollo Nacional\r\n
66	11	Gobierno multinivel fortalecido, articulado, eficiente, participativo y con tecnología
67	12	Promover los derechos del pueblo boliviano y de la Madre Tierra para vivir en una sociedad\r\njusta, equitativa, sin pobreza
68	12	Práctica y fortalecimiento de las virtudes humanas y solidarias para llevar una vida\r\narmoniosa
\.


--
-- Name: meta_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('meta_id_seq', 1, false);


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY municipio (id, provincia_id, descripcion) FROM stdin;
1	1	LA PAZ
2	1	PALCA
3	1	MECAPACA
4	1	ACHOCALLA
5	1	EL ALTO
6	2	ACHACACHI
7	2	ANCORAIMES
8	2	CHUA COCANI
9	2	HUARINA
10	2	SANTIAGO DE HUATA
11	2	HUATAJATA
12	3	CORO CORO
13	3	CAQUIAVIRI
14	3	CALACOTO
15	3	COMANCHE
16	3	CHARAÑA
17	3	WALDO BALLIVIAN
18	3	NAZACARA DE PACAJES
20	4	PUERTO ACOSTA
21	4	MOCOMOCO
22	4	PTO. CARABUCO
23	4	HUMANATA
24	4	ESCOMA
25	5	CHUMA
26	5	AYATA
27	5	AUCAPATA
28	6	SORATA
29	6	GUANAY
30	6	TACACOMA
31	6	QUIABAYA
32	6	COMBAYA
33	6	TIPUANI
34	6	MAPIRI
35	6	TEOPONTE
36	7	APOLO
37	7	PELECHUCO
38	8	VIACHA
39	8	GUAQUI
40	8	TIAHUANACU
41	8	DESAGUADERO
42	8	SAN ANDRES DE MACHACA
43	8	JESUS DE MACHACA
44	8	TARACO
45	9	LURIBAY
46	9	SAPAHAQUI
47	9	YACO
48	9	MALLA
49	9	CAIROMA
50	10	INQUISIVI
51	10	QUIME
52	10	CAJUATA
53	10	COLQUIRI
54	10	ICHOCA
55	10	VILLA LIBERTAD LICOMA
56	11	CHULUMANI
57	11	IRUPANA
58	11	YANACACHI
59	11	PALOS BLANCOS
60	11	LA ASUNTA
61	12	PUCARANI
62	12	LAJA
63	12	BATALLAS
64	12	PUERTO PEREZ
65	13	SICA SICA
66	13	UMALA
67	13	AYO AYO
68	13	CALAMARCA
69	13	PATACAMAYA
70	13	COLQUENCHA
71	13	COLLANA
72	14	COROICO
73	14	CORIPATA
74	15	IXIAMAS
75	15	SAN BUENAVENTURA
76	16	CHARAZANI
77	16	CURVA
78	17	COPACABANA
79	17	SAN PEDRO DE TIQUINA
80	17	TITO YUPANQUI
81	18	SAN PEDRO DE CUARAHUARA
82	18	PAPEL PAMPA
83	18	CHACARILLA
84	19	SANTIAGO DE MACHACA
85	19	CATACORA
86	20	CARANAVI
87	20	ALTO BENI
88	21	SANTA CRUZ DE LA SIERRA
89	21	COTOCA
91	21	LA GUARDIA
92	21	EL TORNO
90	21	PORONGO
93	22	WARNES
94	22	OKINAWA UNO
95	23	SAN IGNACIO DE VELASCO
96	23	SAN MIGUEL DE VELASCO
97	23	SAN RAFAEL
98	24	BUENA VISTA
99	24	SAN CARLOS
100	24	YAPACANI
101	24	SAN JUAN DE YAPACANI
102	25	SAN JOSE DE CHIQUITOS
103	25	PAILON
104	25	ROBORE
105	26	PORTACHUELO
106	26	SANTA ROSA DEL SARA
107	26	COLPA BELGICA
108	27	LAGUNILLAS
109	27	CHARAGUA
110	27	CABEZAS
111	27	CUEVO
112	27	GUTIERREZ
113	27	CAMIRI
114	27	BOYUIBE
115	28	VALLEGRANDE
116	28	TRIGAL
117	28	MORO MORO
118	28	POSTRER VALLE
119	28	PUCARA
120	29	SAMAIPATA
121	29	PAMPA GRANDE
122	29	MAIRANA
123	29	QUIRUSILLAS
124	30	MONTERO
125	30	GRAL. SAAVEDRA
126	30	MINEROS
127	30	FERNANDEZ ALONSO
128	30	SAN PEDRO
129	31	CONCEPCION
130	31	SAN JAVIER
131	31	SAN RAMON
132	31	SAN JULIAN
133	31	SAN ANTONIO DE LOMERIO
134	31	CUATRO CAÑADAS
135	32	SAN MATIAS
136	33	COMARAPA
137	33	SAIPINA
138	34	PUERTO SUAREZ
139	34	PUERTO QUIJARRO
140	34	CARMEN RIVERO TORREZ
141	35	ASCENSION DE GUARAYOS
142	35	URUBICHA
143	35	EL PUENTE
144	36	ORURO
145	36	CARACOLLO
146	36	EL CHORO
147	36	SORACACHI
148	37	CHALLAPATA
149	37	QUILLACAS
150	38	CORQUE
151	38	CORQUE COTA
152	39	CURAHUARA DE CARANGAS
153	39	TURCO
154	40	HUACHACALLA
155	40	ESCARA
156	40	CRUZ DE MACHACAMARCA
157	40	YUNGUYO DE LITORAL
158	40	ESMERALDA
159	41	POOPO
160	41	PAZÑA
161	41	ANTEQUERA
162	42	HUANUNI
163	42	MACHACAMARCA
164	43	SALINAS DE GARCIA MENDOZA
165	43	PAMPA AULLAGAS
166	44	SABAYA
167	44	COIPASA
168	44	CHIPAYA
169	45	TOLEDO
170	46	EUCALIPTUS
171	47	SANTIAGO DE ANDAMARCA
172	47	BELEN DE ANDAMARCA
173	48	SAN PEDRO DE TOTORA
174	49	HUARI
175	50	LA RIVERA
176	50	TODOS SANTOS
177	50	CARANGAS
178	51	HUAYLLAMARCA
179	52	POTOSI
180	52	TINGUIPAYA
181	52	YOCALLA
182	52	URMIRI
183	53	UNCIA
184	53	CHAYANTA
185	53	LLALLAGUA
186	53	CHUQUIHUTA
187	54	BETANZOS
188	54	CHAQUI
189	54	TACOBAMBA
190	55	COLQUECHACA
191	55	RAVELO
192	55	POCOATA
193	55	OCURI
194	56	S.P. DE BUENA VISTA
195	56	TORO TORO
196	57	COTAGAITA
197	57	VITICHI
198	58	VILLA DE SACACA
199	58	CARIPUYO
200	59	TUPIZA
201	59	ATOCHA
202	60	COLCHA K
203	60	SAN PEDRO DE QUEMES
204	61	SAN PABLO DE LIPEZ
205	61	MOJINETE
206	61	SAN ANTONIO DE ESMORUCO
207	62	PUNA
208	62	CAIZA D
209	62	CKOCHAS
210	63	UYUNI
211	63	TOMAVE
212	63	PORCO
213	64	ARAMPAMPA
214	64	ACASIO
215	65	LLICA
216	65	TAHUA
217	66	VILLAZON
218	67	SAN AGUSTIN
219	68	TRINIDAD
220	68	SAN JAVIER
221	69	RIBERALTA
222	69	GUAYARAMERIN
223	70	REYES
224	70	SAN BORJA
225	70	SANTA ROSA
226	70	RURRENABAQUE
227	71	SANTA ANA DE YACUMA
228	71	EXALTACION
229	72	SAN IGNACIO
230	73	LORETO
231	73	SAN ANDRES
232	74	SAN JOAQUIN
233	74	SAN RAMON
234	74	PUERTO SILES
235	75	MAGDALENA
236	75	BAURES
237	75	HUACARAJE
238	76	SUCRE
239	76	YOTALA
240	76	POROMA
241	77	AZURDUY
242	77	TARVITA
243	78	ZUDAÑEZ
244	78	PRESTO
245	78	MOJOCOYA
246	78	ICLA
247	79	PADILLA
248	79	TOMINA
249	79	SOPACHUY
250	79	VILLA ALCALA
251	79	EL VILLAR
252	80	MONTEAGUDO
253	80	HUACARETA
254	81	TARABUCO
255	81	YAMPARAEZ
256	82	CAMARGO
257	82	SAN LUCAS
258	82	INCAHUASI
259	82	VILLA CHARCAS
260	83	VILLA SERRANO
261	84	VILLA ABECIA
262	84	CULPINA
263	84	LAS CARRERAS
264	85	MUYUPAMPA
265	85	HUACAYA
266	85	MACHARETI
267	86	TARIJA
268	87	PADCAYA
269	87	BERMEJO
270	88	YACUIBA
271	88	CARAPARI
272	88	VILLAMONTES
273	89	URIONDO
274	89	YUNCHARA
275	90	VILLA SAN LORENZO
276	90	EL PUENTE
277	91	ENTRE RIOS
278	92	COBIJA
279	92	PORVENIR
280	92	BOLPEBRA
281	92	BELLA FLOR
282	93	PUERTO RICO
283	93	SAN PEDRO
284	93	FILADELFIA
285	94	PUERTO GONZALES MORENO
286	94	SAN LORENZO
287	94	SENA
288	95	SANTA ROSA
289	95	INGAVI
290	96	NUEVA ESPERANZA
291	96	VILLA NUEVA-LOMA ALTA
292	96	SANTOS MERCADO
293	97	COCHABAMBA
294	98	AIQUILE
295	98	PASORAPA
296	98	OMEREQUE
297	99	INDEPENDENCIA
298	99	MOROCHATA
299	99	COCAPATA
300	100	TARATA
301	100	ANZALDO
302	100	ARBIETO
303	100	SACABAMBA
304	101	ARANI
305	101	VACAS
306	102	ARQUE
307	102	TACOPAYA
308	103	CAPINOTA
309	103	SANTIVAÑEZ
310	103	SICAYA
311	104	CLIZA
312	104	TOKO
313	104	TOLATA
314	105	QUILLACOLLO
315	105	SIPE SIPE
316	105	TIQUIPAYA
317	105	VINTO
318	105	COLCAPIRHUA
319	106	SACABA
320	106	COLOMI
321	106	VILLA TUNARI
322	107	TAPACARI
324	108	POJO
323	108	TOTORA
325	108	POCONA
326	108	CHIMORE
327	108	PUERTO VILLARROEL
328	108	ENTRE RIOS
329	109	MIZQUE
330	109	VILA VILA
331	109	ALALAY
332	110	PUNATA
333	110	VILLA RIVERO
334	110	SAN BENITO
335	110	TACACHI
336	110	CUCHUMUELA
337	111	BOLIVAR
338	112	TIRAQUE
339	112	SHINAHOTA
19	3	SANTIAGO DE CALLAPA
\.


--
-- Name: municipio_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('municipio_id_seq', 4, true);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY persona (id, nombre, paterno, materno, tipo_documento, numero_documento, direccion, email, telefono, celular) FROM stdin;
\.


--
-- Name: persona_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('persona_id_seq', 1, false);


--
-- Data for Name: pilares; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY pilares (id, descripcion) FROM stdin;
1	Erradicación de la extrema pobreza
2	Universalización de los servicios básicos
3	Salud, Educación y Deporte para la formación de un ser humano integral
4	Soberanía científica y tecnológica con identidad propia
5	Soberanía comunitaria, financiera, sin servilismo al capitalismo financiero
6	Soberanía productiva con diversificación desarrollo integral sin la dictadura del mercado capitalista
7	Soberanía sobre nuestros recursos naturales
8	Soberanía alimentaria
9	Soberanía ambiental con desarrollo integral, respetando los derechos de la  Madre Tierra
10	Integración complementaria de los pueblos con soberanía
11	Soberanía y transparencia en la gestión pública
12	Disfrute y felicidad
\.


--
-- Name: pilares_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('pilares_id_seq', 1, false);


--
-- Data for Name: producto; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY producto (id, nombre, descripcion) FROM stdin;
9	botellas	\N
10	botellas	dsfsdf
11	botellas	botellas
12	botellas	como estamos hoy he
16	botellas	como estamos hoy he
17	botellas	como estamos hoy he
18	botellas	como estamos hoy he
19	botellas	\N
20	botellas	botellas
\.


--
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('producto_id_seq', 20, true);


--
-- Data for Name: provincia; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY provincia (id, descripcion, departamento) FROM stdin;
1	MURILLO	LPZ
2	OMASUYOS	LPZ
3	PACAJES	LPZ
4	CAMACHO	LPZ
6	LARECAJA	LPZ
7	FRANZ TAMAYO	LPZ
8	INGAVI	LPZ
9	LOAYZA	LPZ
11	SUD YUNGAS	LPZ
12	LOS ANDES	LPZ
13	AROMA	LPZ
14	NOR YUNGAS	LPZ
15	ABEL ITURRALDE	LPZ
16	BAUTISTA SAAVEDRA	LPZ
17	MANCO KAPAC	LPZ
18	GUALBERTO VILLARROEL	LPZ
19	JOSE MANUEL PANDO	LPZ
20	CARANAVI	LPZ
21	ANDRES IBAÑEZ	SCZ
22	WARNES	SCZ
23	VELASCO	SCZ
24	ICHILO	SCZ
25	CHIQUITOS	SCZ
26	SARA	SCZ
27	CORDILLERA	SCZ
28	VALLEGRANDE	SCZ
29	FLORIDA	SCZ
30	OBISPO SANTIESTEVAN	SCZ
31	ÑUFLO DE CHAVEZ	SCZ
32	ANGEL SANDOVAL	SCZ
33	MANUEL MARIA CABALLERO	SCZ
34	GERMAN BUSCH	SCZ
35	GUARAYOS	SCZ
36	CERCADO	ORU
37	ABAROA	ORU
38	CARANGAS	ORU
39	SAJAMA	ORU
40	LITORAL	ORU
41	POOPO	ORU
42	PANTALEON DALENCE	ORU
43	LADISLAO CABRERA	ORU
44	SABAYA	ORU
45	SAUCARI	ORU
46	TOMAS BARRON	ORU
47	SUR CARANGAS	ORU
48	SAN PEDRO DE TOTORA	ORU
49	SEBASTIAN PAGADOR	ORU
50	MEJILLONES	ORU
51	NOR CARANGAS	ORU
52	TOMAS FRIAS	PTS
53	RAFAEL BUSTILLO	PTS
54	CORNELIO SAAVEDRA	PTS
55	CHAYANTA	PTS
56	CHARCAS	PTS
57	NOR CHICHAS	PTS
58	ALONZO DE IBAÑEZ	PTS
59	SUR CHICHAS	PTS
60	NOR LIPEZ	PTS
61	SUR LIPEZ	PTS
62	JOSE MARIA LINARES	PTS
63	ANTONIO QUIJARRO	PTS
64	BERNARDINO BILBAO RIOJA	PTS
65	DANIEL CAMPOS	PTS
66	MODESTO OMISTE	PTS
67	ENRIQUE BALDIVIESO	PTS
68	CERCADO	BEN
69	VACA DIEZ	BEN
70	JOSE BALLIVIAN	BEN
71	YACUMA	BEN
72	MOXOS	BEN
73	MARBAN	BEN
74	MAMORE	BEN
75	ITENEZ	BEN
86	CERCADO	TJA
87	ANICETO ARCE	TJA
88	GRAN CHACO	TJA
89	AVILES	TJA
90	MENDEZ	TJA
10	INQUISIVI	LPZ
91	BURNET O CONNOR	TJA
92	NICOLAS SUAREZ	PDO
93	MANURIPI	PDO
94	MADRE DE DIOS	PDO
95	ABUNA	PDO
96	FEDERICO ROMAN	PDO
97	CERCADO	CBB
98	CAMPERO	CBB
99	AYOPAYA	CBB
100	ESTEBAN ARCE	CBB
101	ARANI	CBB
102	ARQUE	CBB
103	CAPINOTA	CBB
104	GERMAN JORDAN	CBB
105	QUILLACOLLO	CBB
106	CHAPARE	CBB
107	TAPACARI	CBB
108	CARRASCO	CBB
109	MIZQUE	CBB
110	PUNATA	CBB
111	BOLIVAR	CBB
112	TIRAQUE	CBB
76	OROPEZA	CHQ
77	AZURDUY	CHQ
78	ZUDAÑEZ	CHQ
79	TOMINA	CHQ
80	HERNANDO SILES	CHQ
81	YAMPARAEZ	CHQ
82	NOR CINTI	CHQ
83	BELISARIO BOETO	CHQ
84	SUD CINTI	CHQ
85	LUIS CALVO	CHQ
5	MUÑECAS	LPZ
\.


--
-- Name: provincia_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('provincia_id_seq', 3, true);


--
-- Data for Name: proyecto; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY proyecto (id, codigo_sistema, fecha_registro, objetivo_general, objetivo_especifico, fecha_modificacion, departamento, nombre_proyecto, inversion, area_ejecucion, descripcion_problema, solucion_planteada, pilar, meta, resultado, accion, codigo_sicoes, empresa_adjudicada, estudio_realizado, fecha_iniciop, fecha_finalp, monto_presupuesto, monto_firma, etapa, fecha_inicioe, fecha_finale, monto_presupuestoe, monto_firmae, familia_beneficiada, municipio_beneficiado, comunidad_beneficiada, usuario_registro, contrato, tecnico, comision, orden, institucion, provincia, municipio) FROM stdin;
3	SMP-27122018-3	2018-12-27	El proyecto se encuentra ubicado en la comunidad de Canasmoro la cual se encuentra ubicada en la Primera Sección de la Provincia Méndez del Departamento de Tarija, forma parte del distrito 5 Eustaquio Méndez. Latitud y Longitud:	asdasd	2018-12-27 16:01:05	TJA	CONSTRUCCIÓN ASFALTADO CANASMORO	C	PU	asdasd	asdasd	2	8	sdfsdf	asdasd	asdasd	CONSTRUCTORA LIMACON SRL	\N	2018-12-01	2021-10-25	500000000	500000000	INICIAL	2018-12-01	2019-12-29	400000	\N	5	4	3	admin	\N	\N	\N	\N	12	90	275
4	SMP-27122018-4	2018-12-27	El Tramo I, se encuentra ubicado en el Departamento de Santa Cruz, se inicia en la ciudad de Montero, en el empalme de la carretera que une Santa Cruz con Cochabamba y la población de Guabirá y en su desarrollo de 69.7 km, cruza las provincias: Obispo Santiestevan, Sara e Ichilo, concluyendo luego de cruzar el puente sobre el río Yapacaní en dirección Santa Cruz – Cochabamba	asdasd	2018-12-27 16:09:09	SCZ	Subtramo III Rehabilitación de la Vía Ivirgarzama - Pte. Chimore	C	R	asdasd	asdasd	2	9	sadasd	sadasd	sadasd	CONSORCIO VALLEJOS	\N	2018-12-06	2018-12-30	250000000	250000000	INICIAL	2018-12-01	2020-12-15	400000	\N	4	5	3	admin	\N	\N	\N	\N	13	30	124
6	SMP-27122018-6	2018-12-27	El objeto del contrato corresponde a la Construcción y Control de Calidad de la carretera Santa Bárbara – Caranavi – Río Alto Beni – Quiquibey de acuerdo a Especificaciones Técnicas, así como la revisión, complementación y readecuación (si corresponde) del Estudio en la totalidad del tramo (aprox. 173 Kilómetros), además del Mantenimiento posterior de la vía Santa Bárbara	asdasd	2018-12-27 16:33:36	LPZ	Construcción de la Carretera Santa Bárbara - Caranavi - Río Alto Beni - Quiquibey	C	R	asdasd	asdasd	8	44	sadasd	sadasd	sfsdf	FARA ARQUITECTOS	\N	2018-11-29	2021-12-12	120000000	120000000	EJECUCION	2018-12-01	2018-12-30	4000000	\N	34	34	23	admin	\N	\N	\N	\N	5	11	59
8	SMP-27122018-8	2018-12-27	El Plan Plurianual de Reducción del Déficit Habitacional que desarrolló el Viceministerio de Vivienda y Urbanismo, identifica al Municipio de Jesús de Machaca como un Municipio en donde se debe implementar proyectos de vivienda en la gestión 2013, en tal sentido, la Agencia Estatal de Vivienda, realizó un análisis social para identificar sectores, agrupaciones y otros posibles beneficiarios	wqeqw	2018-12-27 17:54:59	LPZ	PROYECTO INTEGRAL DE VIVIENDA Y HABITAT - COMUNIDADES URBANAS - "CONDOMINIO PACHA" - LA PAZ	C	R	werwe	werwe	7	42	werwe	werwe	werwre	ANDINO AMAZONICA TRADING S.R.L.	\N	2018-12-06	2018-12-05	50000000	50000000	INICIAL	2018-12-01	2018-12-06	400000	\N	4	4	3	admin	\N	\N	\N	\N	7	10	50
7	SMP-27122018-7	2018-12-27	Adquirir, procesar e interpretar datos magnetotelúricos en el subandino sur para definir la configuración estructural y ampliar las oportunidades exploratorias en el subandino sur.	asdas	2018-12-27 17:00:34	LPZ	Magnetotelurica Subandino Sur	C	U	asdas	asdas	5	24	asdasd	asdasd	asdasd	CONSTRUCTORA LIMACON SRL	\N	2018-12-05	2020-12-21	100000000	100000000	INICIAL	2018-12-01	2018-12-21	300000	\N	23	33	44	admin	\N	\N	\N	\N	2	12	61
5	SMP-27122018-5	2018-12-27	Los objetivos a mediano y largo plazo están íntimamente ligadas al mejoramiento productivo de la zona de influencia de la carretera, siendo estas las siguientes: Mejorar las condiciones socioeconómicas de la población asentada en la area de influencia del camino. Mejorar la productividad agrícola y pecuaria y en general la producción de la zona de influencia de la carretera. Incentivar la creación de circuitos alimentarios con las poblaciones asentadas a lo largo del camino proyectado.	sdfsdf	2018-12-27 16:14:10	ORU	Construcción del Asfaltado Ancaravi - Turco	C	PU	sdfsd	sdfsdf	2	9	sdfsdf	sdfsdfsdf	sdfsdf	CONSTRUVEL OBRAS Y SERVICIOS S.R.L.	\N	2018-12-01	2018-12-07	210000000	210000000	CONCLUSION	2018-12-01	2018-12-02	400000	\N	4	5	6	admin	\N	\N	\N	\N	5	38	150
10	SMP-27122018-10	2018-12-27	El Tramo se encuentra ubicado en el Departamento de Santa Cruz, se inicia luego de cruzar el puente Yapacani, y en su desarrollo de 58.8 km, cruza la Provincia Ichilo, concluyendo luego de cruzar el puente sobre el río Ichilo en dirección Santa Cruz – Cochabamba. Beneficiando a poblaciones ubicadas adyacentes a la autorruta como El Choré,	asd	2018-12-27 17:22:50	SCZ	CONST. DOBLE VIA PUENTE YAPACANI - PUENTE ICHILO	\N	\N	asdas	asd	2	8	asdas	asdasd	asda	VELARDE CONSTRUCCIONES S.R.L.	\N	2018-12-01	2018-12-20	700000000	700000000	CONCLUSION	2018-12-06	2018-07-12	3242423	\N	4	55	44	admin	\N	\N	\N	\N	3	33	136
9	SMP-27122018-9	2018-12-27	Orientar el desarrollo económico y social hacia el norte de La Paz y los departamentos del Beni y Pando mediante el mejoramiento de los sistemas económicos sociales de infraestructura física, a través del máximo aprovechamiento de los recursos naturales, teniendo en cuenta su conservación y protección al medio ambiente.	asd	2018-12-27 17:56:45	LPZ	Mejoramiento y Pavimentación Tramo Yucumo – Rurrenabaque	C	R	asdasd	asd	2	7	sadasd	asdasd	asdas	COMPAÑIA BOLIVIANA DE INGENIERIA S.R.L.	\N	2018-12-01	2018-12-20	80000000	80000000	CONCLUSION	2018-12-01	2019-12-05	20000000	\N	5	4	5	admin	\N	\N	\N	\N	7	20	87
11	SMP-212019-15	2019-01-03	dfgdfg	dfgdfg	2019-01-03 04:41:12	LPZ	dgdfdfg	C	U	dfgdf	dfgdfg	2	8	\N	\N	dfgdfg	dfgdfg	\N	2019-01-03	2019-01-02	4345345	345345	EJECUCION	2019-01-04	2019-01-17	345345	\N	5	5	4	admin	\N	\N	\N	\N	1	1	1
12	SMP-412019-103	2019-01-04	sdfsd	sdfsd	2019-01-04 20:34:51	LPZ	sdfsdf	C	U	sdfs	sdfsdf	1	1	sdfsd	sdfsdf	sdfsdf	sdfsdfsd	\N	2019-01-04	2019-01-01	2343242	234234	INICIAL	2019-01-04	2019-01-04	\N	\N	2	2	3	admin	\N	\N	\N	\N	1	15	74
13	SMP-412019-109	2019-01-04	sdfsdf	sdfsd	2019-01-04 20:57:34	SCZ	sdfsdf	C	U	sdfsdf	sdfsd	1	1	sdfsd	sdfsdf	sdfsd	sdfsdfs	\N	2019-01-02	2019-01-01	32423	32423	INICIAL	\N	\N	\N	\N	3	3	4	admin	\N	\N	\N	\N	1	23	95
14	SMP-412019-110	2019-01-04	sdfsdf	sdfsdf	2019-01-04 21:06:25	LPZ	sdfsdf	C	U	sdfsd	sdfsdf	1	1	sdfsdf	sdfsd	sdfsdf	sdfsdfsdf	\N	2019-01-03	2019-01-02	324234	324234	INICIAL	\N	\N	\N	\N	1	2	3	admin	\N	\N	\N	\N	1	15	74
15	SMP-412019-112	2019-01-04	sdfsdf	sdfsdf	2019-01-04 21:14:13	LPZ	dsfsdf	C	U	sdfsd	sdfsdf	1	1	sdfsd	sdfds	sdfsdf	sdfsdf	\N	2019-01-04	2019-01-03	23424	3242	INICIAL	\N	\N	\N	\N	1	2	3	admin	\N	\N	\N	\N	1	15	75
16	SMP-412019-113	2019-01-04	sdfsd	sdfsdf	2019-01-04 21:22:16	LPZ	sdfsdf	C	PU	sdfsd	sdfsd	2	8	sdfsd	sdfsdf	sdfsdf	sdfdsf	\N	2019-01-01	2019-01-03	23423	32423	INICIAL	\N	\N	\N	\N	6	7	8	admin	\N	\N	\N	\N	1	15	74
17	SMP-412019-115	2019-01-04	sdfsd	sdfsdf	2019-01-04 21:43:54	LPZ	dsfsdfsd	C	PU	sdfsdf	sdfsdf	1	1	sdff	sdfsdf	sdfsdf	sdfsdf	\N	2019-01-04	2019-01-03	231	2323	INICIAL	\N	\N	\N	\N	2	3	4	admin	\N	\N	\N	\N	1	15	75
18	SMP-412019-116	2019-01-04	sdfsdf	sdfsdf	2019-01-04 21:47:44	LPZ	dsfsdfs	C	U	sdfdsf	sdfsd	1	1	sdfsdf	sdfsdf	sdfsdf	sdfsdfsd	\N	2019-01-03	2019-01-02	32434	234234	INICIAL	\N	\N	\N	\N	2	3	4	admin	\N	\N	\N	\N	1	1	1
20	SMP-412019-117	2019-01-04	sdfsdf	sdfsdf	2019-01-04 22:05:06	LPZ	sdfsdf	C	U	sdfsdf	sdfsdf	1	1	sdfsdfsd	sdfsdf	sdfsdf	sdfsdf	\N	2019-01-04	2019-01-04	231321	213213	INICIAL	\N	\N	\N	\N	2	3	4	admin	\N	\N	\N	\N	1	15	74
2	SMP-27122018-2	2018-12-27	La construcción, de la Unidad Educativa Evo Morales Ayma, proporcionara a la población, de edad escolar del Municipio de Cobija, una amplia infraestructura moderna, diseñada para proteger al alumnado de factores adversos internos y externos y también de las inclemencias del tiempo.	asdasd	2018-12-27 15:56:00	PDO	Unidad Educativa Técnico Humanístico Evo Morales	C	U	asdas	asd	1	1	sadasd	asdasd	asdasd	EMPRESA CONSTRUCTORA VIGODA	\N	2018-12-01	2020-08-07	200000000	200000000	2	2018-12-01	2018-12-13	5000000	\N	3	4	5	admin	\N	\N	\N	\N	14	94	285
21	SMP-412019-118	2019-01-04	sdfsdf	sdfsdf	2019-01-04 22:07:41	LPZ	sdfsdf	C	U	sdfsd	sdfsd	1	1	sdfsdf	sdfsdf	sdfsdf	sdfsdf	\N	2019-01-01	2019-01-10	23432	34324	INICIAL	\N	\N	\N	\N	\N	\N	\N	admin	\N	\N	\N	\N	1	2	7
22	SMP-412019-120	2019-01-04	sdfsdf	sdfsd	2019-01-04 22:16:21	LPZ	sdfsdf	C	PU	sdfsdf	sdfsd	1	1	sdfsd	sdfsdf	sdfsdf	sdfsdf	\N	2019-01-02	2019-01-09	324234	324324	INICIAL	\N	\N	\N	\N	3	4	5	admin	\N	\N	\N	\N	1	14	\N
23	SMP-412019-121	2019-01-04	dfgdfg	dfgdf	2019-01-04 22:18:06	SCZ	rtret	C	U	dfgdf	dfgdf	1	1	dfgfdg	dgfdg	dfgfdg	dfgdfg	\N	2019-01-01	2019-01-02	45353	3454	INICIAL	\N	\N	\N	\N	\N	\N	\N	admin	\N	\N	\N	\N	1	21	88
24	SMP-412019-122	2019-01-04	sdfsd	sdfsdf	2019-01-04 22:20:17	SCZ	sdfsdf	C	PU	sdfsdf	sdfsdf	1	1	sdfsdf	sdfsdf	sdfdsf	sdfdsf	\N	2019-01-03	2019-01-02	3424	23423	INICIAL	\N	\N	\N	\N	12	34	4	admin	\N	\N	\N	\N	1	25	102
25	SMP-412019-126	2019-01-04	sdfsdf	sdfsdf	2019-01-04 22:44:34	TJA	sddfsf	C	U	sdfsdf	sdfsdf	8	43	sdfsdf	sdfsdf	sdfsdf	sdfsdf	\N	2019-01-03	2019-01-03	34234	234234	ACTIVO	2019-01-02	2019-01-01	345345	\N	\N	\N	\N	admin	\N	\N	\N	\N	1	87	268
26	SMP-412019-128	2019-01-05	erter	ertert	2019-01-05 01:27:49	LPZ	rrtert	C	U	erter	ertert	1	1	erter	ertr	ertert	ertret	\N	2019-01-03	2019-01-11	32423	32434	ACTIVO	2019-01-01	2019-01-03	43232	\N	3	4	5	monitor.portal	\N	\N	\N	\N	2	15	74
27	SMP-512019-130	2019-01-05	etert	erter	2019-01-05 17:02:13	LPZ	rterte	C	U	ertert	ertert	1	1	ertert	ertert	retert	ertert	\N	2019-01-03	2019-01-03	234234	23432	ACTIVO	2019-01-01	2019-01-03	2342	\N	3	4	5	monitor.portal	DIRECCION NACIONAL COMPLETO.doc	\N	\N	\N	2	15	74
28	SMP-612019-135	2019-01-06	sfsdf	sdfsdf	2019-01-06 16:22:21	SCZ	sdfsdf	C	PU	sdfsd	sdfsdf	1	1	sdfds	sdfsdf	asdasd	asdasdsa	\N	2019-01-01	2022-06-09	100000000	100000000	1	2019-01-01	2019-02-07	400000	\N	3	4	5	monitor.portal	Preguntas1.docx	Preguntas 2.docx	Preguntas 3.docx	\N	1	23	95
29	SMP-612019-136	2019-01-06	sdfsdf	sdfsdf	2019-01-06 17:06:32	SCZ	sdfsdf	C	U	sfsdf	sdfsdf	1	1	sdfsdf	sdfsdf	werwer	werwer	\N	2019-01-03	2019-01-03	234234	234234	1	2019-01-01	2019-01-04	234234	\N	3	4	5	monitor.portal	Documento A.docx	Documento B.docx	Documento C.docx	Documento D.docx	2	32	135
30	SMP-612019-143	2019-01-06	sfsdf	sfdsf	2019-01-06 20:36:31	LPZ	sfsdfsdf	C	U	sfsdf	sdfsdf	1	1	sdfdsf	sdfsd	sfdfss	sfsd	\N	2019-01-04	2019-01-03	23423	234234	10	2019-01-01	2019-01-02	1	\N	343	343	343	monitor.portal	\N	\N	\N	\N	1	15	74
31	SMP-612019-144	2019-01-07	werwe	werwer	2019-01-07 00:49:51	LPZ	werwer	C	PU	werwe	werwe	1	1	werewr	werwer	ewrwer	ewrwerw	\N	2019-01-04	2019-01-01	23423	234234	1	2019-01-03	2019-01-03	234324	\N	3	3	4	monitor.portal	\N	\N	\N	\N	1	1	2
1	SMP-27122018-1	2018-12-27	Ampliación de la Capacidad de Almacenaje (ICA) - Primera Fase a traves de la construcción de tanques para Gasolina Especial y Diesel Oil en las Plantas Santa Cruz, Oruro, La Paz (Senkata),	asdasd	2019-01-07 13:53:05	LPZ	Ampliación de la Capacidad de Almacenaje (ICA) - Primera Fase en Santa Cruz, Oruro, La Paz (Senkata)	C	U	sdsad	asdas	1	1	asdasd	asdasd	asdasd	COTEOR - Oruro\t	\N	2018-12-01	2019-07-12	300000000	300000000	3	2018-12-01	2018-12-20	20000000	\N	3	4	5	admin	documento A.docx	documento B.docx	documento C.docx	\N	2	1	5
32	SMP-812019-161	2019-01-08	sdfsdf	sdfsdf	2019-01-08 20:23:23	CHQ	dsfsdf	C	U	sdfsdf	sdfdsf	10	56	sdfsdf	sdfds	sdfsdf	dsfdsf	\N	2019-01-16	2019-01-30	2323	2323	\N	2019-01-08	2019-01-08	\N	\N	2	3	4	admin	\N	\N	\N	\N	1	81	254
33	SMP-812019-162	2019-01-08	sdfsdf	sdfsdf	2019-01-08 20:26:54	LPZ	sdfsdf	C	U	sdfsdf	sdfdfs	1	1	sdfsd	sdfsdf	sdff	sfdf	\N	2019-01-03	2019-01-03	12122	121212	1	2019-01-01	2019-01-20	44324	\N	3	4	5	admin	\N	\N	\N	\N	11	13	65
34	SMP-812019-163	2019-01-08	df	df	2019-01-08 20:35:25	SCZ	sdfdsfsd	C	U	d	f	1	1	dfdfd	dfdf	dfdf	erwerewr	\N	2019-01-03	2019-01-31	23233	23333	1	2019-01-02	2019-01-31	40000	\N	2	3	4	admin	\N	\N	\N	\N	11	28	116
35	SMP-1012019-148	2019-01-10	sdfsd	sdfsd	2019-01-10 15:04:41	LPZ	dfsfsdf	C	U	sdf	dsfsd	1	1	sdfsdf	sdfsdf	sfsdf	sdfsdf	\N	2019-01-10	2019-01-09	23424	324324	1	2019-01-02	2019-01-01	23121	\N	3	3	4	monitor.portal	\N	\N	\N	\N	1	16	76
38	SMP-1012019-166	2019-01-10	sdfsd	sdfsd	2019-01-10 15:51:33	LPZ	dfsdfsdf	C	U	sdfsd	sdfsdf	1	1	dsfsdf	sdfsdf	sdfsd	sdfsdf	\N	2019-01-04	2019-01-03	2313	123123	1	2019-01-01	2019-01-02	31231	\N	343	3434	3434	monitor.portal	\N	\N	\N	\N	1	15	74
43	SMP-1012019-189	2019-01-10	ertert	ertert	2019-01-10 17:21:42	LPZ	dfsdfsdfsd	C	U	ertert	ertert	8	43	\N	\N	ertert	erterter	\N	2019-01-01	2019-01-02	324234	234324	1	2019-01-24	2019-01-09	34234	\N	3	4	5	monitor.portal	\N	\N	\N	\N	1	2	6
74	SMP-1012019-277	2019-01-11	d	d	2019-01-11 01:21:54	LPZ	sdfsdf	C	U	d	d	2	8	dd	ddd	\N	sdfd	\N	2019-01-12	2019-01-12	12313	2343423	\N	2019-01-11	2019-01-11	\N	\N	\N	\N	\N	monitor.portal	1 registro.jpg	2registro.jpg	1 registro.jpg	\N	1	13	65
75	SMP-1012019-286	2019-01-11	dgdfg	dfgdfg	2019-01-11 01:41:14	LPZ	sdfgfdsgdfgdsgdfg	C	U	dfgdfg	dfgdf	1	1	dfgdfg	dgf	\N	dfgdfg	\N	2019-01-11	2019-01-12	324234	32434	1	2019-01-01	2019-01-01	45644	\N	\N	\N	\N	monitor.portal	1 registro.jpg	home.jpg	1 registro.jpg	1 registro.jpg	1	15	74
76	SMP-1012019-289	2019-01-11	f	f	2019-01-11 01:51:56	LPZ	sdfsdf	C	U	f	f	1	1	\N	\N	\N	sdfsdf	\N	2019-01-03	2019-01-05	2343	3434	1	2019-01-11	2019-01-11	\N	\N	12	\N	\N	monitor.portal	1 registro.jpg	1 registro.jpg	1 registro.jpg	1 registro.jpg	1	13	65
77	SMP-1012019-294	2019-01-11	dfgdf	dfgdfg	2019-01-11 02:06:47	LPZ	sdfsdf	C	U	dfgdf	dfgdf	1	1	\N	\N	\N	sdfsdf	\N	2019-01-12	2019-01-01	342342	234234	1	2019-01-11	2019-01-11	\N	\N	44	55	12	monitor.portal	1 registro.jpg	1 registro.jpg	2registro.jpg	1 registro.jpg	1	15	74
78	SMP-1012019-295	2019-01-11	erter	ertert	2019-01-11 02:09:41	SCZ	ertert	C	U	ertert	erter	1	1	\N	\N	sdfsdf	ertert	\N	2019-01-02	2019-01-01	3444	3333	1	2019-01-04	2019-01-02	876786	\N	3	55	66	monitor.portal	1 registro.jpg	1 registro.jpg	2registro.jpg	1 registro.jpg	1	22	93
\.


--
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_id_seq', 78, true);


--
-- Data for Name: registro_variable; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY registro_variable (id, proyecto_id, variable_id, valor_variable, tipo) FROM stdin;
\.


--
-- Name: registro_variable_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('registro_variable_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY roles (id, usuario_id, rol) FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: seguimiento; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY seguimiento (id, longitud, latitud, proyecto_id, avance, foto1, foto2, foto3, foto4, foto5, foto6, foto7, foto8, foto9, foto10) FROM stdin;
4	-63.230406045913696	-17.826930511995798	4	60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	-68.66019487380981	-15.970798223061578	7	56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	-68.37854146957397	-16.37760111259081	8	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	-65.7545703184493	-19.586433468934572	11	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	-67.51112043857574	-18.374335457452588	5	98	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	-67.52574920654297	-16.41070736085568	6	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	-64.73604798316956	-21.532222263519827	3	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	-63.1766653060913	-17.44692634081119	10	95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	-67.56497383117674	-15.861494264542713	9	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	-66.07823610305786	-11.019384478933318	2	80	data:image/jpeg;base64,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	data:image/jpeg;base64,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	\N	\N	\N	\N	\N	\N	\N	\N
33	-62.64404296875	-17.49738940066382	33	0	data:image/jpeg;base64,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	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	-68.13340365886688	-16.494356173352074	34	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Name: seguimiento_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('seguimiento_id_seq', 78, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY usuario (id, persona_id, institucion_id, departamento, municipio_id, nombre_usuario, clave, fecha_inicio, fecha_fin, estado, imagen) FROM stdin;
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 1, false);


--
-- Data for Name: valor; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY valor (id, variable_id, valor, habilita, defecto) FROM stdin;
\.


--
-- Name: valor_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('valor_id_seq', 1, false);


--
-- Data for Name: variable; Type: TABLE DATA; Schema: plataforma; Owner: postgres
--

COPY variable (id, grupo_id, nombre_variable, descripcion, control, tipo_dato) FROM stdin;
1	1	constitucion-politica-del-estado-plurinacional-de-bolivia66a4f33c.pdf	CPE		PDF
2	1	ley-n-974-de-unidades-de-transparencia-y-lucha-contra-la-corrupcion62029bbd.pdf			PDF
3	1	convencion-interamericana-contra-la-corrupcione2f7d4b.pdf			PDF
4	1	D. S. 214 Política Nacional de Transparencia.pdf			PDF
\.


--
-- Name: variable_id_seq; Type: SEQUENCE SET; Schema: plataforma; Owner: postgres
--

SELECT pg_catalog.setval('variable_id_seq', 1, false);


SET search_path = portal_transparencia, pg_catalog;

--
-- Data for Name: actividad_archivos_imagenes; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY actividad_archivos_imagenes (id_archivo, id_actividad, path_archivo, fecha_registro, id_usuario, extension_archivo, etapa_archivo) FROM stdin;
\.


--
-- Name: actividad_archivos_imagenes_id_archivo_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('actividad_archivos_imagenes_id_archivo_seq', 1, false);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY actividades (id_actividad, id_tipo_actividad, id_entidad, nombre_actividad, fecha_actividad, fecha_creacion, descripcion_actividad, id_usuario_creador, id_usuario_revisor, fecha_revision, id_estado, direccion_actividad, objetivo_actividad, url_facebook, url_youtube, url_twitter, latitud, longitud, path_imagen_principal) FROM stdin;
\.


--
-- Name: actividades_id_actividad_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('actividades_id_actividad_seq', 1, false);


--
-- Data for Name: articulos; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY articulos (id_articulo, id_componente, titulo_articulo, descripcion_articulo, autor_editor, path_imagen, url_facebook, url_youtube, url_twitter, id_usuario, fecha_registro) FROM stdin;
\.


--
-- Name: articulos_id_articulo_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('articulos_id_articulo_seq', 1, false);


--
-- Data for Name: asistentes; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY asistentes (id_asistente, id_actividad, nro_carnet, fecha_registro, id_usuario, id_organizacion_social, cargo_organizacion_social) FROM stdin;
\.


--
-- Name: asistentes_id_asistente_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('asistentes_id_asistente_seq', 1, false);


--
-- Data for Name: asistentes_rpc; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY asistentes_rpc (id_asistente, id_entidad_rpc, id_actividad, nro_carnet, fecha_registro, id_usuario, id_organizacion_social, cargo_organizacion_social) FROM stdin;
\.


--
-- Name: asistentes_rpc_id_asistente_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('asistentes_rpc_id_asistente_seq', 1, false);


--
-- Data for Name: categoria_entidad; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY categoria_entidad (id_categoria, nombre_categoria) FROM stdin;
\.


--
-- Name: categoria_entidad_id_categoria_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('categoria_entidad_id_categoria_seq', 1, false);


--
-- Data for Name: componente_portal; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY componente_portal (id_componente, nombre_componente, id_usuario, fecha_registro) FROM stdin;
1	asdasdas pureras	\N	2018-09-18 12:39:10
2	okidoki	\N	2018-09-19 03:47:57
3	okidoki	\N	2018-09-19 05:58:46
4	okidoki	\N	2018-09-19 05:59:10
5	okidoki	\N	2018-09-30 15:55:12
6	okidoki	\N	2018-09-30 15:55:35
7	sera	\N	2018-09-30 15:56:00
9	comop seae	\N	2018-09-30 16:33:04
10	comop seae	\N	2018-09-30 16:33:25
11	\N	\N	2018-09-30 19:00:53
12	botellas	\N	2018-09-30 22:32:32
\.


--
-- Name: componente_portal_id_componente_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('componente_portal_id_componente_seq', 13, true);


--
-- Data for Name: consultas_ciudadano; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY consultas_ciudadano (id_consulta, id_componente, nombre_completo, email, telefono_celular, asunto, consulta, id_estado, descripcion_respuesta, path_respuesta, fecha_consulta, id_usuario_respuesta, fecha_respuesta) FROM stdin;
\.


--
-- Name: consultas_ciudadano_id_consulta_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('consultas_ciudadano_id_consulta_seq', 1, false);


--
-- Data for Name: cronogramas; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY cronogramas (id_cronograma, id_entidad_rpc, id_departamento, fecha_creacion, fecha_cronograma, id_usuario, lugar_rendicion) FROM stdin;
\.


--
-- Name: cronogramas_id_cronograma_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('cronogramas_id_cronograma_seq', 1, false);


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY cursos (id_curso, id_entidad, nombre_curso, fecha_registro, fecha_inicio_curso, fecha_final_curso, path_imagen, fecha_inicio_inscripciones, fecha_final_inscripciones, id_componente, modalidad_curso, url_facebook, url_youtube, url_twitter, path_convocatoria) FROM stdin;
\.


--
-- Name: cursos_id_curso_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('cursos_id_curso_seq', 1, false);


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY departamentos (id_departamento, nombre_departamento) FROM stdin;
\.


--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('departamentos_id_departamento_seq', 1, false);


--
-- Data for Name: enlaces_componente; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY enlaces_componente (id_enlace, id_componente, url_enlace, path_imagen, id_usuario, fecha_registro, titulo_enlace) FROM stdin;
\.


--
-- Name: enlaces_componente_id_enlace_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('enlaces_componente_id_enlace_seq', 1, false);


--
-- Data for Name: entidades; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY entidades (id_entidad, id_categoria, nombre_entidad) FROM stdin;
\.


--
-- Name: entidades_id_entidad_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('entidades_id_entidad_seq', 1, false);


--
-- Data for Name: entidades_params_web; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY entidades_params_web (id_entidad_param, id_entidad, id_parametro, url_parametro_web, descripcion_parametro_web, fecha_registro, id_usuario_creador, id_usuario_revisor, fecha_revision, id_estado, observaciones) FROM stdin;
\.


--
-- Name: entidades_params_web_id_entidad_param_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('entidades_params_web_id_entidad_param_seq', 1, false);


--
-- Data for Name: entidades_rpc; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY entidades_rpc (id_entidad_rpc, id_rendicion, id_entidad, fecha_registro, path_rpc, estado_notificacion, id_usuario) FROM stdin;
\.


--
-- Name: entidades_rpc_id_entidad_rpc_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('entidades_rpc_id_entidad_rpc_seq', 1, false);


--
-- Data for Name: horarios_curso; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY horarios_curso (id_horario, id_curso, dias, hora_inicio, hora_final, id_usuario, fecha_registro) FROM stdin;
\.


--
-- Name: horarios_curso_id_horario_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('horarios_curso_id_horario_seq', 1, false);


--
-- Data for Name: invitaciones; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY invitaciones (id_invitacion, id_organizacion_social, id_cronograma, nro_carnet, fecha_registro, id_usuario, cargo_organizacion_social, path_invitacion_escaneada) FROM stdin;
\.


--
-- Name: invitaciones_id_invitacion_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('invitaciones_id_invitacion_seq', 1, false);


--
-- Data for Name: modulos_curso; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY modulos_curso (id_modulo, id_curso, titulo_modulo, descripcion_modulo, fecha_registro, id_usuario) FROM stdin;
\.


--
-- Name: modulos_curso_id_modulo_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('modulos_curso_id_modulo_seq', 1, false);


--
-- Data for Name: organizaciones_sociales; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY organizaciones_sociales (id_organizacion_social, sigla, nombre_completo, id_departamento, descripcion, telefonos, correo_electronico, direccion, id_usuario, fecha_registro) FROM stdin;
\.


--
-- Name: organizaciones_sociales_id_organizacion_social_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('organizaciones_sociales_id_organizacion_social_seq', 1, false);


--
-- Data for Name: parametros_paginas_web; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY parametros_paginas_web (id_parametro, nombre_parametro, descripcion_parametro, id_usuario, fecha_creacion, id_estado) FROM stdin;
\.


--
-- Name: parametros_paginas_web_id_parametro_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('parametros_paginas_web_id_parametro_seq', 1, false);


--
-- Data for Name: personas; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY personas (nro_carnet, id_departamento, id_usuario, profesion, fecha_creacion, telefono_celular) FROM stdin;
\.


--
-- Name: personas_nro_carnet_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('personas_nro_carnet_seq', 1, false);


--
-- Data for Name: requisitos_curso; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY requisitos_curso (id_requisito, id_curso, nombre_requisito, fecha_registro, id_usuario) FROM stdin;
\.


--
-- Name: requisitos_curso_id_requisito_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('requisitos_curso_id_requisito_seq', 1, false);


--
-- Data for Name: resultados_actividad; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY resultados_actividad (id_resultado, id_actividad, id_usuario, fecha_registro, descripcion_resultado, url_facebook, url_youtube, url_twitter, path_acta, path_scaneado_participantes, path_imagen_principal, id_estado) FROM stdin;
\.


--
-- Name: resultados_actividad_id_resultado_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('resultados_actividad_id_resultado_seq', 1, false);


--
-- Data for Name: resultados_rpc; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY resultados_rpc (id_resultado, id_entidad_rpc, id_usuario, fecha_registro, descripcion_resultado, url_facebook, url_youtube, url_twitter, path_acta, path_scaneado_participantes, id_estado) FROM stdin;
\.


--
-- Name: resultados_rpc_id_resultado_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('resultados_rpc_id_resultado_seq', 1, false);


--
-- Data for Name: rpc; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY rpc (id_rendicion, id_tipo_rpc, descripcion_rendicion, id_usuario, fecha_creacion, fecha_inicio, fecha_final) FROM stdin;
\.


--
-- Name: rpc_id_rendicion_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('rpc_id_rendicion_seq', 1, false);


--
-- Data for Name: seccion_informativa; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY seccion_informativa (id_seccion, id_componente, titulo_seccion, descripcion_seccion, path_imagen, id_usuario, fecha_registro) FROM stdin;
\.


--
-- Name: seccion_informativa_id_seccion_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('seccion_informativa_id_seccion_seq', 1, false);


--
-- Data for Name: tipos_actividad; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY tipos_actividad (id_tipo_actividad, id_componente, nombre_tipo_actividad, estado_notificacion, id_estado, id_usuario, fecha_registro) FROM stdin;
\.


--
-- Name: tipos_actividad_id_tipo_actividad_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('tipos_actividad_id_tipo_actividad_seq', 1, false);


--
-- Data for Name: tipos_rpc; Type: TABLE DATA; Schema: portal_transparencia; Owner: postgres
--

COPY tipos_rpc (id_tipo_rpc, nombre_tipo_rpc, id_estado) FROM stdin;
\.


--
-- Name: tipos_rpc_id_tipo_rpc_seq; Type: SEQUENCE SET; Schema: portal_transparencia; Owner: postgres
--

SELECT pg_catalog.setval('tipos_rpc_id_tipo_rpc_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- Data for Name: mensaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mensaje (id, nombre_completo, numero_telefono, email, mensaje) FROM stdin;
\.


--
-- Name: mensaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mensaje_id_seq', 1, false);


--
-- Data for Name: meta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meta (id, pilares_id, descripcion) FROM stdin;
\.


--
-- Name: meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('meta_id_seq', 1, false);


--
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY migration_versions (version) FROM stdin;
20180912183408
20180913144010
20180913144307
20180914140614
20180914164523
20180918160635
\.


--
-- Data for Name: pilares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pilares (id, descripcion) FROM stdin;
\.


--
-- Name: pilares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pilares_id_seq', 1, false);


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY producto (id, nombre, descripcion) FROM stdin;
\.


--
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_id_seq', 1, false);


--
-- Data for Name: seguimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seguimiento (id, longitud, latitud, avance, foto) FROM stdin;
\.


--
-- Name: seguimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seguimiento_id_seq', 1, false);


SET search_path = seguridad, pg_catalog;

--
-- Data for Name: elemento_menu; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY elemento_menu (id, elemento_padre_id, path, texto, icono, posicion, parametros, activo) FROM stdin;
\.


--
-- Name: elemento_menu_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: postgres
--

SELECT pg_catalog.setval('elemento_menu_id_seq', 1, false);


--
-- Data for Name: entidad; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY entidad (id, tipo_entidad_id, departamento_id, alcance_id, entidad_tutora_id, usuario_creador_id, usuario_ultima_modificacion_id, nombre, sigla, activo, fecha_creacion, fecha_ultima_modificacion, id_categoria) FROM stdin;
91	11	5	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE TRINIDAD	GAM-TRI	t	2018-03-07 12:33:30	2018-07-25 11:50:53	3
10004	16	1	19	\N	1	1	BANCO DE DESARROLLO PRODUCTIVO - SOCIEDAD ANÓNIMA MIXTA	BDP-SAM	t	2018-06-07 11:56:56	2018-06-07 11:58:57	6
540	10	1	19	\N	1	1	FONDO DE DESARROLLO DEL SISTEMA FINANCIERO Y APOYO AL SECTOR PRODUCTIVO DE DESARROLLO	FONDESIF	t	2018-03-07 12:33:39	2018-06-25 16:49:47	6
297	11	6	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE BELLA FLOR	GAM-FLO	t	2018-03-07 12:33:34	2018-07-24 17:23:13	6
319	11	2	20	\N	1	1	GOBIERNO AUTONOMO DEPARTAMENTAL DE SANTA CRUZ	GAD-SCZ	t	2018-03-07 12:33:35	2018-08-30 17:57:08	6
10001	11	9	20	45	1	\N	TRIBUNAL DEPARTAMENTAL DE JUSTICIA TARIJA	TDJT	t	2018-04-11 17:51:36	\N	6
868	11	2	20	\N	1	1	YACIMIENTOS PETROLIFEROS FISCALES BOLIVIANOS TRANSIERRA S.A.	YPFB-TRANSIERRA	t	2018-03-07 12:33:44	2018-06-07 12:52:32	6
983	10	1	19	\N	1	\N	VICEMINISTERIO DE COCA Y DESARROLLO INTEGRAL	VCDI	t	2018-06-25 17:20:06	\N	6
723	11	2	20	\N	1	1	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA SANTA CRUZ	CM-SCZ	t	2018-03-07 12:33:42	2018-10-22 15:38:53	6
258	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CHAQUI	GAM-CHQ	t	2018-03-07 12:33:34	2018-06-04 16:20:46	6
385	11	2	20	\N	1	1	YPFB REFINACION S.A.	YPFB-REFINACION	t	2018-03-07 12:33:36	2018-06-07 15:55:06	6
72	11	5	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACIÓN DEL BENI	DDE	t	2018-03-07 12:33:30	\N	2
73	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE BAURES	GAM-BAU	t	2018-03-07 12:33:30	\N	2
74	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EXALTACION	GAM-EXA	t	2018-03-07 12:33:30	\N	2
75	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE HUACARAJE	GAM-HUA	t	2018-03-07 12:33:30	\N	2
76	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LORETO	GAM-LOR	t	2018-03-07 12:33:30	\N	2
77	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MAGDALENA	GAM-MAG	t	2018-03-07 12:33:30	\N	2
78	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO GUAYARAMERIN	GAM-PGU	t	2018-03-07 12:33:30	\N	2
79	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE RURRENABAQUE	GAM-RUR	t	2018-03-07 12:33:30	\N	2
80	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO SILES	GAM-SIL	t	2018-03-07 12:33:30	\N	2
81	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE REYES	GAM-REY	t	2018-03-07 12:33:30	\N	3
82	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE RIBERALTA	GAM-RIB	t	2018-03-07 12:33:30	\N	3
83	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN ANDRES	GAM-SAD	t	2018-03-07 12:33:30	\N	3
84	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN BORJA	GAM-BOR	t	2018-03-07 12:33:30	\N	3
85	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN IGNACIO DE MOJOS	GAM-IGN	t	2018-03-07 12:33:30	\N	3
86	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN JAVIER - SANTA CRUZ	GAM-JAV	t	2018-03-07 12:33:30	\N	3
87	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN JOAQUIN	GAM-JOA	t	2018-03-07 12:33:30	\N	3
88	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN RAMON BENI	GAM-RAM	t	2018-03-07 12:33:30	\N	3
89	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTA ANA DEL YACUMA	GAM-ANA	t	2018-03-07 12:33:30	\N	3
90	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTA ROSA	GAM-ROS	t	2018-03-07 12:33:30	\N	3
93	11	5	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DEL BENI	SSU	t	2018-03-07 12:33:30	\N	3
94	11	5	20	\N	1	\N	SERVICIO AL MEJORAMIENTO DE LA NAVEGACION AMAZONICA	SEMENA	t	2018-03-07 12:33:30	\N	3
95	11	5	20	\N	1	\N	UNIVERSIDAD AUTONOMA DEL BENI JOSE BALLIVIAN	UAB	t	2018-03-07 12:33:30	\N	3
100	11	1	20	\N	1	1	GOBIERNO AUTONOMO DEPARTAMENTAL DE LA PAZ	GAD-LPZ	t	2018-03-07 12:33:30	2018-06-05 17:17:05	3
97	11	1	20	\N	1	\N	EMPRESA MUNICIPAL DE AREAS VERDES Y PARQUES 	EMAVERDE	t	2018-03-07 12:33:30	\N	3
98	11	1	20	\N	1	\N	EMPRESA MUNICIPAL DE ASEO DE EL ALTO	EMALT	t	2018-03-07 12:33:30	\N	3
99	11	1	20	\N	1	\N	EMPRESA MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO VIACHA	EMAPAV	t	2018-03-07 12:33:30	\N	3
101	11	1	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACION LA PAZ	DDELPZ-LPZ	t	2018-03-07 12:33:30	\N	3
102	11	1	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DE LA PAZ	SSULPZ-LPZ	t	2018-03-07 12:33:30	\N	3
103	11	1	20	\N	1	\N	UNIVERSIDAD MAYOR DE SAN ANDRES	UMSA	t	2018-03-07 12:33:30	\N	3
379	11	2	20	\N	1	\N	YPFB OPERACIONES		t	2018-03-07 12:33:36	\N	6
993	11	1	20	\N	1	\N	TRIBUNAL DEPARTAMENTAL DE JUSTICIA DE LA PAZ	TDJ-LPZ	t	2018-06-25 23:07:15	\N	6
111	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ACHOCALLA	GAM-ACH	t	2018-03-07 12:33:30	\N	4
112	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VIACHA	GAM-VIA	t	2018-03-07 12:33:30	\N	4
113	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE GUAQUI 	GAM-GUA	t	2018-03-07 12:33:30	\N	4
141	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHUMA 	GAM-CHU	t	2018-03-07 12:33:31	\N	5
142	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE AYATA 	GAM-AYA	t	2018-03-07 12:33:31	\N	5
143	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE AUCAPATA 	GAM-AUC	t	2018-03-07 12:33:31	\N	5
144	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COROCORO 	GAM-COR	t	2018-03-07 12:33:31	\N	5
145	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CAQUIAVIRI 	GAM-CAQ	t	2018-03-07 12:33:31	\N	5
146	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CALACOTO 	GAM-CAC	t	2018-03-07 12:33:31	\N	5
147	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COMANCHE 	GAM-CMC	t	2018-03-07 12:33:31	\N	5
148	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHARAÑA 	GAM-CHA	t	2018-03-07 12:33:31	\N	5
149	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE WALDO BALLIVIÁN 	GAM-BAL	t	2018-03-07 12:33:31	\N	5
150	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PACAJES 	GAM-NAZ	t	2018-03-07 12:33:31	\N	5
151	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTIAGO DE CALLAPA	GAM-SCA	t	2018-03-07 12:33:31	\N	5
152	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO ACOSTA	GAM-ACO	t	2018-03-07 12:33:31	\N	5
153	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MOCOMOCO	GAM-MOC	t	2018-03-07 12:33:31	\N	5
154	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CARABUCO	GAM-CCH	t	2018-03-07 12:33:31	\N	5
155	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE APOLO	GAM-APO	t	2018-03-07 12:33:31	\N	5
156	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PELECHUCO	GAM-PEL	t	2018-03-07 12:33:31	\N	5
157	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LURIBAY	GAM-LUR	t	2018-03-07 12:33:31	\N	5
158	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAPAHAQUI	GAM-SAPA	t	2018-03-07 12:33:31	\N	5
159	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE YACO	GAM-YAC	t	2018-03-07 12:33:31	\N	5
160	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MALLA	GAM-MAL	t	2018-03-07 12:33:31	\N	5
161	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CAIROMA 	GAM-CAI	t	2018-03-07 12:33:31	\N	5
162	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHULUMANI (VILLA DE LA LIBERTAD) 	GAM-CHL	t	2018-03-07 12:33:32	\N	5
163	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE IRUPANA (VILLA DE LANZA) 	GAM-IRU	t	2018-03-07 12:33:32	\N	5
164	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE YANACACHI 	GAM-YAN	t	2018-03-07 12:33:32	\N	5
165	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PALOS BLANCOS 	GAM-BLA	t	2018-03-07 12:33:32	\N	5
166	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LA ASUNTA 	GAM-ASU	t	2018-03-07 12:33:32	\N	5
167	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUCARANI 	GAM-PUC	t	2018-03-07 12:33:32	\N	5
171	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COROICO 	GAM-COC	t	2018-03-07 12:33:32	\N	6
172	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CORIPATA 	GAM-CRI	t	2018-03-07 12:33:32	\N	6
173	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE IXIAMAS 	GAM-IXI	t	2018-03-07 12:33:32	\N	6
174	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN BUENAVENTURA 	GAM-SBV	t	2018-03-07 12:33:32	\N	6
175	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE GENERAL JUAN JOSÉ PÉREZ (CHARAZANI) 	GAM-CPE	t	2018-03-07 12:33:32	\N	6
486	10	1	19	\N	1	\N	ADUANA NACIONAL	AN	t	2018-03-07 12:33:38	\N	6
551	10	1	19	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA	INRA	t	2018-03-07 12:33:39	\N	6
635	10	1	19	\N	1	\N	DEPOSITOS ADUANEROS BOLIVIANOS	DAB	t	2018-03-07 12:33:41	\N	6
6	10	1	19	\N	1	\N	PARTICULAR CON AFECTACIÓN AL ESTADO	PAR-AFEC-ES	t	2018-04-11 10:53:57	\N	1
0	10	1	19	\N	1	\N	PARTICULAR	PAR	t	2018-04-11 10:53:17	\N	1
11	11	8	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE TARVITA	GAM-TAR	t	2018-03-07 12:33:29	2018-06-07 17:15:32	1
37	11	8	20	\N	1	1	GOBIERNO AUTONOMO DEPARTAMENTAL DE CHUQUISACA	GAD-CHU	t	2018-03-07 12:33:29	2018-06-06 09:13:58	1
1	10	1	19	\N	1	\N	PROCURADURIA GENERAL DEL ESTADO	PGE	t	2018-03-07 12:33:29	\N	1
2	11	8	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACIÓN CHUQUISACA	DDE - CH	t	2018-03-07 12:33:29	\N	1
3	11	8	20	\N	1	\N	PROYECTO SUCRE CIUDAD UNIVERSITARIA	PSCU	t	2018-03-07 12:33:29	\N	1
4	10	8	19	\N	1	\N	TRIBUNAL AGROAMBIENTAL	TA	t	2018-03-07 12:33:29	\N	1
5	10	8	19	\N	1	\N	CONSEJO DE LA MAGISTRATURA	CM	t	2018-03-07 12:33:29	\N	1
7	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SUCRE	GAM - SUC	t	2018-03-07 12:33:29	\N	1
8	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE YOTALA 	GAM - YOT	t	2018-03-07 12:33:29	\N	1
9	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE POROMA	GAM - POR	t	2018-03-07 12:33:29	\N	1
13	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PRESTO	GAM - PRE	t	2018-03-07 12:33:29	\N	1
14	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MOJOCOYA	GAM - VMO	t	2018-03-07 12:33:29	\N	1
15	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ICLA	GAM - MUJ	t	2018-03-07 12:33:29	\N	1
16	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PADILLA	GAM - PAD	t	2018-03-07 12:33:29	\N	1
17	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TOMINA	GAM - VTM	t	2018-03-07 12:33:29	\N	1
18	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SOPACHUY	GAM _ SOP	t	2018-03-07 12:33:29	\N	1
19	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLA ALCALA	GAM - ALC	t	2018-03-07 12:33:29	\N	1
20	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EL VILLAR	GAM-VIL	t	2018-03-07 12:33:29	\N	1
21	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MONTEAGUDO	GAM - VMT	t	2018-03-07 12:33:29	\N	1
22	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PABLO DE HUACARETA 	GAM - PDM	t	2018-03-07 12:33:29	\N	1
23	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TARABUCO	GAM - TARB	t	2018-03-07 12:33:29	\N	1
24	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE YAMPARAEZ	GAM - YAM	t	2018-03-07 12:33:29	\N	1
25	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CAMARGO	GAM - CAM	t	2018-03-07 12:33:29	\N	1
26	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN LUCAS	GAM - LUC	t	2018-03-07 12:33:29	\N	1
27	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE INCAHUASI	GAM - INCA	t	2018-03-07 12:33:29	\N	1
28	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLA SERRANO	GAM - SER	t	2018-03-07 12:33:29	\N	1
29	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CAMATAQUI (VILLA ABECIA)	GAM - ABE	t	2018-03-07 12:33:29	\N	1
30	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CULPINA	GAM - CUL	t	2018-03-07 12:33:29	\N	1
31	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LAS CARRERAS	GAM - CRR	t	2018-03-07 12:33:29	\N	1
32	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLA VACA GUZMAN	GAM - MUY	t	2018-03-07 12:33:29	\N	1
33	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLA HUACAYA	GAM - VHY	t	2018-03-07 12:33:29	\N	1
34	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MACHARETI	GAM - MAC	t	2018-03-07 12:33:29	\N	1
35	11	8	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLA CHARCAS	GAM - VCH	t	2018-03-07 12:33:29	\N	1
36	11	8	20	\N	1	\N	EMPRESA LOCAL DE AGUA POTABLE Y ALCANTARILLADO	ELAPAS	t	2018-03-07 12:33:29	\N	1
38	11	8	20	\N	1	\N	UNIVERSIDAD MAYOR REAL Y PONTIFICIA DE SAN FRANCISCO XAVIER DE CHUQUISACA	UMRPSFXCH	t	2018-03-07 12:33:29	\N	1
39	11	8	20	\N	1	\N	UNIVERSIDAD INDÍGENA BOLIVIANA COMUNITARIA INTERCULTURAL PRODUCTIVA APIAGUAIKI TUPA	UNIBOL -AT	t	2018-03-07 12:33:30	\N	1
40	11	8	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DE CHUQUISACA	SSU	t	2018-03-07 12:33:30	\N	1
41	10	8	19	\N	1	\N	TRIBUNAL CONSTITUCIONAL PLURINACIONAL	TCP	t	2018-03-07 12:33:30	\N	1
42	11	8	20	\N	1	\N	EMPRESA MUNICIPAL DE ÁREAS VERDES 	EMAV	t	2018-03-07 12:33:30	\N	1
43	11	8	20	\N	1	\N	EMPRESA MUNICIPAL DE ASEO URBANO	EMAS	t	2018-03-07 12:33:30	\N	1
44	11	8	20	\N	1	\N	ESCUELA DE JUECES DEL ESTADO 	EJE	t	2018-03-07 12:33:30	\N	1
45	10	8	19	\N	1	\N	TRIBUNAL SUPREMO DE JUSTICIA	TSJ	t	2018-03-07 12:33:30	\N	1
10	11	8	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE VILLA AZURDUY	GAM - AZU	t	2018-03-07 12:33:29	2018-06-25 14:52:02	1
12	11	8	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE VILLA ZUDAÑEZ	GAM-ZUD	t	2018-03-07 12:33:29	2018-06-25 16:41:01	1
104	11	1	20	\N	1	\N	UNIVERSIDAD  PUBLICA DE EL ALTO	UPEA	t	2018-03-07 12:33:30	\N	3
105	11	1	20	\N	1	\N	UNIVERSIDAD INDÍGENA BOLIVIANA COMUNITARIA INTERCULTURAL PRODUCTIVA TUPAK KATARI	UNIBOLTK	t	2018-03-07 12:33:30	\N	3
106	11	1	20	\N	1	\N	CENTRO DE INVESTIGACIONES ARQUEOLOGICAS, ANTROPOLOGICAS Y ADMINISTRACION TIAHUANACU	CIAAAT	t	2018-03-07 12:33:30	\N	3
107	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LA PAZ	GAM-LPZ	t	2018-03-07 12:33:30	\N	3
109	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PALCA	GAM-PLC	t	2018-03-07 12:33:30	\N	3
110	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MECAPACA	GAM-MEC	t	2018-03-07 12:33:30	\N	3
108	11	1	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE EL ALTO	GAM-ELLA	t	2018-03-07 12:33:30	2018-10-22 15:51:57	3
114	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TIAHUANACU 	GAM-TIA	t	2018-03-07 12:33:31	\N	4
115	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE DESAGUADERO 	GAM-DES	t	2018-03-07 12:33:31	\N	4
116	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CARANAVI 	GAM-CRV	t	2018-03-07 12:33:31	\N	4
117	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SICA SICA (VILLA AROMA) 	GAM-SIC	t	2018-03-07 12:33:31	\N	4
118	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE UMALA 	GAM-UMA	t	2018-03-07 12:33:31	\N	4
119	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE AYO AYO 	GAM-AYO	t	2018-03-07 12:33:31	\N	4
120	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CALAMARCA 	GAM-CAL	t	2018-03-07 12:33:31	\N	4
121	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PATACAMAYA 	GAM-PAT	t	2018-03-07 12:33:31	\N	4
122	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLQUENCHA 	GAM-COL	t	2018-03-07 12:33:31	\N	4
123	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLLANA 	GAM-COA	t	2018-03-07 12:33:31	\N	4
124	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE INQUISIVI 	GAM-INQ	t	2018-03-07 12:33:31	\N	4
125	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE QUIME 	GAM-QUI	t	2018-03-07 12:33:31	\N	4
126	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CAJUATA	GAM-CAJ	t	2018-03-07 12:33:31	\N	4
127	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLQUIRI	GAM-COQ	t	2018-03-07 12:33:31	\N	4
128	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ICHOCA 	GAM-ICH	t	2018-03-07 12:33:31	\N	4
129	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LICOMA PAMPA 	GAM-LIC	t	2018-03-07 12:33:31	\N	4
130	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ACHACACHI 	GAM-AHI	t	2018-03-07 12:33:31	\N	4
131	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ANCORAIMES 	GAM-ANCO	t	2018-03-07 12:33:31	\N	4
132	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SORATA 	GAM-SOR	t	2018-03-07 12:33:31	\N	4
133	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE GUANAY 	GAM-GNY	t	2018-03-07 12:33:31	\N	4
134	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TACACOMA 	GAM-TAT	t	2018-03-07 12:33:31	\N	4
135	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TIPUANI 	GAM-TIP	t	2018-03-07 12:33:31	\N	4
136	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE QUIABAYA 	GAM-QBY	t	2018-03-07 12:33:31	\N	4
137	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COMBAYA 	GAM-COM	t	2018-03-07 12:33:31	\N	4
138	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COPACABANA 	GAM-COP	t	2018-03-07 12:33:31	\N	4
139	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PEDRO DE TIQUINA 	GAM-SPT	t	2018-03-07 12:33:31	\N	4
140	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TITO YUPANQUI 	GAM-YUP	t	2018-03-07 12:33:31	\N	4
168	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LAJA	GAM-LAJ	t	2018-03-07 12:33:32	\N	5
169	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE BATALLAS 	GAM-BAT	t	2018-03-07 12:33:32	\N	5
170	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO PÉREZ	GAM-PER	t	2018-03-07 12:33:32	\N	5
984	10	1	19	\N	1	\N	ASAMBLEA LEGISLATIVA PLURINACIONAL	ALP	t	2018-06-25 17:29:59	\N	6
324	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CAMIRI	GAM-CMR	t	2018-03-07 12:33:35	2018-07-25 12:00:00	6
397	11	9	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE ENTRE RIOS	GAM-RIO	t	2018-03-07 12:33:36	2018-11-12 17:43:37	6
10002	11	5	20	\N	1	\N	GOBIERNO AUTONOMO DEPARTAMENTAL DEL BENI	GAD-BEN	t	2018-06-04 17:27:14	\N	6
10005	15	1	19	\N	1	1	SOCIEDAD ADMINISTRATIVA DE FONDOS DE INVERSION UNION S.A.	SAFI-UNION	t	2018-06-07 16:31:35	2018-06-07 16:32:50	6
985	11	2	20	\N	1	\N	TRIBUNAL SUPREMO DE JUSTICIA SANTA CRUZ	TSJ-SCZ	t	2018-06-25 18:29:01	\N	6
996	10	1	19	\N	1	1	MINISTERIO DE DESARROLLO RURAL Y TIERRAS PROGRAMA EMPODERAR	EMPODERAR	t	2018-07-27 10:52:44	2018-07-27 16:19:46	6
998	10	1	19	\N	1	\N	AUTORIDAD DE SUPERVISIÓN DE LA SEGURIDAD SOCIAL DE CORTO PLAZO	ASUSS	t	2018-11-30 16:09:11	\N	6
338	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE LA GUARDIA	LGU	t	2018-03-07 12:33:35	2018-06-04 17:34:43	6
986	10	1	19	\N	1	1	SERVICIO GENERAL DE LICENCIAS PARA CONDUCIR	SEGELIC	t	2018-06-25 18:34:14	2018-06-25 18:35:09	6
426	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE  COCAPATA	GAM-CCT	t	2018-03-07 12:33:37	2018-07-27 10:53:47	6
315	11	2	20	\N	1	1	CENTRO DE INVESTIGACIÓN AGRÍCOLA TROPICAL	CIAT	t	2018-03-07 12:33:35	2018-11-30 16:21:47	6
450	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE PUNATA	GAM-PNT	t	2018-03-07 12:33:38	2018-06-04 17:39:42	6
10006	10	1	19	\N	1	1	ORGANO JUDICIAL	OJ	t	2018-06-25 10:35:34	2018-06-25 10:36:00	6
10007	11	4	20	\N	1	1	FISCALIA DEPARTAMENTAL DE COCHABAMBA	FIS-CBBA	t	2018-06-25 10:50:11	2018-06-25 10:50:42	6
10008	11	7	20	\N	1	1	TRIBUNAL DEPARTAMENTAL DE JUSTICIA POTOSI	TDJ-PT	t	2018-06-25 10:58:58	2018-06-25 11:03:09	6
10009	11	4	20	\N	1	1	TRIBUNAL DEPARTAMENTAL DE JUSTICIA COCHABAMBA	TDJ-CBBA	t	2018-06-25 11:06:22	2018-06-25 11:06:41	6
10010	11	4	20	\N	1	\N	ORGANISMO OPERATIVO DE TRANSITO COCHABAMBA	OTT-CBBA	t	2018-06-25 11:12:17	\N	6
10011	10	1	19	\N	1	1	EMPRESA PÚBLICA SOCIAL DE AGUA Y SANEAMIENTO S.A.	EPSAS	t	2018-06-25 11:33:00	2018-06-25 11:34:02	6
10012	10	1	19	\N	1	1	DIRECCION GENERAL DE REGISTRO, CONTROL Y ADMINISTRACION DE BIENES INCAUTADOS	DIRCABI	t	2018-06-25 11:37:26	2018-06-25 11:37:44	6
987	10	8	19	\N	1	1	CONSEJO DE LA JUDICATURA - SUCRE	CJ-CHU	t	2018-06-25 18:39:48	2018-06-25 18:40:16	6
997	10	1	19	\N	1	1	FONDO NACIONAL DE DESARROLLO INTEGRAL	FONADIN	t	2018-07-27 15:35:23	2018-07-27 16:14:20	6
451	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE QUILLACOLLO	GAM-QLL	t	2018-03-07 12:33:38	2018-11-30 17:14:23	6
418	10	4	19	\N	1	1	EMPRESA NACIONAL DE ELECTRICIDAD	ENDE	t	2018-03-07 12:33:37	2018-06-04 18:01:01	6
977	10	1	19	\N	1	\N	FONDO NACIONAL DE VIVIENDA SOCIAL - EN LIQUIDACION	FONVIS	t	2018-06-25 12:16:58	\N	6
988	10	1	19	\N	1	\N	OFICINA DE DERECHOS REALES	DR	t	2018-06-25 18:49:28	\N	6
618	10	1	19	\N	1	1	PRO - BOLIVIA	PRO-BOL	t	2018-03-07 12:33:41	2018-07-27 17:33:44	6
259	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CHAYANTA	GAM-CHY	t	2018-03-07 12:33:34	2018-11-30 17:20:33	6
10003	10	5	19	\N	1	1	AGENCIA BOLIVIANA DE ENERGIA NUCLEAR	ABEN	t	2018-06-04 18:17:04	2018-06-04 18:17:23	6
978	11	4	20	\N	1	\N	SERVICIO AUTÓNOMO MUNICIPAL DE AGUA POTABLE Y ALCANTARRILLADO COCHABAMBA	SEMAPA-CBBA	t	2018-06-25 12:18:31	\N	6
989	10	1	19	\N	1	\N	VICEMINISTERIO DE LA MICRO Y PEQUEÑA EMPRESA	VMPE	t	2018-06-25 19:19:10	\N	6
999	13	9	20	393	1	\N	HOSPITAL VIRGEN DE CHAGUAYA DE BERMEJO	HVCH	t	2018-12-06 17:37:44	\N	6
979	11	1	20	\N	1	\N	COOPERATIVA DE TELEFONOS LA PAZ	COTEL	t	2018-06-25 12:26:56	\N	6
990	11	9	20	\N	1	1	GOBIERNO AUTONOMO REGIONAL DEL GRAN CHACO	GAR-GCH	t	2018-06-25 19:23:16	2018-08-30 16:41:05	6
261	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CKOCHAS	GAM-CKO	t	2018-03-07 12:33:34	2018-06-05 16:42:36	6
980	11	2	20	\N	1	\N	TRIBUNAL DEPARTAMENTAL DE JUSTICIA - SANTA CRUZ	TDJ-SCZ	t	2018-06-25 13:00:49	\N	6
991	10	1	20	\N	1	\N	EMBAJADA DE ITALIA	EMB-ITALIA	t	2018-06-25 22:34:57	\N	6
320	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE ASCENCIÓN DE GUARAYOS	GAM-ADG	t	2018-03-07 12:33:35	2018-06-05 16:56:35	6
981	15	8	20	\N	1	\N	COOPERATIVA DE TELECOMUNICACIONES SUCRE	COTES	t	2018-06-25 16:42:44	\N	6
992	10	1	19	\N	1	\N	VICEMINISTERIO DE PENSIONES Y SERVICIOS FINANCIEROS	VCPSF	t	2018-06-25 22:56:45	\N	6
176	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CURVA 	GAM-CUR	t	2018-03-07 12:33:32	\N	6
177	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PEDRO DE CURAHUARA	GAM-PEC	t	2018-03-07 12:33:32	\N	6
178	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PAPEL PAMPA	GAM-PAP	t	2018-03-07 12:33:32	\N	6
179	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHACARILLA 	GAM-CLL	t	2018-03-07 12:33:32	\N	6
180	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTIAGO DE MACHACA 	GAM-SMA	t	2018-03-07 12:33:32	\N	6
181	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CATACORA 	GAM-CAT	t	2018-03-07 12:33:32	\N	6
182	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MAPIRI 	GAM-MAP	t	2018-03-07 12:33:32	\N	6
183	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TEOPONTE 	GAM-TEO	t	2018-03-07 12:33:32	\N	6
184	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN ANDRÉS DE MACHACA 	GAM-AMA	t	2018-03-07 12:33:32	\N	6
185	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE JESUS DE MACHACA 	GAM-JMK	t	2018-03-07 12:33:32	\N	6
186	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TARACO 	GAM-TCO	t	2018-03-07 12:33:32	\N	6
187	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE HUARINA 	GAM-HUAR	t	2018-03-07 12:33:32	\N	6
188	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTIAGO DE HUATA 	GAM-SAH	t	2018-03-07 12:33:32	\N	6
189	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ESCOMA 	GAM-ESC	t	2018-03-07 12:33:32	\N	6
190	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE HUMANATA 	GAM-HUMA	t	2018-03-07 12:33:32	\N	6
191	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ALTO BENI 	GAM-ABN	t	2018-03-07 12:33:32	\N	6
192	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE HUATAJATA	GAM-HUAT	t	2018-03-07 12:33:32	\N	6
193	11	1	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHUA COCANI	GAM-CHCO	t	2018-03-07 12:33:32	\N	6
194	10	1	19	\N	1	\N	COMITE EJECUTIVO DE LA UNIVERSIDAD BOLIVIANA		t	2018-03-07 12:33:32	\N	6
195	11	1	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE RIEGO LA PAZ	SEDERI	t	2018-03-07 12:33:32	\N	6
196	11	2	20	\N	1	\N	SEGURO INTEGRAL DE SALUD		t	2018-03-07 12:33:32	\N	6
198	11	1	20	\N	1	\N	SERVICIO AUTONOMO MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO	SAMAPA	t	2018-03-07 12:33:32	\N	6
199	11	1	20	\N	1	\N	EMPRESA MUNICIPAL DE ASFALTOS Y VIAS	EMAVIAS	t	2018-03-07 12:33:32	\N	6
200	11	3	20	\N	1	\N	EMPRESA METALURGICA VINTO NACIONALIZADA	VINTO-NAL-ORU	t	2018-03-07 12:33:32	\N	6
201	11	3	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACION ORURO	DDE-ORU	t	2018-03-07 12:33:32	\N	6
202	11	3	20	\N	1	\N	GOBIERNO AUTONOMO DEPARTAMENTAL DE ORURO	GAD-ORU	t	2018-03-07 12:33:32	\N	6
203	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ORURO	GAM-ORU	t	2018-03-07 12:33:32	\N	6
204	11	3	20	\N	1	\N	SERVICIO LOCAL DE ACUEDUCTOS Y ALCANTARILLADO	SELA	t	2018-03-07 12:33:32	\N	6
205	11	3	20	\N	1	\N	UNIVERSIDAD TECNICA DE ORURO	UTO	t	2018-03-07 12:33:32	\N	6
206	11	3	20	\N	1	\N	ESCUELA BOLIVIANA INTERCULTURAL DE MUSICA	EBIM	t	2018-03-07 12:33:32	\N	6
207	11	3	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE RIEGO ORURO	SEDERI-ORU	t	2018-03-07 12:33:32	\N	6
208	11	3	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DE ORURO	SSUORU	t	2018-03-07 12:33:32	\N	6
209	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CARACOLLO	GAM-CAR	t	2018-03-07 12:33:33	\N	6
210	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EL CHORO	GAM-CHO	t	2018-03-07 12:33:33	\N	6
211	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHALLAPATA	GAM-CHT	t	2018-03-07 12:33:33	\N	6
212	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTUARIO DE QUILLACAS	GAM-STQ	t	2018-03-07 12:33:33	\N	6
213	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE HUANUNI	GAM-VHU	t	2018-03-07 12:33:33	\N	6
214	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MACHACAMARCA	GAM-MAR	t	2018-03-07 12:33:33	\N	6
215	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE POOPO	GAM-POO	t	2018-03-07 12:33:33	\N	6
216	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PAZÑA	GAM-PAZ	t	2018-03-07 12:33:33	\N	6
217	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ANTEQUERA	GAM-ANT	t	2018-03-07 12:33:33	\N	6
218	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EUCALIPTUS	GAM-EUC	t	2018-03-07 12:33:33	\N	6
219	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTIAGO DE HUARI	GAM-SHU	t	2018-03-07 12:33:33	\N	6
220	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PEDRO DE TOTORA ORURO	GAM-TTR	t	2018-03-07 12:33:33	\N	6
221	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CORQUE	GAM-CRQ	t	2018-03-07 12:33:33	\N	6
222	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHOQUECOTA	GAM-CHE	t	2018-03-07 12:33:33	\N	6
223	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CURAHUARA DE CARANGAS	GAM-CDC	t	2018-03-07 12:33:33	\N	6
224	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TURCO	GAM-TUR	t	2018-03-07 12:33:33	\N	6
225	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE HUACHACALLA	GAM-HCH	t	2018-03-07 12:33:33	\N	6
226	11	3	20	\N	1	\N	GOBERNO AUTONOMO MUNICIPAL DE ESCARA	GAM-ESA	t	2018-03-07 12:33:33	\N	6
227	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CRUZ DE MACHACAMARCA	GAM-CMA	t	2018-03-07 12:33:33	\N	6
228	11	3	20	\N	1	\N	GOBERNO AUTONOMO MUNICIPAL DE YUNGUYO DE LITORAL	GAM-YUG	t	2018-03-07 12:33:33	\N	6
229	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ESMERALDA	GAM-ASM	t	2018-03-07 12:33:33	\N	6
230	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TOLEDO	GAM-TOL	t	2018-03-07 12:33:33	\N	6
231	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ANDAMARCA	GAM-ADN	t	2018-03-07 12:33:33	\N	6
232	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE BELEN DE ANDAMARCA	GAM-BEL	t	2018-03-07 12:33:33	\N	6
234	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PAMPA AULLAGAS	GAM-PAM	t	2018-03-07 12:33:33	\N	6
235	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LA RIVERA	GAM-RIV	t	2018-03-07 12:33:33	\N	6
236	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TODOS SANTOS	GAM-TOS	t	2018-03-07 12:33:33	\N	6
237	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CARANGAS	GAM-CGA	t	2018-03-07 12:33:33	\N	6
238	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SABAYA	GAM-SAP	t	2018-03-07 12:33:33	\N	6
239	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COIPASA	GAM-COI	t	2018-03-07 12:33:33	\N	6
240	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHIPAYA	GAM-CHP	t	2018-03-07 12:33:33	\N	6
241	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE HUAYLLAMARCA	GAM-SDH	t	2018-03-07 12:33:33	\N	6
242	11	3	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SORACACHI	GAM-SRC	t	2018-03-07 12:33:33	\N	6
243	11	3	20	\N	1	\N	EMPRESA PUBLICA DEPARTAMENTAL HOTEL TERMINAL - TERMINAL DE BUSES DE ORURO	EPDEOR	t	2018-03-07 12:33:33	\N	6
244	11	3	20	\N	1	\N	EMPRESA DE LUZ Y FUERZA ELECTRICA DE ORURO S.A.	ELFEO S.A.	t	2018-03-07 12:33:33	\N	6
246	11	7	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACIÓN POTOSI	DDE	t	2018-03-07 12:33:33	\N	6
247	11	7	20	\N	1	\N	GOBIERNO AUTONOMO DEPARTAMENTAL DE POTOSI	GADP	t	2018-03-07 12:33:33	\N	6
248	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE POTOSI	GAMP	t	2018-03-07 12:33:33	\N	6
249	11	7	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DE POTOSI	S.S.U.P	t	2018-03-07 12:33:33	\N	6
250	11	7	20	\N	1	\N	UNIVERSIDAD AUTONOMA TOMAS FRIAS	UATF	t	2018-03-07 12:33:33	\N	6
251	11	7	20	\N	1	\N	UNIVERSIDAD NACIONAL SIGLO XX	UNSXX	t	2018-03-07 12:33:33	\N	6
252	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ACASIO	GAMCK	t	2018-03-07 12:33:33	\N	6
253	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ARAMPAMPA		t	2018-03-07 12:33:33	\N	6
254	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ATOCHA		t	2018-03-07 12:33:33	\N	6
256	11	7	20	\N	1	\N	GOBIERNO AUTNOMO MUNICIPAL DE CAIZA (D)		t	2018-03-07 12:33:34	\N	6
257	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CARIPUYO		t	2018-03-07 12:33:34	\N	6
260	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHUQUIUTA		t	2018-03-07 12:33:34	\N	6
262	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLCHAK		t	2018-03-07 12:33:34	\N	6
263	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLQUECHACA		t	2018-03-07 12:33:34	\N	6
264	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COTAGAITA		t	2018-03-07 12:33:34	\N	6
266	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE LLICA		t	2018-03-07 12:33:34	\N	6
267	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MOJINETE		t	2018-03-07 12:33:34	\N	6
268	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE OCURI		t	2018-03-07 12:33:34	\N	6
270	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PORCO		t	2018-03-07 12:33:34	\N	6
271	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUNA (VILLA TALAVERA)		t	2018-03-07 12:33:34	\N	6
273	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLA SACACA		t	2018-03-07 12:33:34	\N	6
274	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN AGUSTIN		t	2018-03-07 12:33:34	\N	6
275	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN ANTONIO DE ESMORUCO		t	2018-03-07 12:33:34	\N	6
276	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PABLO DE LIPEZ		t	2018-03-07 12:33:34	\N	6
277	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PEDRO DE BUENA VISTA		t	2018-03-07 12:33:34	\N	6
278	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PEDRO DE QUEMES		t	2018-03-07 12:33:34	\N	6
279	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TACOBAMBA		t	2018-03-07 12:33:34	\N	6
280	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TAHUA		t	2018-03-07 12:33:34	\N	6
281	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TINGUIPAYA		t	2018-03-07 12:33:34	\N	6
282	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TOMAVE		t	2018-03-07 12:33:34	\N	6
283	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TORO TORO		t	2018-03-07 12:33:34	\N	6
284	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TUPIZA		t	2018-03-07 12:33:34	\N	6
286	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE URMIRI		t	2018-03-07 12:33:34	\N	6
287	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE UYUNI		t	2018-03-07 12:33:34	\N	6
289	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VITICHI		t	2018-03-07 12:33:34	\N	6
290	11	7	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE YOCALLA		t	2018-03-07 12:33:34	\N	6
293	11	6	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACION DE PANDO	DDE-PND	t	2018-03-07 12:33:34	\N	6
294	11	6	20	\N	1	\N	EMPRESA PUBLICA MUNICIPAL DE SERVICIOS DE AGUA Y ALCANTARILLADO SANITARIO DE COBIJA 	EPSAS-COBIJA	t	2018-03-07 12:33:34	\N	6
295	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN LORENZO PANDO	GAMSL	t	2018-03-07 12:33:34	\N	6
296	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL  DE VILLA NUEVA	GAMVN	t	2018-03-07 12:33:34	\N	6
298	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE BOLPEBRA	GAMB	t	2018-03-07 12:33:34	\N	6
299	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EL SENA 	GAMS	t	2018-03-07 12:33:34	\N	6
301	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO GONZALO MORENO	GAMPGM	t	2018-03-07 12:33:34	\N	6
302	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE INGAVI	GAMI	t	2018-03-07 12:33:34	\N	6
303	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE NUEVA ESPERANZA	GAMNE	t	2018-03-07 12:33:34	\N	6
304	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PORVENIR 	GAMP	t	2018-03-07 12:33:34	\N	6
233	11	3	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL SALINAS DE GARCI MENDOZA	GAM-SAL	t	2018-03-07 12:33:33	2018-06-07 17:51:58	6
288	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE VILLAZON	GAM-VLZ	t	2018-03-07 12:33:34	2018-06-08 10:27:41	6
265	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE LLALLAGUA	GAM-LLA	t	2018-03-07 12:33:34	2018-06-08 11:24:55	6
269	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE POCOATA	GAM-PCT	t	2018-03-07 12:33:34	2018-06-08 11:49:43	6
272	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE RAVELO	GAM-RAV	t	2018-03-07 12:33:34	2018-07-27 11:01:50	6
305	11	6	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO RICO	GAM-PRI	t	2018-03-07 12:33:35	2018-08-30 16:48:57	6
300	11	6	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE FILADELFIA	GAM-FIL	t	2018-03-07 12:33:34	2018-08-30 17:29:24	6
285	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE UNCIA	GAM-UNC	t	2018-03-07 12:33:34	2018-11-12 18:47:06	6
292	11	6	20	\N	1	1	GOBIERNO AUTONOMO DEPARTAMENTAL DE PANDO	GAD-PAN	t	2018-03-07 12:33:34	2018-11-12 18:52:15	6
255	11	7	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE BETANZOS	GAM-BET	t	2018-03-07 12:33:33	2018-11-30 16:34:04	6
306	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PEDRO (PANDO)	GAMSP	t	2018-03-07 12:33:35	\N	6
307	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTA ROSA  DE ABUNA	GAMSRA	t	2018-03-07 12:33:35	\N	6
308	11	6	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTOS MERCADO 	GAMSM	t	2018-03-07 12:33:35	\N	6
310	11	6	20	\N	1	\N	UNIVERSIDAD AMAZONICA DE PANDO	UAP	t	2018-03-07 12:33:35	\N	6
311	11	6	20	\N	1	\N	ZONA FRANCA COMERCIAL E INDUSTRIAL DE COBIJA	ZOFRA-COBIJA	t	2018-03-07 12:33:35	\N	6
313	10	6	19	\N	1	\N	EMPRESA BOLIVIANA DE ALMENDRA Y DERIVADOS		t	2018-03-07 12:33:35	\N	6
316	11	2	20	\N	1	\N	CORPORACION GESTORA DEL PROYECTO ABAPO - IZOZOG CORGEPAI		t	2018-03-07 12:33:35	\N	6
321	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE BOYUIBE		t	2018-03-07 12:33:35	\N	6
325	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CHARAGUA		t	2018-03-07 12:33:35	\N	6
326	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLPA BELGICA		t	2018-03-07 12:33:35	\N	6
327	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COMARAPA		t	2018-03-07 12:33:35	\N	6
329	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COTOCA CTC		t	2018-03-07 12:33:35	\N	6
330	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CUATRO CAÑADAS		t	2018-03-07 12:33:35	\N	6
332	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EL CARMEN RIVERO TORREZ		t	2018-03-07 12:33:35	\N	6
334	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EL TORNO		t	2018-03-07 12:33:35	\N	6
335	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE FERNANDEZ ALONSO		t	2018-03-07 12:33:35	\N	6
337	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE GUTIERREZ		t	2018-03-07 12:33:35	\N	6
340	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MAIRANA		t	2018-03-07 12:33:35	\N	6
341	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MINEROS		t	2018-03-07 12:33:35	\N	6
343	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MORO MORO		t	2018-03-07 12:33:35	\N	6
344	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE OKINAWA UNO		t	2018-03-07 12:33:35	\N	6
345	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PAILON		t	2018-03-07 12:33:35	\N	6
346	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PAMPA GRANDE		t	2018-03-07 12:33:35	\N	6
348	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PORTACHUELO		t	2018-03-07 12:33:35	\N	6
349	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE POSTRER VALLE		t	2018-03-07 12:33:35	\N	6
350	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PUCARA		t	2018-03-07 12:33:35	\N	6
353	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE QUIRUSILLAS		t	2018-03-07 12:33:36	\N	6
355	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAIPINA		t	2018-03-07 12:33:36	\N	6
356	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAMAIPATA		t	2018-03-07 12:33:36	\N	6
357	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN ANTONIO DE LOMERIO		t	2018-03-07 12:33:36	\N	6
359	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN IGNACIO DE VELASCO		t	2018-03-07 12:33:36	\N	6
360	11	5	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN JAVIER BENI		t	2018-03-07 12:33:36	\N	6
361	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN JOSE		t	2018-03-07 12:33:36	\N	6
362	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN JUAN		t	2018-03-07 12:33:36	\N	6
363	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN JULIAN		t	2018-03-07 12:33:36	\N	6
364	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN MATIAS		t	2018-03-07 12:33:36	\N	6
365	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN MIGUEL DE VELASCO		t	2018-03-07 12:33:36	\N	6
366	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN PEDRO (SANTA CRUZ)		t	2018-03-07 12:33:36	\N	6
367	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN RAFAEL		t	2018-03-07 12:33:36	\N	6
368	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN RAMON SANTA CRUZ		t	2018-03-07 12:33:36	\N	6
370	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTA ROSA DEL SARA		t	2018-03-07 12:33:36	\N	6
371	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TRIGAL		t	2018-03-07 12:33:36	\N	6
372	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE URUBICHA		t	2018-03-07 12:33:36	\N	6
373	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VALLEGRANDE		t	2018-03-07 12:33:36	\N	6
374	11	2	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE WARNES		t	2018-03-07 12:33:36	\N	6
376	11	2	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DE SANTA CRUZ	 SSUSTCRUZ	t	2018-03-07 12:33:36	\N	6
377	11	2	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE RIEGO - SANTA CRUZ	 SEDERI-SCZ	t	2018-03-07 12:33:36	\N	6
378	11	2	20	\N	1	\N	UNIVERSIDAD AUTONOMA GABRIEL RENE MORENO		t	2018-03-07 12:33:36	\N	6
352	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO SUAREZ	GAM-SUA	t	2018-03-07 12:33:35	2018-06-05 16:56:02	6
354	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE ROBORE	GAM-ROB	t	2018-03-07 12:33:36	2018-06-05 17:00:12	6
336	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE GENERAL AGUSTIN SAAVEDRA	GAM-SAA	t	2018-03-07 12:33:35	2018-06-05 17:04:34	6
322	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE BUENA VISTA	GAM-BUE	t	2018-03-07 12:33:35	2018-06-07 17:05:58	6
375	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE YAPACANI	GAM-YAP	t	2018-03-07 12:33:36	2018-06-07 17:28:01	6
323	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CABEZAS	GAM-CAB	t	2018-03-07 12:33:35	2018-06-07 17:39:16	6
309	11	6	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE COBIJA	GAM-CBJ	t	2018-03-07 12:33:35	2018-07-24 17:28:02	6
328	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CONCEPCIÓN	GAM-CON	t	2018-03-07 12:33:35	2018-07-27 10:47:31	6
314	10	2	19	\N	1	1	AUTORIDAD DE FISCALIZACIÓN Y CONTROL SOCIAL DE BOSQUES Y TIERRAS	ABT	t	2018-03-07 12:33:35	2018-07-27 17:14:46	6
318	11	2	20	\N	1	1	EMPRESA SIDERURGICA DEL MUTUN	ES-MUTUN	t	2018-03-07 12:33:35	2018-07-27 18:08:54	6
333	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE EL PUENTE	GAM-PUE	t	2018-03-07 12:33:35	2018-08-30 16:44:56	6
342	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE MONTERO	GAM-MTR	t	2018-03-07 12:33:35	2018-08-30 17:01:14	6
351	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE PUERTO QUIJARRO	GAM-PQO	t	2018-03-07 12:33:35	2018-08-30 17:11:16	6
331	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CUEVO	GAM-CUE	t	2018-03-07 12:33:35	2018-08-30 17:19:36	6
369	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE SANTA CRUZ DE LA SIERRA	GAM-SCZ	t	2018-03-07 12:33:36	2018-10-22 16:06:54	6
339	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE LAGUNILLAS	GAM-LAG	t	2018-03-07 12:33:35	2018-10-22 16:41:17	6
347	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE PORONGO (AYACUCHO)	GAM-PRG	t	2018-03-07 12:33:35	2018-11-08 12:01:27	6
358	11	2	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE SAN CARLOS	GAM-CRL	t	2018-03-07 12:33:36	2018-11-08 12:06:46	6
386	11	2	20	\N	1	\N	INSTITUTO PLURINACIONAL DE ESTUDIO DE LENGUAS Y CULTURAS		t	2018-03-07 12:33:36	\N	6
387	11	2	20	\N	1	\N	COMPLEJO AGROINDUSTRIAL BUENA VISTA		t	2018-03-07 12:33:36	\N	6
388	11	2	20	\N	1	\N	SERVICIO DE CUENCAS-SEARPI		t	2018-03-07 12:33:36	\N	6
390	11	9	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACION TARIJA	DDE-TRJ	t	2018-03-07 12:33:36	\N	6
391	11	9	20	\N	1	\N	EMPRESA MUNICIPAL AUTONOMA DE AGUA POTABLE Y ALCANTARILLADO SANITARIO DE YACUIBA	EMAPYC-TRJ	t	2018-03-07 12:33:36	\N	6
392	11	9	20	\N	1	\N	EMPRESA TARIJEÑA DEL GAS - EMTAGAS	EMTAGAS-TRJ	t	2018-03-07 12:33:36	\N	6
393	11	9	20	\N	1	\N	GOBIERNO AUTONOMO DEPARTAMENTAL DE TARIJA	GAD-TRJ	t	2018-03-07 12:33:36	\N	6
394	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE BERMEJO	GAMBER-TRJ	t	2018-03-07 12:33:36	\N	6
396	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE EL PUENTE TARIJA	GAMEP-TRJ	t	2018-03-07 12:33:36	\N	6
398	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PADCAYA	GAM-PCY	t	2018-03-07 12:33:36	\N	6
399	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN LORENZO TARIJA 	GAM-SL	t	2018-03-07 12:33:37	\N	6
400	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TARIJA	GAM-TRJ	t	2018-03-07 12:33:37	\N	6
401	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE URIONDO (CONCEPCION )	GAMUR-TRJ	t	2018-03-07 12:33:37	\N	6
402	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLAMONTES	GAM-MON	t	2018-03-07 12:33:37	\N	6
403	11	9	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE YACUIBA	GAM-YBC	t	2018-03-07 12:33:37	\N	6
405	11	9	20	\N	1	\N	OFICINA TECNICA NACIONAL DE LOS RIOS PILCOMAYO Y BERMEJO	OTNPB-TRJ	t	2018-03-07 12:33:37	\N	6
406	11	9	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DE TARIJA	SSU-TRJ	t	2018-03-07 12:33:37	\N	6
407	11	9	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE RIEGO TARIJA	SEDERI-TRJ	t	2018-03-07 12:33:37	\N	6
408	11	9	20	\N	1	\N	UNIVERSIDAD AUTONOMA JUAN MISAEL SARACHO	UAJMS-TRJ	t	2018-03-07 12:33:37	\N	6
410	11	9	20	\N	1	\N	ENTIDAD MATADERO FRIGORIFICO MUNICIPAL DE TARIJA		t	2018-03-07 12:33:37	\N	6
411	11	9	20	\N	1	\N	ENTIDAD DE ASEO MUNICIPAL DE TARIJA		t	2018-03-07 12:33:37	\N	6
412	11	9	20	\N	1	\N	ENTIDAD OBRAS PUBLICAS MUNICIPALES DE TARIJA		t	2018-03-07 12:33:37	\N	6
413	11	9	20	\N	1	\N	ENTIDAD DE ORDENAMIENTO TERRITORIAL DE TARIJA		t	2018-03-07 12:33:37	\N	6
414	11	9	20	\N	1	\N	ENTIDAD ORDEN Y SEGURIDAD CIUDADANA MUNICIPAL DE TARIJA		t	2018-03-07 12:33:37	\N	6
415	11	9	20	\N	1	\N	EMPRESA MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO SANITARIO DE URIONDO	EMAPACAU	t	2018-03-07 12:33:37	\N	6
416	11	4	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACIÓN COCHABAMBA	(DDE-CBBA)	t	2018-03-07 12:33:37	\N	6
420	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL  DE VILLA TUNARI	(GAM-TUN)	t	2018-03-07 12:33:37	\N	6
421	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  ALALAY	(GAM-ALA)	t	2018-03-07 12:33:37	\N	6
422	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  ARANI	(GAM-ARA)	t	2018-03-07 12:33:37	\N	6
423	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  ARQUE	(GAM-ARQ)	t	2018-03-07 12:33:37	\N	6
424	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  BOLIVAR	(GAM-BOL)	t	2018-03-07 12:33:37	\N	6
427	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  ENTRE RÍOS COCHABAMBA	(GAM-ERI)	t	2018-03-07 12:33:37	\N	6
428	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  MIZQUE	(GAM-MIZ)	t	2018-03-07 12:33:37	\N	6
429	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  POCONA	(GAM-POC)	t	2018-03-07 12:33:37	\N	6
430	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  POJO	(GAM-POJ)	t	2018-03-07 12:33:37	\N	6
432	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  SHINAHOTA	(GAM-SHI)	t	2018-03-07 12:33:37	\N	6
433	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  TACOPAYA	(GAM-TPY)	t	2018-03-07 12:33:37	\N	6
434	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  TIRAQUE	(GAM-TRQ)	t	2018-03-07 12:33:37	\N	6
435	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  VACAS	(GAM-VAC)	t	2018-03-07 12:33:37	\N	6
436	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE  VILA VILA	(GAM-VIS)	t	2018-03-07 12:33:37	\N	6
438	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ANZALDO	(GAM-ANZ)	t	2018-03-07 12:33:37	\N	6
439	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE ARBIETO	(GAM-ARB)	t	2018-03-07 12:33:37	\N	6
440	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE AYOPAYA (VILLA DE INDEPENDENCIA)	(GAM-IND)	t	2018-03-07 12:33:37	\N	6
441	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CAPINOTA	(GAM-CAP)	t	2018-03-07 12:33:37	\N	6
443	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COCHABAMBA	(GAM-CBBA)	t	2018-03-07 12:33:37	\N	6
444	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLCAPIRHUA	(GAM-CCP)	t	2018-03-07 12:33:37	\N	6
445	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE COLOMI	(GAM-CLM)	t	2018-03-07 12:33:37	\N	6
446	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE CUCHUMUELA (VILLA GUALBERTO VILLARROEL)	(GAM-VGV)	t	2018-03-07 12:33:37	\N	6
447	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE MOROCHATA	(GAM-MOH)	t	2018-03-07 12:33:38	\N	6
448	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE OMEREQUE	(GAM-OME)	t	2018-03-07 12:33:38	\N	6
449	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE PASORAPA	(GAM- PAS)	t	2018-03-07 12:33:38	\N	6
442	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CLIZA	GAM-CLI	t	2018-03-07 12:33:37	2018-06-05 12:25:26	6
382	11	2	20	\N	1	1	YPFB LOGISTICA S.A.	YPFB-LOGISTICA	t	2018-03-07 12:33:36	2018-06-07 15:39:32	6
384	11	2	20	\N	1	1	YPFB CHACO S.A.	YPFB-CHACO	t	2018-03-07 12:33:36	2018-06-07 15:49:07	6
380	11	2	20	\N	1	1	YPFB AVIACION S.A.	YPFB-AVIACION	t	2018-03-07 12:33:36	2018-06-07 16:05:19	6
383	11	2	20	\N	1	1	YPFB ANDINA S.A.	YPFB-ANDINA	t	2018-03-07 12:33:36	2018-06-07 16:11:37	6
425	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE  CHIMORE	GAM-CHI	t	2018-03-07 12:33:37	2018-06-07 17:33:00	6
381	11	2	20	\N	1	1	YPFB TRANSPORTE S.A.	YPFB-TRANSPORTE	t	2018-03-07 12:33:36	2018-06-20 19:00:24	6
395	11	9	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE CARAPARI	GAM-CRY	t	2018-03-07 12:33:36	2018-07-27 11:17:06	6
417	11	4	20	\N	1	1	EMPRESA MISICUNI	MISICUNI	t	2018-03-07 12:33:37	2018-07-27 16:41:43	6
404	11	9	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE YUNCHARA	GAM-YUN	t	2018-03-07 12:33:37	2018-08-30 16:23:50	6
419	11	4	20	\N	1	1	GOBIERNO AUTONOMO DEPARTAMENTAL DE COCHABAMBA	GAD-CBB	t	2018-03-07 12:33:37	2018-08-30 18:02:56	6
437	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE AIQUILE	GAM-AIQ	t	2018-03-07 12:33:37	2018-10-22 16:22:03	6
389	11	2	20	\N	1	1	EMPRESA ELECTRICA ENDE GUARACACHI S.A.	ENDE-GUARACHI	t	2018-03-07 12:33:36	2018-10-23 16:05:29	6
431	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE  PUERTO VILLARROEL	GAM-PVI	t	2018-03-07 12:33:37	2018-11-30 17:06:38	6
453	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SACABAMBA	(GAM-SBB)	t	2018-03-07 12:33:38	\N	6
454	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SAN BENITO (VILLA JOSE QUINTÍN MENDOZA)	(GAM-MEN)	t	2018-03-07 12:33:38	\N	6
455	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SANTIVAÑEZ	(GAM-SAN)	t	2018-03-07 12:33:38	\N	6
456	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE SICAYA	(GAM-SCY)	t	2018-03-07 12:33:38	\N	6
458	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TACACHI	(GAM-TAC)	t	2018-03-07 12:33:38	\N	6
459	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TAPACARI	(GAM-TAP)	t	2018-03-07 12:33:38	\N	6
460	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TARATA	(GAM-TRT)	t	2018-03-07 12:33:38	\N	6
461	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TIQUIPAYA	(GAM-TIQ)	t	2018-03-07 12:33:38	\N	6
462	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TOCO	(GAM-TOC)	t	2018-03-07 12:33:38	\N	6
463	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE TOLATA	(GAM-TLA)	t	2018-03-07 12:33:38	\N	6
464	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL TOTORA COCHABAMBA	(GAM-TOT)	t	2018-03-07 12:33:38	\N	6
465	11	4	20	\N	1	\N	GOBIERNO AUTONOMO MUNICIPAL DE VILLA RIVERO	(GAM-VRV)	t	2018-03-07 12:33:38	\N	6
467	11	4	20	\N	1	\N	SEGURO SOCIAL UNIVERSITARIO DE COCHABAMBA	SSU-CBBA	t	2018-03-07 12:33:38	\N	6
468	11	4	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE RIEGO COCHABAMBA	SEDERI-CBBA	t	2018-03-07 12:33:38	\N	6
469	11	4	20	\N	1	\N	SERVICIO MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO	SEMAPA	t	2018-03-07 12:33:38	\N	6
472	11	4	20	\N	1	\N	EMPRESA ELÉCTRICA CORANI S.A.	CORANI	t	2018-03-07 12:33:38	\N	6
474	11	4	20	\N	1	\N	EMPRESA MUNICIPAL DE AREAS VERDES Y RECREACIÓN ALTERNATIVA	EMAVRA	t	2018-03-07 12:33:38	\N	6
475	11	4	20	\N	1	\N	EMPRESA MUNICIPAL DE SERVICIOS DE ASEO	EMSA-CBBA	t	2018-03-07 12:33:38	\N	6
477	11	4	20	\N	1	\N	EMPRESA MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO SACABA 		t	2018-03-07 12:33:38	\N	6
480	10	4	19	\N	1	\N	SERVICIOS DE AEROPUERTOS BOLIVIANOS S.A. SABSA 	SABSA S.A.	t	2018-03-07 12:33:38	\N	6
482	11	4	20	\N	1	\N	COMITÉ ORGANIZADOR DE LOS XI JUEGOS SUDAMERICANOS COCHABAMBA 2018		t	2018-03-07 12:33:38	\N	6
483	10	1	19	\N	1	\N	ACADEMIA NACIONAL DE CIENCIAS	ANC	t	2018-03-07 12:33:38	\N	6
484	10	1	19	\N	1	\N	ADMINISTRACION DE AEROPUERTOS Y SERVICIO AUXILIAR EN LA NAVEGACIÓN AEREA	AASANA	t	2018-03-07 12:33:38	\N	6
487	10	1	19	\N	1	\N	AGENCIA BOLIVIANA ESPACIAL	ABE	t	2018-03-07 12:33:38	\N	6
488	10	1	19	\N	1	\N	AGENCIA ESTATAL DE VIVIENDA	AEVIVIENDA	t	2018-03-07 12:33:38	\N	6
489	10	1	19	\N	1	\N	AGENCIA NACIONAL DE HIDROCARBUROS	ANH	t	2018-03-07 12:33:38	\N	6
490	10	1	19	\N	1	\N	AGENCIA PARA EL DESARROLLO DE LA SOCIEDAD DE LA INFORMACIÓN EN BOLIVIA	ABI ADSIB	t	2018-03-07 12:33:38	\N	6
491	10	1	19	\N	1	\N	AGENCIA PARA EL DESARROLLO DE LAS MACROREGIONES Y ZONAS FRONTERIZAS	ADEMAF	t	2018-03-07 12:33:38	\N	6
492	10	1	19	\N	1	\N	AUTORIDAD DE FISCALIZACION Y CONTROL DE COOPERATIVAS	AFC	t	2018-03-07 12:33:38	\N	6
493	10	1	19	\N	1	\N	AUTORIDAD DE FISCALIZACION Y CONTROL DE PENSIONES Y SEGUROS	APS	t	2018-03-07 12:33:38	\N	6
494	10	1	19	\N	1	\N	AUTORIDAD DE FISCALIZACION Y CONTROL SOCIAL DE AGUA POTABLE Y SANEAMIENTO BASICO	AAPS-LPZ	t	2018-03-07 12:33:38	\N	6
495	10	1	19	\N	1	\N	AUTORIDAD DE FISCALIZACION Y CONTROL SOCIAL DE ELECTRICIDAD	AE	t	2018-03-07 12:33:38	\N	6
497	10	1	19	\N	1	\N	AUTORIDAD DE REGULACION Y FISCALIZACION DE TELECOMUNICACIONES Y TRANSPORTES	ATT	t	2018-03-07 12:33:38	\N	6
498	10	1	19	\N	1	\N	AUTORIDAD DE FISCALIZACION DEL JUEGO	AJ	t	2018-03-07 12:33:38	\N	6
499	10	1	19	\N	1	\N	AUTORIDAD DE SUPERVISIÓN DEL SISTEMA FINANCIERO	ASFI	t	2018-03-07 12:33:38	\N	6
501	10	1	19	\N	1	\N	AUTORIDAD JURISDICCIONAL ADMINISTRATIVA MINERA	AJAM	t	2018-03-07 12:33:39	\N	6
502	10	1	19	\N	1	\N	AUTORIDAD PLURINACIONAL DE LA MADRE TIERRA	APMT	t	2018-03-07 12:33:39	\N	6
503	10	1	19	\N	1	\N	BANCO CENTRAL DE BOLIVIA	BCB	t	2018-03-07 12:33:39	\N	6
505	10	1	19	\N	1	\N	CAJA DE SALUD CORDES	CORDES	t	2018-03-07 12:33:39	\N	6
506	10	1	19	\N	1	\N	CAJA DE SALUD DE CAMINOS Y RAMAS AFINES	CSC y RA	t	2018-03-07 12:33:39	\N	6
507	10	1	19	\N	1	\N	CAJA NACIONAL DE SALUD	CNS	t	2018-03-07 12:33:39	\N	6
508	10	1	19	\N	1	\N	CAJA PETROLERA DE SALUD	CPS	t	2018-03-07 12:33:39	\N	6
509	10	1	19	\N	1	\N	CAMARA DE DIPUTADOS	CAM-DIP	t	2018-03-07 12:33:39	\N	6
510	10	1	19	\N	1	\N	CAMARA DE SENADORES	CAM-SEN	t	2018-03-07 12:33:39	\N	6
511	10	1	19	\N	1	\N	CENTRAL DE ABASTECIMIENTO Y SUMINISTROS DE SALUD	CEASS	t	2018-03-07 12:33:39	\N	6
512	10	1	19	\N	1	\N	COMITE NACIONAL DE LA PERSONA CON DISCAPACIDAD	CONALPEDIS	t	2018-03-07 12:33:39	\N	6
514	10	1	19	\N	1	\N	CONSEJO NACIONAL DE VIVIENDA POLICIAL	COVIPOL	t	2018-03-07 12:33:39	\N	6
515	10	1	19	\N	1	\N	CONSEJO NACIONAL DEL CINE	CONACINE	t	2018-03-07 12:33:39	\N	6
516	10	1	19	\N	1	\N	CONSEJO SUPREMO DE DEFENSA DEL ESTADO PLURINACIONAL	COSDEP	t	2018-03-07 12:33:39	\N	6
517	10	1	19	\N	1	\N	CONSERVATORIO PLURINACIONAL DE MUSICA	CONAMU	t	2018-03-07 12:33:39	\N	6
518	10	1	19	\N	1	\N	CONTRALORIA GENERAL DEL ESTADO	CGE	t	2018-03-07 12:33:39	\N	6
519	10	1	19	\N	1	\N	CORPORACION DEL SEGURO SOCIAL MILITAR	COSSMIL	t	2018-03-07 12:33:39	\N	6
521	10	1	19	\N	1	\N	DEFENSORIA DEL PUEBLO	DP	t	2018-03-07 12:33:39	\N	6
522	10	1	19	\N	1	\N	DIRECCION DEL NOTARIADO PLURINACIONAL 	DNP	t	2018-03-07 12:33:39	\N	6
523	10	1	19	\N	1	\N	DIRECCIÓN ESTRATEGICA DE REIVINDICACION MARITIMA	DIREMAR	t	2018-03-07 12:33:39	\N	6
524	10	1	19	\N	1	\N	DIRECCION GENERAL DE AERONAUTICA CIVIL	DGAC	t	2018-03-07 12:33:39	\N	6
525	10	1	19	\N	1	\N	EMPRESA DE APOYO A LA PRODUCCION DE ALIMENTOS	EMAPA	t	2018-03-07 12:33:39	\N	6
452	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE SACABA	GAM-SCB	t	2018-03-07 12:33:38	2018-06-05 16:35:27	6
496	10	1	19	\N	1	1	AUTORIDAD DE FISCALIZACION DE EMPRESAS	AEMP	t	2018-03-07 12:33:38	2018-06-07 16:41:16	6
466	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE VINTO	GAM-VIN	t	2018-03-07 12:33:38	2018-06-08 11:57:57	6
457	11	4	20	\N	1	1	GOBIERNO AUTONOMO MUNICIPAL DE SIPESIPE	GAM-SIP	t	2018-03-07 12:33:38	2018-07-27 11:09:54	6
470	11	4	20	\N	1	1	UNIVERSIDAD INDIGENA BOLIVIANA QUECHUA "CASIMIRO HUANCA"	UNIBOL-QCH	t	2018-03-07 12:33:38	2018-07-27 11:41:18	6
485	10	1	19	\N	1	1	ADMINISTRADORA BOLIVIANA DE CARRETERAS	ABC	t	2018-03-07 12:33:38	2018-07-27 12:58:19	6
520	10	1	19	\N	1	1	CORPORACION MINERA DE BOLIVIA	COMIBOL	t	2018-03-07 12:33:39	2018-07-27 17:55:10	6
504	10	1	19	\N	1	1	EMPRESA ESTATAL DE TELEVISIÓN "BOLIVIA TV"	BTV	t	2018-03-07 12:33:39	2018-10-22 17:26:19	6
526	10	1	19	\N	1	\N	EMPRESA DE CORREOS DE BOLIVIA	ECOBOL-LPZ	t	2018-03-07 12:33:39	\N	6
527	10	1	19	\N	1	\N	EMPRESA ESTATAL BOLIVIANA DE TURISMO	BOLTUR	t	2018-03-07 12:33:39	\N	6
528	10	1	19	\N	1	\N	EMPRESA ESTRATEGICA BOLIVIANA DE CONSTRUCCION Y CONSERVACION DE INFRAESTRUCTURA CIVIL	EBC	t	2018-03-07 12:33:39	\N	6
529	10	1	19	\N	1	\N	EMPRESA NACIONAL DE FERROCARRILES - RESIDUAL	ENFE	t	2018-03-07 12:33:39	\N	6
531	10	1	19	\N	1	\N	EMPRESA NAVIERA BOLIVIANA	ENABOL-LPZ	t	2018-03-07 12:33:39	\N	6
532	10	1	19	\N	1	\N	EMPRESA PUBLICA PRODUCTIVA CEMENTOS DE BOLIVIA	ECEBOL	t	2018-03-07 12:33:39	\N	6
533	10	1	19	\N	1	\N	EMPRESA PUBLICA PRODUCTIVA DE LACTEOS DE BOLIVIA	LACTEOSBOL	t	2018-03-07 12:33:39	\N	6
535	10	1	19	\N	1	\N	ENTIDAD EJECUTORA DE  MEDIO AMBIENTE Y AGUA	EMAGUA	t	2018-03-07 12:33:39	\N	6
536	10	1	19	\N	1	\N	ESCUELA DE GESTION PUBLICA PLURINACIONAL	EGPP	t	2018-03-07 12:33:39	\N	6
537	10	1	19	\N	1	\N	ESCUELA MILITAR DE INGENIERIA	EMI	t	2018-03-07 12:33:39	\N	6
539	10	1	19	\N	1	\N	FONDO DE FINANCIAMIENTO PARA LA MINERIA	FOFIM	t	2018-03-07 12:33:39	\N	6
541	10	1	19	\N	1	\N	FONDO NACIONAL DE DESARROLLO FORESTAL	FONABOSQUE	t	2018-03-07 12:33:39	\N	6
542	10	1	19	\N	1	\N	FONDO NACIONAL DE DESARROLLO REGIONAL	FNDR	t	2018-03-07 12:33:39	\N	6
543	10	1	19	\N	1	\N	FONDO NACIONAL DE INVERSION PRODUCTIVA Y SOCIAL	FPS	t	2018-03-07 12:33:39	\N	6
545	10	1	19	\N	1	\N	FUNDACIÓN CULTURAL DEL BANCO CENTRAL DE  BOLIVIA	FC-BCB	t	2018-03-07 12:33:39	\N	6
546	10	1	19	\N	1	\N	INSTITUTO BOLIVIANO DE CIENCIA Y TECNOLOGÍA NUCLEAR	IBTEN	t	2018-03-07 12:33:39	\N	6
547	10	1	19	\N	1	\N	INSTITUTO BOLIVIANO DE LA CEGUERA	IBC	t	2018-03-07 12:33:39	\N	6
548	10	1	19	\N	1	\N	INSTITUTO DEL SEGURO AGRARIO 	INSA	t	2018-03-07 12:33:39	\N	6
549	10	1	19	\N	1	\N	INSTITUTO NACIONAL DE ESTADÍSTICA	INE	t	2018-03-07 12:33:39	\N	6
550	10	1	19	\N	1	\N	INSTITUTO NACIONAL DE INNOVACIÓN AGROPECUARIA Y FORESTAL	INIAF	t	2018-03-07 12:33:39	\N	6
552	10	1	19	\N	1	\N	INSTITUTO NACIONAL DE SALUD OCUPACIONAL	INSO	t	2018-03-07 12:33:40	\N	6
554	10	1	19	\N	1	\N	LOTERÍA NACIONAL DE BENEFICENCIA Y SALUBRIDAD	LONABOL	t	2018-03-07 12:33:40	\N	6
555	10	1	19	\N	1	\N	EMPRESA ESTATAL DE TRANSPORTE POR CABLE "MI TELEFERICO"	MT	t	2018-03-07 12:33:40	\N	6
557	10	1	19	\N	1	\N	MINISTERIO DE COMUNICACION	MIN-COM	t	2018-03-07 12:33:40	\N	6
558	10	1	19	\N	1	\N	MINISTERIO DE CULTURAS Y TURISMO	MIN-CULT	t	2018-03-07 12:33:40	\N	6
559	10	1	19	\N	1	\N	MINISTERIO DE DEFENSA	MIN-DEF	t	2018-03-07 12:33:40	\N	6
560	10	1	19	\N	1	\N	MINISTERIO DE DEPORTES	MD	t	2018-03-07 12:33:40	\N	6
561	10	1	19	\N	1	\N	MINISTERIO DE DESARROLLO PRODUCTIVO Y ECONOMIA PLURAL	MIN-DPEP	t	2018-03-07 12:33:40	\N	6
562	10	1	19	\N	1	\N	MINISTERIO DE DESARROLLO RURAL Y TIERRAS	MIN-DRT	t	2018-03-07 12:33:40	\N	6
563	10	1	19	\N	1	\N	MINISTERIO DE ECONOMIA Y FINANZAS PUBLICAS	MIN-EFP	t	2018-03-07 12:33:40	\N	6
564	10	1	19	\N	1	\N	MINISTERIO DE EDUCACION	MIN-EDU	t	2018-03-07 12:33:40	\N	6
565	10	1	19	\N	1	\N	MINISTERIO DE GOBIERNO	MIN-GOB	t	2018-03-07 12:33:40	\N	6
568	10	1	19	\N	1	\N	MINISTERIO DE LA PRESIDENCIA	MIN-PRES	t	2018-03-07 12:33:40	\N	6
569	10	1	19	\N	1	\N	MINISTERIO DE MEDIO AMBIENTE Y AGUA	MIN-MAA	t	2018-03-07 12:33:40	\N	6
570	10	1	19	\N	1	\N	MINISTERIO DE MINERÍA Y METALURGIA	MIN-MM	t	2018-03-07 12:33:40	\N	6
571	10	1	19	\N	1	\N	MINISTERIO DE OBRAS PUBLICAS, SERVICIOS Y VIVIENDA	MIN-OPSV	t	2018-03-07 12:33:40	\N	6
572	10	1	19	\N	1	\N	MINISTERIO DE PLANIFICACION DEL DESARROLLO	MIN-PD	t	2018-03-07 12:33:40	\N	6
573	10	1	19	\N	1	\N	MINISTERIO DE RELACIONES EXTERIORES	MIN-RREE	t	2018-03-07 12:33:40	\N	6
574	10	1	19	\N	1	\N	MINISTERIO DE SALUD	MIN-SAL	t	2018-03-07 12:33:40	\N	6
575	10	1	19	\N	1	\N	MINISTERIO DE TRABAJO, EMPLEO Y PREVISION SOCIAL	MIN-TEPS	t	2018-03-07 12:33:40	\N	6
577	10	1	19	\N	1	\N	MUSEO NACIONAL DE HISTORIA NATURAL	MNHN	t	2018-03-07 12:33:40	\N	6
578	10	1	19	\N	1	\N	MUTUAL DE SERVICIOS AL POLICÍA 	MUSERPOL	t	2018-03-07 12:33:40	\N	6
579	10	1	19	\N	1	\N	OBSERVATORIO PLURINACIONAL DE LA CALIDAD EDUCATIVA	OPCE	t	2018-03-07 12:33:40	\N	6
581	10	1	19	\N	1	\N	ORQUESTA SINFÓNICA NACIONAL	OSN	t	2018-03-07 12:33:40	\N	6
582	10	1	19	\N	1	\N	REGISTRO UNICO PARA LA ADMINISTRACION TRIBUTARIA MUNICIPAL	RUAT	t	2018-03-07 12:33:40	\N	6
583	10	1	19	\N	1	\N	SERVICIO DE DESARROLLO DE LAS EMPRESAS PUBLICAS PRODUCTIVAS	SEDEM	t	2018-03-07 12:33:40	\N	6
584	10	1	19	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES	SIN	t	2018-03-07 12:33:40	\N	6
585	10	1	19	\N	1	\N	SERVICIO ESTATAL DE AUTONOMÍAS	SEA	t	2018-03-07 12:33:40	\N	6
586	10	1	19	\N	1	\N	SERVICIO GENERAL DE IDENTIFICACIÓN PERSONAL	SEGIP	t	2018-03-07 12:33:40	\N	6
587	10	1	19	\N	1	\N	SERVICIO GEODESICO DE MAPAS	SGM	t	2018-03-07 12:33:40	\N	6
588	10	1	19	\N	1	\N	SERVICIO NACIONAL DE AEROFOTOGRAMETRÍA	SNAF	t	2018-03-07 12:33:40	\N	6
589	10	1	19	\N	1	\N	SERVICIO NACIONAL DE HIDROGRAFIA NAVAL	SNHN	t	2018-03-07 12:33:40	\N	6
590	10	1	19	\N	1	\N	SERVICIO NACIONAL DE METEOROLOGIA E HIDROLOGIA	SENAMHI	t	2018-03-07 12:33:40	\N	6
591	10	1	19	\N	1	\N	SERVICIO NACIONAL DE REGISTRO Y COMERCIALIZACION DE MINERALES Y METALES	SENARECOM	t	2018-03-07 12:33:40	\N	6
592	10	1	19	\N	1	\N	SERVICIO NACIONAL DEL RIEGO	SENARI	t	2018-03-07 12:33:40	\N	6
593	10	1	19	\N	1	\N	SERVICIO NACIONAL PARA LA SOSTENIBILIDAD DE LOS SERVICIOS EN SANEAMIENTO BÁSICO	SENASBA	t	2018-03-07 12:33:40	\N	6
594	10	1	19	\N	1	\N	SERVICIO PARA LA PREVENCION DE LA TORTURA	SEPRET	t	2018-03-07 12:33:40	\N	6
595	10	1	19	\N	1	\N	SERVICIO PLURINACIONAL DE ASISTENCIA A LA VICTIMA	SEPDAVI	t	2018-03-07 12:33:40	\N	6
596	10	1	19	\N	1	\N	SERVICIO PLURINACIONAL DE DEFENSA PUBLICA	SEPDEP	t	2018-03-07 12:33:40	\N	6
597	10	1	19	\N	1	\N	TRANSPORTES AEREOS BOLIVIANOS	TAB	t	2018-03-07 12:33:40	\N	6
598	10	1	19	\N	1	\N	TRIBUNAL SUPREMO ELECTORAL	TSE	t	2018-03-07 12:33:40	\N	6
599	10	1	19	\N	1	\N	UNIDAD DE ANALISIS DE POLITICAS SOCIALES Y ECONOMICAS	UDAPE	t	2018-03-07 12:33:40	\N	6
600	10	1	19	\N	1	\N	UNIDAD DE INVESTIGACIONES FINANCIERAS	UIF	t	2018-03-07 12:33:40	\N	6
601	10	1	19	\N	1	\N	VÍAS BOLIVIA	VB	t	2018-03-07 12:33:40	\N	6
602	10	1	19	\N	1	\N	YACIMIENTOS PETROLIFEROS FISCALES BOLIVIANOS	YPFB	t	2018-03-07 12:33:40	\N	6
605	10	1	19	\N	1	\N	EMPRESA NACIONAL DE TELECOMUNICACIONES		t	2018-03-07 12:33:40	\N	6
606	10	1	19	\N	1	\N	VICEPRESIDENCIA DEL ESTADO PLURINACIONAL	VPEP	t	2018-03-07 12:33:41	\N	6
534	10	1	19	\N	1	1	EMPRESA PUBLICA QUIPUS	QUIPUS	t	2018-03-07 12:33:39	2018-07-27 17:43:30	6
553	10	1	19	\N	1	1	INSUMOS BOLIVIA	IN-BOL	t	2018-03-07 12:33:40	2018-10-22 17:18:27	6
608	10	1	19	\N	1	\N	REGISTRO INTERNACIONAL BOLIVIANO DE BUQUES	RIBB	t	2018-03-07 12:33:41	\N	6
610	10	1	19	\N	1	\N	UNIDAD DE PROYECTOS ESPECIALES	UPRE	t	2018-03-07 12:33:41	\N	6
611	10	1	19	\N	1	\N	UNIDAD EJECUTORA FONDO DE SOLIDARIDAD Y EQUIDAD	FNSE	t	2018-03-07 12:33:41	\N	6
612	10	1	19	\N	1	\N	SERVICIO NACIONAL DE PATRIMONIO DEL ESTADO	SENAPE	t	2018-03-07 12:33:41	\N	6
613	10	1	19	\N	1	\N	SERVICIO NACIONAL DEL SISTEMA DE REPARTO	SENASIR	t	2018-03-07 12:33:41	\N	6
614	10	1	19	\N	1	\N	UNIDAD DE COORDINACIÓN DE PROGRAMAS Y PROYECTOS	UCPP	t	2018-03-07 12:33:41	\N	6
615	10	1	19	\N	1	\N	SERVICIO NACIONAL DE PROPIEDAD INTELECTUAL	SENAPI	t	2018-03-07 12:33:41	\N	6
616	10	1	19	\N	1	\N	INSTITUTO BOLIVIANO DE METROLOGIA	IBMETRO	t	2018-03-07 12:33:41	\N	6
617	10	1	19	\N	1	\N	SERVICIO NACIONAL DE VERIFICACION DE EXPORTACIONES	SENAVEX	t	2018-03-07 12:33:41	\N	6
621	10	1	19	\N	1	\N	SERVICIO NACIONAL DE AREAS PROTEGIDAS	SERNAP	t	2018-03-07 12:33:41	\N	6
623	10	1	19	\N	1	\N	SERVICIO NACIONAL DE SANIDAD AGROPECUARIA E INOCUIDAD ALIMENTARIA	SENASAG	t	2018-03-07 12:33:41	\N	6
624	10	1	19	\N	1	\N	FONDO NACIONAL DE DESARROLLO ALTERNATIVO	FONADAL	t	2018-03-07 12:33:41	\N	6
625	10	1	19	\N	1	\N	INSTITUCION PUBLICA DESCONCENTRADA SOBERANIA ALIMENTARIA	SOBAL	t	2018-03-07 12:33:41	\N	6
626	10	1	19	\N	1	\N	INSTITUCION PUBLICA DESCONCENTRADA DE PESCA Y ACUICULTURA PACU	PACU	t	2018-03-07 12:33:41	\N	6
627	10	1	19	\N	1	\N	CENTRO DE COMUNICACIONES LA PAZ	CCLP	t	2018-03-07 12:33:41	\N	6
975	10	1	19	\N	1	\N	SERVICIO DE REGISTRO CIVICO	SERECI	t	2018-03-07 12:33:45	\N	6
628	10	1	19	\N	1	\N	ENTIDAD EJECUTORA DE CONVERSION A GAS NATURAL VEHICULAR	EEC-GNV	t	2018-03-07 12:33:41	\N	6
630	10	1	19	\N	1	\N	CENTRO INTERNACIONAL DE LA QUINUA	CIQ	t	2018-03-07 12:33:41	\N	6
631	10	1	19	\N	1	\N	SERVICIO GEOLOGICO MINERO	SERGEOMIN	t	2018-03-07 12:33:41	\N	6
633	10	1	19	\N	1	\N	CAJA BANCARIA ESTATAL DE SALUD	CBES	t	2018-03-07 12:33:41	\N	6
634	10	1	19	\N	1	\N	CORPORACION DE LAS FUERZAS ARMADAS PARA EL DESARROLLO NACIONAL	COFADENA	t	2018-03-07 12:33:41	\N	6
636	10	1	19	\N	1	\N	ADMINISTRACION DE SERVICIOS PORTUARIOS - BOLIVIA	ASP-B	t	2018-03-07 12:33:41	\N	6
637	10	1	19	\N	1	\N	EMPRESA PUBLICA NACIONAL ESTRATEGICA PAPELES DE BOLIVIA	PAPELBOL	t	2018-03-07 12:33:41	\N	6
638	10	1	19	\N	1	\N	EMPRESA PUBLICA NACIONAL ESTRATEGICA CARTONES DE BOLIVIA	CARTONBOL	t	2018-03-07 12:33:41	\N	6
639	10	1	19	\N	1	\N	EMPRESA AZUCARERA SAN BUENAVENTURA	EASBA	t	2018-03-07 12:33:41	\N	6
640	10	1	19	\N	1	\N	EMPRESA BOLIVIANA DE INDUSTRIALIZACION DE HIDROCARBUROS	EBIH	t	2018-03-07 12:33:41	\N	6
641	10	1	19	\N	1	\N	BOLIVIANA DE AVIACIÓN	BOA	t	2018-03-07 12:33:41	\N	6
643	10	1	19	\N	1	\N	FONDO DE DESARROLLO INDIGENA		t	2018-03-07 12:33:41	\N	6
644	10	1	19	\N	1	\N	AGENCIA DE GOBIERNO ELECTRÓNICO Y TECNOLOGÍAS DE LA INFORMAIÓN Y COMUNICACIÓN		t	2018-03-07 12:33:41	\N	6
652	11	9	20	\N	1	\N	SERVICIOS ELECTRICOS DE TARIJA	SETAR	t	2018-03-07 12:33:41	\N	6
654	11	1	20	\N	1	\N	ASAMBLEA LEGISLATIVA DEPARTAMENTAL DE LA PAZ	ALDLPZ	t	2018-03-07 12:33:41	\N	6
655	11	1	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE CAMINOS LA PAZ	SNCLPZ	t	2018-03-07 12:33:41	\N	6
657	11	1	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD LA PAZ	SNSLPZ	t	2018-03-07 12:33:41	\N	6
659	11	8	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD CHUQUISACA	SEDES-CHQ	t	2018-03-07 12:33:41	\N	6
660	11	5	20	\N	1	\N	CONCEJO MUNICIPAL DE TRINIDAD	CMT	t	2018-03-07 12:33:41	\N	6
661	11	1	20	\N	1	\N	DISTRIBUIDORA DE ELECTRICIDAD LA PAZ S.A. DELAPAZ	DELAPAZ	t	2018-03-07 12:33:41	\N	6
662	10	1	19	\N	1	\N	MINISTERIO PUBLICO	MINPUB	t	2018-03-07 12:33:41	\N	6
663	10	1	19	\N	1	\N	UNIDAD COORDINADORA DE PROGRAMAS	UCP-CAF	t	2018-03-07 12:33:41	\N	6
664	10	1	19	\N	1	\N	PROGRAMA DE APOYO AL RIEGO COMUNITARIO	PARC	t	2018-03-07 12:33:41	\N	6
665	10	1	19	\N	1	\N	UNIDAD COORDINADORA DEL PROGRAMA DE AGUA Y ALCANTARILLADO PERIURBANO FASE I	UCP-PAAP	t	2018-03-07 12:33:41	\N	6
666	10	1	19	\N	1	\N	UNIDAD DESCONCENTRADA SUSTENTAR	SUSTENTAR	t	2018-03-07 12:33:41	\N	6
667	10	1	19	\N	1	\N	PROYECTO ECOSISTEMAS VERTICALES ANDINOS	EVA	t	2018-03-07 12:33:41	\N	6
668	10	1	19	\N	1	\N	UNIDAD DE COORDINACION DE EJECUCION DEL PROGRAMA MAS INVERSION PARA RIEGO	UCEP-MI-RIEGO	t	2018-03-07 12:33:41	\N	6
670	10	1	19	\N	1	\N	INSTITUTO GEOGRAFICO MILITAR	IGM	t	2018-03-07 12:33:41	\N	6
671	11	2	20	\N	1	\N	DIRECCION DEPARTAMENTAL DE EDUCACION SANTA CRUZ	SEDUCA-SC	t	2018-03-07 12:33:41	\N	6
672	11	3	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE CAMINOS ORURO	SEDCAM-ORU	t	2018-03-07 12:33:42	\N	6
673	11	3	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES ORURO	IN-ORU	t	2018-03-07 12:33:42	\N	6
675	10	1	19	\N	1	\N	AUTORIDAD DE IMPUGNACION TRIBUTARIA	AIT	t	2018-03-07 12:33:42	\N	6
676	11	8	20	\N	1	\N	ASAMBLEA LEGISLATIVA DEPARTAMENTAL DE CHUQUISACA	ALDCH	t	2018-03-07 12:33:42	\N	6
677	11	8	20	\N	1	\N	ESCUELA SUPERIOR DE FORMACIÓN DE MAESTROS "MARISCAL SUCRE"	UPMS	t	2018-03-07 12:33:42	\N	6
678	11	7	20	\N	1	\N	SERVICIOS ELECTRICOS POTOSI S.A.	SEPSA	t	2018-03-07 12:33:42	\N	6
679	11	9	20	\N	1	\N	CONSEJO REGIONAL DE ABASTO Y MERCADEO AGROPECUARIO	CRAMA	t	2018-03-07 12:33:42	\N	6
680	11	8	20	\N	1	\N	HOSPITAL SANTA BARBARA	HSB	t	2018-03-07 12:33:42	\N	6
681	11	9	20	\N	1	\N	ASAMBLEA LEGISLATIVA DEPARTAMENTAL DE TARIJA	ALDT	t	2018-03-07 12:33:42	\N	6
682	11	9	20	\N	1	\N	SUBGOBERNACION CERCADO TARIJA	GADCER-TRJ	t	2018-03-07 12:33:42	\N	6
683	11	4	20	\N	1	\N	ESCUELA SUPERIOR DE FORMACION DE MAESTROS "ISMAEL MONTES"	ESFMEA-CBBA	t	2018-03-07 12:33:42	\N	6
684	11	6	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE GESTION SOCIAL	SEDEGES	t	2018-03-07 12:33:42	\N	6
685	11	8	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES - CHUQUISACA	SIN-CH	t	2018-03-07 12:33:42	\N	6
687	11	5	20	\N	1	\N	SUBGOBERNACION DE ITENEZ	SUBGOBEITENEZ	t	2018-03-07 12:33:42	\N	6
688	11	5	20	\N	1	\N	SUBGOBERNACION PROVINCIA BALLIVIAN	SUBGOBEBA	t	2018-03-07 12:33:42	\N	6
689	11	5	20	\N	1	\N	GOBERNACION AUTONOMO DEPARTAMENTAL DEL BENI	GOBBENI	t	2018-03-07 12:33:42	\N	6
690	11	5	20	\N	1	\N	CENTRO DE OPERACIONES DE EMERGENCIAS	COED	t	2018-03-07 12:33:42	\N	6
692	11	1	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES GERENCIA DISTRITAL LA PAZ I	SIN-LPZ I	t	2018-03-07 12:33:42	\N	6
693	11	1	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES GERENCIA DISTRITAL LA PAZ II	SIN-LPZ II	t	2018-03-07 12:33:42	\N	6
694	11	1	20	\N	1	\N	GERENCIA GRANDES CONTRIBUYENTES LA PAZ	GRACO-LPZ	t	2018-03-07 12:33:42	\N	6
695	11	1	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES GERENCIA DISTRITAL EL ALTO	SIN-EA	t	2018-03-07 12:33:42	\N	6
994	10	1	19	\N	1	\N	FISCALIA GENERAL DEL ESTADO	FGE	t	2018-06-25 23:26:05	\N	6
696	11	8	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL DE CHUQUISACA	TDECH	t	2018-03-07 12:33:42	\N	6
697	11	9	20	\N	1	\N	CONCEJO MUNICIPAL DE TARIJA	CM-TRJ	t	2018-03-07 12:33:42	\N	6
699	11	9	20	\N	1	\N	PROGRAMA EJECUTIVO DE REHABILITACION DE TIERRAS TARIJA	PERTT	t	2018-03-07 12:33:42	\N	6
700	11	3	20	\N	1	\N	CONCEJO MUNICIPAL DE ORURO	HCMO	t	2018-03-07 12:33:42	\N	6
701	11	1	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA DIRECCIÓN DEPARTAMENTAL LA PAZ	INRA-LPZ	t	2018-03-07 12:33:42	\N	6
702	11	9	20	\N	1	\N	PROGRAMA RECONVERSION VEHICULAR A GAS	GNV-TJA	t	2018-03-07 12:33:42	\N	6
703	11	9	20	\N	1	\N	PROGRAMA SOLIDARIO COMUNAL	PROSOL	t	2018-03-07 12:33:42	\N	6
704	11	9	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE DEPORTE TARIJA	SEDEDE-TRJ	t	2018-03-07 12:33:42	\N	6
707	11	9	20	\N	1	\N	SUBGOBERNACION YUNCHARA TARIJA	GADYUN-TRJ	t	2018-03-07 12:33:42	\N	6
708	11	9	20	\N	1	\N	SUBGOBERNACION PADCAYA TARIJA	GADPAD-TRJ	t	2018-03-07 12:33:42	\N	6
709	11	9	20	\N	1	\N	SUBGOBERNACION ENTRE RIOS TARIJA	GADER-TRJ	t	2018-03-07 12:33:42	\N	6
710	11	9	20	\N	1	\N	SUBGOBERNACION YACUIBA TARIJA	GADYBC-TRJ	t	2018-03-07 12:33:42	\N	6
711	11	9	20	\N	1	\N	SUBGOBERNACION CARAPARI TARIJA	GADCAR-TRJ	t	2018-03-07 12:33:42	\N	6
712	11	1	20	\N	1	\N	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA LA PAZ	RDCM-LPZ	t	2018-03-07 12:33:42	\N	6
714	11	9	20	\N	1	\N	CONCEJO MUNICIPAL DE CARAPARI TARIJA	CMCAR-TRJ	t	2018-03-07 12:33:42	\N	6
716	11	7	20	\N	1	\N	ADMINISTRACIÓN AUTONOMA PARA OBRAS SANITARIAS - AAPOS POTOSI	AAPOS-POTOSI	t	2018-03-07 12:33:42	\N	6
719	11	7	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD - POTOSI	SEDES - POTOSI	t	2018-03-07 12:33:42	\N	6
720	11	5	20	\N	1	\N	SUBGOBERNACION DE PROVINCIA YACUMA	SGOB-YACUMA	t	2018-03-07 12:33:42	\N	6
721	10	1	19	\N	1	\N	COMANDO GENERAL DE LA POLICIA BOLIVIANA	-	t	2018-03-07 12:33:42	\N	6
722	11	2	20	\N	1	\N	ESCUELA MILITAR DE INGENIERIA SC	EMI SC	t	2018-03-07 12:33:42	\N	6
724	11	4	20	\N	1	\N	UNIDAD MUNICIPAL DE MANTENIMIENTO INFRAESTRUCTURA PREVENCIÓN DE RIESGOS Y EMERGENCIAS PROGRAMA DE MANTENIMIENTO	UMMIPRE-PROMAN	t	2018-03-07 12:33:42	\N	6
725	11	4	20	\N	1	\N	HOSPITAL DR. BENIGNO SANCHEZ DE QUILLACOLLO	HBSQ	t	2018-03-07 12:33:42	\N	6
726	11	4	20	\N	1	\N	COMPLEJO HOSPITALARIO VIEDMA	CHV-CBBA	t	2018-03-07 12:33:42	\N	6
727	11	4	20	\N	1	\N	EMPRESA NACIONAL DE ELECTRICIDAD -TECNOLOGIA	ENDE-TEC	t	2018-03-07 12:33:42	\N	6
728	11	4	20	\N	1	\N	EMPRESA MUNICIPAL DE ASEO QUILLACOLLO	EMAQ	t	2018-03-07 12:33:42	\N	6
729	11	4	20	\N	1	\N	EMPRESA MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO QUILLACOLLO	EMAPAQ	t	2018-03-07 12:33:43	\N	6
730	11	7	20	\N	1	\N	ESCUELA SUPERIOR DE FORMACION DE MAESTROS EDUARDO AVAROA - POTOSI	ESFM EA POTOSI	t	2018-03-07 12:33:43	\N	6
731	11	5	20	\N	1	\N	SUBGOBERNACION DE PROVINCIA MARBAN	SGOB-MARBAN	t	2018-03-07 12:33:43	\N	6
732	11	9	20	\N	1	\N	SUBGOBERNACION EL PUENTE TARIJA	GADEP-TRJ	t	2018-03-07 12:33:43	\N	6
733	11	6	20	\N	1	\N	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA PANDO	CM-PAN	t	2018-03-07 12:33:43	\N	6
734	11	6	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA PANDO	INRA-PANDO	t	2018-03-07 12:33:43	\N	6
735	11	6	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES GERENCIA DISTRITAL PANDO	SIN-PANDO	t	2018-03-07 12:33:43	\N	6
738	11	1	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE GESTIÓN SOCIAL LA PAZ	SEDEGES-LPZ	t	2018-03-07 12:33:43	\N	6
739	11	9	20	\N	1	\N	SUBGOBERNACION DE VILLA MONTES TARIJA	GADVM-TRJ	t	2018-03-07 12:33:43	\N	6
740	11	9	20	\N	1	\N	ASAMBLEA REGIONAL DEL CHACO TARIJEÑO	ARCT	t	2018-03-07 12:33:43	\N	6
743	11	5	20	\N	1	\N	SERVICIO DEPARTAMENTAL AUTONOMO DE DEPORTES DEL BENI	SEDEDE	t	2018-03-07 12:33:43	\N	6
744	11	5	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL DEL BENI	TEDBENI	t	2018-03-07 12:33:43	\N	6
745	11	7	20	\N	1	\N	ENTIDAD MUNICIPAL DE ASEO POTOSI	EMAP	t	2018-03-07 12:33:43	\N	6
746	11	7	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA POTOSI	INRA-POT	t	2018-03-07 12:33:43	\N	6
747	11	8	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA CHUQUISACA	INRA-CHU	t	2018-03-07 12:33:43	\N	6
748	11	4	20	\N	1	\N	SERVICIO DEPARTAMENTAL AGROPECUARIO COCHABAMBA	SEDAG	t	2018-03-07 12:33:43	\N	6
749	11	4	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES - QUILLACOLLO	SIN-QUILLACOLLO	t	2018-03-07 12:33:43	\N	6
750	11	4	20	\N	1	\N	GRANDES CONTRIBUYENTES - COCHABAMBA	GRACO-CBBA	t	2018-03-07 12:33:43	\N	6
751	11	9	20	\N	1	\N	SUBGOBERNACION SAN LORENZO TARIJA	GADSL-TRJ	t	2018-03-07 12:33:43	\N	6
752	11	9	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE CAMINOS TARIJA	SEDECA-TRJ	t	2018-03-07 12:33:43	\N	6
753	11	9	20	\N	1	\N	SERVICIO DEPARTAMENTAL AGROPECUARIO TARIJA	SEDAG-TRJ	t	2018-03-07 12:33:43	\N	6
754	11	9	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE EMPLEO TARIJA	SEDEM-TRJ	t	2018-03-07 12:33:43	\N	6
755	11	9	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE GESTIÓN SOCIAL TARIJA	SEDEGES-TRJ	t	2018-03-07 12:33:43	\N	6
757	11	6	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE CAMINOS PANDO	SEDCAM	t	2018-03-07 12:33:43	\N	6
758	11	3	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA ORURO	INRA-ORU	t	2018-03-07 12:33:43	\N	6
759	11	4	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA COCHABAMBA	INRA-CBB	t	2018-03-07 12:33:43	\N	6
761	11	9	20	\N	1	\N	EMPRESA MUNICIPAL DE AGUA POTABLE Y ALCANTARILLADO SANITARIO BERMEJO	EMAAB-TRJ	t	2018-03-07 12:33:43	\N	6
762	11	9	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD TARIJA	SEDES-TRJ	t	2018-03-07 12:33:43	\N	6
764	11	5	20	\N	1	\N	ASAMBLEA LEGISLATIVA  DEPARTAMENTAL DEL BENI	ALDB	t	2018-03-07 12:33:43	\N	6
766	11	5	20	\N	1	\N	SEGURO UNIVERSAL DE SALUD AUTONOMA DEL BENI	SUSAB	t	2018-03-07 12:33:43	\N	6
767	11	2	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE CAMINOS SANTA CRUZ	SEDCAM SC	t	2018-03-07 12:33:43	\N	6
769	11	5	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD DEL BENI	SEDES	t	2018-03-07 12:33:43	\N	6
770	11	5	20	\N	1	\N	SERVICIO DEPARTAMENTAL AUTONOMO AGROPECUARIO DEL BENI	SEDAGB	t	2018-03-07 12:33:43	\N	6
773	11	5	20	\N	1	\N	HOSPITAL PRESIDENTE GERMAN BUSCH DEL BENI	HPGB	t	2018-03-07 12:33:43	\N	6
774	11	4	20	\N	1	\N	UNIVERSIDAD MAYOR DE SAN SIMÓN	UMSS	t	2018-03-07 12:33:43	\N	6
775	11	5	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE FORTALECIMIENTO MUNICIPAL Y COMUNAL DEL BENI 	SED-FMC	t	2018-03-07 12:33:43	\N	6
776	11	5	20	\N	1	\N	ESCUELA SUPERIOR DE FORMACIÓN DE MAESTROS  CLARA PARADA DE PINTO	ESFMCPP	t	2018-03-07 12:33:43	\N	6
784	11	4	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE DEPORTES COCHABAMBA	SDD-CBBA	t	2018-03-07 12:33:43	\N	6
785	11	6	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE DEPORTES PANDO	SDD-PANDO	t	2018-03-07 12:33:43	\N	6
786	11	5	20	\N	1	\N	SUBGOBERNACION DE LA PROVINCIA  CERCADO	SGOB-CERCADO	t	2018-03-07 12:33:43	\N	6
787	11	5	20	\N	1	\N	DIRECCION DE SISTEMA DE ALERTA TEMPRANA Y RIESGO	SATR	t	2018-03-07 12:33:43	\N	6
789	11	5	20	\N	1	\N	EMPRESA MUNICIPAL DE ASEO URBANO DE TRINIDAD	EMAUT	t	2018-03-07 12:33:43	\N	6
790	11	3	20	\N	1	\N	EMPRESA MINERA HUANUNI	EMH	t	2018-03-07 12:33:43	\N	6
791	11	5	20	\N	1	\N	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA DEL BENI	CMB	t	2018-03-07 12:33:43	\N	6
794	10	1	19	\N	1	\N	FUERZA AEREA BOLIVIANA	FAB	t	2018-03-07 12:33:43	\N	6
796	11	4	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL COCHABAMBA	OEP-CBBA	t	2018-03-07 12:33:43	\N	6
797	11	4	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD COCHABAMBA	SEDES-CBBA	t	2018-03-07 12:33:43	\N	6
800	10	1	19	\N	1	\N	COMANDO EN JEFE DE LAS FF.AA. DEL ESTADO	CJFFAA	t	2018-03-07 12:33:44	\N	6
801	10	8	19	\N	1	\N	DIRECCION ADMINISTRATIVA FINANCIERA DEL ORGANO JUDICIAL	DAFOJ	t	2018-03-07 12:33:44	\N	6
802	11	3	20	\N	1	\N	EMPRESA MUNICIPAL DE ASEO ORURO	EMAO	t	2018-03-07 12:33:44	\N	6
804	11	3	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE GESTIÓN SOCIAL ORURO	SEDEGES - ORU	t	2018-03-07 12:33:44	\N	6
805	11	3	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD ORURO	SEDES - ORU	t	2018-03-07 12:33:44	\N	6
806	11	9	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES - TARIJA	SIN-TRJ	t	2018-03-07 12:33:44	\N	6
808	11	2	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES SANTA CRUZ DISTRITAL I	SIN-SC	t	2018-03-07 12:33:44	\N	6
809	11	2	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES MONTERO	SIN-MONTERO	t	2018-03-07 12:33:44	\N	6
810	11	5	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES BENI	SIN-BENI	t	2018-03-07 12:33:44	\N	6
814	11	9	20	\N	1	\N	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA DE TARIJA	CMT	t	2018-03-07 12:33:44	\N	6
815	11	5	20	\N	1	\N	HOSPITAL MATERNO INFANTIL	HMI	t	2018-03-07 12:33:44	\N	6
816	11	5	20	\N	1	\N	BANCO DE SANGRE DE REFERENCIA DEPARTAMENTAL BENI	BSRDB	t	2018-03-07 12:33:44	\N	6
820	11	9	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA - TARIJA	INRA-TRJ	t	2018-03-07 12:33:44	\N	6
823	11	9	20	\N	1	\N	CONCEJO MUNICIPAL DE YACUIBA - TARIJA	CM-YAC	t	2018-03-07 12:33:44	\N	6
824	11	5	20	\N	1	\N	CONCEJO MUNICIPAL DE RIBERALTA	CM-RIBERALTA	t	2018-03-07 12:33:44	\N	6
830	11	1	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL LA PAZ	TED-LP	t	2018-03-07 12:33:44	\N	6
831	11	5	20	\N	1	\N	SUB GOBERNACION  DE LA PROVINCIA VACA DIEZ	SGOB-VACA DIEZ	t	2018-03-07 12:33:44	\N	6
841	10	1	19	\N	1	\N	ARMADA BOLIVIANA	AB	t	2018-03-07 12:33:44	\N	6
851	11	5	20	\N	1	\N	CONCEJO  MUNICIPAL DE GUAYARAMERIN	CM-GUAYARAMERIN	t	2018-03-07 12:33:44	\N	6
852	11	9	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES DISTRITAL YACUIBA	SIN-TRJ-Y	t	2018-03-07 12:33:44	\N	6
855	10	1	19	\N	1	\N	COMANDO GENERAL DEL EJERCITO	CMDGE	t	2018-03-07 12:33:44	\N	6
860	11	2	20	\N	1	\N	GAS TRANSBOLIVIANO S.A.	GTB	t	2018-03-07 12:33:44	\N	6
862	11	2	20	\N	1	\N	YPFB FLAMAGAS S.A.	FLAMAGAS	t	2018-03-07 12:33:44	\N	6
863	10	1	19	\N	1	\N	TRANSPORTE AEREO  MILITAR	TAM	t	2018-03-07 12:33:44	\N	6
864	10	1	19	\N	1	\N	EMPRESA ESTATAL YACANA	YACANA	t	2018-03-07 12:33:44	\N	6
865	11	5	20	\N	1	\N	CAJA NACIONAL DE SALUD BENI	CNS-BENI	t	2018-03-07 12:33:44	\N	6
867	11	1	20	\N	1	\N	EMPRESA MINERA COLQUIRI	EMC	t	2018-03-07 12:33:44	\N	6
873	11	4	20	\N	1	\N	ENDE TRANSMISION S.A.	ENDE-TRANSMISION	t	2018-03-07 12:33:44	\N	6
874	11	4	20	\N	1	\N	COMPAÑIA ELECTRICA CENTRAL BULO BULO	CENTRAL BULO BULO	t	2018-03-07 12:33:44	\N	6
875	11	4	20	\N	1	\N	GESTION DE RESIDUOS SOLIDOS - SACABA	GERES	t	2018-03-07 12:33:44	\N	6
879	11	9	20	\N	1	\N	FONDO ROTATORIO DE FOMENTO PRODUCTIVO REGIONAL	FRFPR-TRJ	t	2018-03-07 12:33:44	\N	6
880	11	7	20	\N	1	\N	EMPRESA METALÚRGICA KARACHIPAMPA	EMK	t	2018-03-07 12:33:44	\N	6
881	11	2	20	\N	1	\N	EMPRESA MUNICIPAL DE ASEO DE SANTA CRUZ	EMACRUZ	t	2018-03-07 12:33:44	\N	6
882	11	1	20	\N	1	\N	CONCEJO MUNICIPAL DE EL ALTO	HCMUDEA	t	2018-03-07 12:33:44	\N	6
885	11	7	20	\N	1	\N	EMPRESA MUNICIPAL PRESTADORA DE SERVICIOS DE AGUA POTABLE Y ALCANTARILLADO SANITARIO TUPIZA	EMPSAAT	t	2018-03-07 12:33:44	\N	6
886	11	4	20	\N	1	\N	EMPRESA DE LUZ Y FUERZA ELECTRICA COCHABAMBA S.A.	ELFEC	t	2018-03-07 12:33:44	\N	6
887	11	2	20	\N	1	\N	FRIGORIFICO MUNICIPAL - PAMPA DE LA ISLA	FRIMUP	t	2018-03-07 12:33:44	\N	6
888	11	4	20	\N	1	\N	ENDE ANDINA S.A.M.	ENDE-ANDINA	t	2018-03-07 12:33:44	\N	6
889	11	5	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA BENI	INRA-BENI	t	2018-03-07 12:33:44	\N	6
891	10	1	19	\N	1	\N	DATACOM	DATACOM	t	2018-03-07 12:33:44	\N	6
892	11	2	20	\N	1	\N	YACIMIENTOS PETROLIFEROS FISCALES BOLIVIANOS PETROANDINA S.A.M.	YPFB PETROANDINA	t	2018-03-07 12:33:44	\N	6
894	11	9	20	\N	1	\N	PROYECTO MÚLTIPLE SAN JACINTO	PMSJ	t	2018-03-07 12:33:44	\N	6
895	11	2	20	\N	1	\N	INSTITUTO NACIONAL DE REFORMA AGRARIA SANTA CRUZ	INRA SC	t	2018-03-07 12:33:44	\N	6
896	11	1	20	\N	1	\N	ENDE SERVICIOS Y CONSTRUCCIONES S.A.	ENDE-SERVCON	t	2018-03-07 12:33:44	\N	6
897	11	2	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES SANTA CRUZ DISTRITAL II	SIN - SC II	t	2018-03-07 12:33:44	\N	6
898	11	2	20	\N	1	\N	GRANDES CONTRIBUYENTES SANTA CRUZ 	GRACO - SC	t	2018-03-07 12:33:44	\N	6
900	11	5	20	\N	1	\N	SUBGOBERNACIÓN PROVINCIA MOJOS	SGPM	t	2018-03-07 12:33:45	\N	6
902	11	3	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL ORURO	TED-OR	t	2018-03-07 12:33:45	\N	6
903	11	9	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL DE TARIJA	TEDTAR	t	2018-03-07 12:33:45	\N	6
904	11	7	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES POTOSI	SIN-POT	t	2018-03-07 12:33:45	\N	6
905	11	7	20	\N	1	\N	CONSEJO DE LA MAGISTRATURA POTOSI	CM-POT	t	2018-03-07 12:33:45	\N	6
906	11	5	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE GESTION SOCIAL BENI	SDGS-BEN	t	2018-03-07 12:33:45	\N	6
907	11	4	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE GESTION SOCIAL COCHABAMBA	SEDEGES-COBBA	t	2018-03-07 12:33:45	\N	6
908	11	4	20	\N	1	\N	SERVICIO DE IMPUESTOS NACIONALES COCHABAMBA	SIN-CBBA	t	2018-03-07 12:33:45	\N	6
912	11	4	20	\N	1	\N	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA DE COCHABAMBA	CM-CBBA	t	2018-03-07 12:33:45	\N	6
916	11	4	20	\N	1	\N	ESCUELA MILITAR DE INGENIERIA COCHABAMBA	EMI-CBBA	t	2018-03-07 12:33:45	\N	6
918	11	5	20	\N	1	\N	ADMINISTRACION DE AEROPUERTOS Y SERVICIOS AUXILIARES A LA NAVEGACION AEREA BENI	AASANA-BEN	t	2018-03-07 12:33:45	\N	6
919	11	5	20	\N	1	\N	SUBGOBERNACION PROVINCIA MAMORE	SGP-MAMORE	t	2018-03-07 12:33:45	\N	6
920	11	8	20	\N	1	\N	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA CHUQUISACA	RCM-CHU	t	2018-03-07 12:33:45	\N	6
921	11	3	20	\N	1	\N	REPRESENTACION DEPARTAMENTAL - CONSEJO DE LA MAGISTRATURA ORURO	RCM-ORU	t	2018-03-07 12:33:45	\N	6
923	11	6	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL DE PANDO	TED-PAN	t	2018-03-07 12:33:45	\N	6
924	11	4	20	\N	1	\N	EMPRESA RIO ELECTRICO S.A.	ERE-CBBA	t	2018-03-07 12:33:45	\N	6
925	11	2	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL DE SANTA CRUZ	TED-SC	t	2018-03-07 12:33:45	\N	6
926	11	6	20	\N	1	\N	SERVICIO DEPARTAMENTAL DE SALUD PANDO	SDS-PAN	t	2018-03-07 12:33:45	\N	6
927	11	7	20	\N	1	\N	TRIBUNAL ELECTORAL DEPARTAMENTAL DE POTOSI	TED-POT	t	2018-03-07 12:33:45	\N	6
929	10	1	19	\N	1	\N	SERVICIO NACIONAL TEXTIL	SENATEX	t	2018-03-07 12:33:45	\N	6
930	10	1	19	\N	1	\N	PROYECTO PLAN VIDA PEEP	PPVP	t	2018-03-07 12:33:45	\N	6
937	10	1	19	\N	1	\N	HOSPITAL DE CLINICAS UNIVERSITARIO	HCU	t	2018-03-07 12:33:45	\N	6
939	11	7	20	\N	1	\N	ASAMBLEA LEGISLATIVA DEPARTAMENTAL DE POTOSI	ALDP	t	2018-03-07 12:33:45	\N	6
944	10	1	19	\N	1	\N	BANCO UNION S.A.	BUSA	t	2018-03-07 12:33:45	\N	6
945	11	1	20	\N	1	\N	SERVICIO DEPARTAMENTAL AGROPECUARIO LA PAZ	SDALP	t	2018-03-07 12:33:45	\N	6
946	11	1	20	\N	1	\N	EMPRESA MINERA COROCORO	EMCC	t	2018-03-07 12:33:45	\N	6
948	11	2	20	\N	1	\N	ASAMBLEA LEGISLATIVA DEPARTAMENTAL DE SANTA CRUZ	ALD SC	t	2018-03-07 12:33:45	\N	6
954	10	1	19	\N	1	\N	MINISTERIO DE JUSTICIA Y TRANSPARENCIA INSTITUCIONAL	MIN-JUS-TRANS	t	2018-03-07 12:33:45	\N	6
957	10	1	19	\N	1	\N	MINISTERIO DE HIDROCARBUROS	MIN-HID	t	2018-03-07 12:33:45	\N	6
960	10	1	19	\N	1	\N	AUTORIDAD DE FISCALIZACION Y CONTROL DEL SISTEMA NACIONAL DE SALUD	ASINSA	t	2018-03-07 12:33:45	\N	6
961	10	1	19	\N	1	\N	ACCESOS - INCLUSIÓN ECONOMICA PARA FAMILIAS Y COMUNIDADES RURALES	ACCESOS	t	2018-03-07 12:33:45	\N	6
962	10	1	19	\N	1	\N	OFICINA TÉCNICA PARA EL FORTALECIMIENTO DE LA EMPRESA PUBLICA	OFEP	t	2018-03-07 12:33:45	\N	6
964	11	2	20	\N	1	\N	ZONA FRANCA INDUSTRIAL COMERCIAL SANTA CRUZ	ZFICSC	t	2018-03-07 12:33:45	\N	6
965	10	6	19	\N	1	\N	ENDE COBIJA	ENDE COBIJA	t	2018-03-07 12:33:45	\N	6
969	11	3	20	\N	1	\N	DISTRIBUIDORA DE ELECTRICIDAD ENDE ORURO S.A.	ENDE-ORURO	t	2018-03-07 12:33:45	\N	6
970	10	1	19	\N	1	\N	GENERACION Y SERVICIO DE ENERGIA DEL ALTIPLANO S.A. (GESEDAL)	GESEDAL	t	2018-03-07 12:33:45	\N	6
971	11	4	20	\N	1	\N	ENDE VALLE HERMOSO S.A.	ENDE-HERMOSO	t	2018-03-07 12:33:45	\N	6
972	11	5	20	\N	1	\N	DISTRIBUIDORA DE ELECTRICIDAD ENDE DEL BENI S.A.M.	ENDE-BENI	t	2018-03-07 12:33:45	\N	6
974	10	1	19	\N	1	\N	EMPRESA PUBLICA NACIONAL ESTRATEGICA DE YACIMIENTOS DE LITIO BOLIVIANOS	YLB	t	2018-03-07 12:33:45	\N	6
976	11	7	20	\N	1	\N	HOSPITAL DANIEL BRACAMONTE	HDBRACAMONTE	t	2018-03-07 12:33:45	\N	6
951	10	1	19	\N	1	1	MINISTERIO DE ENERGIAS	MIN-ENER	t	2018-03-07 12:33:45	2018-06-04 17:46:14	6
197	11	1	20	\N	1	1	EMPRESA PUBLICA DEPARTAMENTAL ESTRATEGICA DE AGUAS LA PAZ	EDALP	t	2018-03-07 12:33:32	2018-06-06 09:14:43	6
982	10	1	19	\N	1	\N	CAJA DE SALUD DEL SERVICIO NACIONAL DE CAMINOS Y RAMAS ANEXAS	CSSNCA	t	2018-06-25 16:47:16	\N	6
995	10	1	19	983	1	\N	DIRECCIÓN GENERAL DE LA HOJA DE COCA E INDUSTRIALIZACIÓN	DIGCOIN	t	2018-07-09 10:11:20	\N	6
\.


--
-- Data for Name: modulo; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY modulo (id, usuario_creador_id, usuario_modificador_id, nombre_servicio, descripcion, dominio, estado, fecha_creacion, fecha_modificacion) FROM stdin;
2	1	\N	Api Seguridad	asdasdasd	www.justicia.gob.bo	t	2018-09-14 12:45:34	\N
3	1	\N	Api Correspondecia	dori	www.correosjustica.gob.bo	t	2018-09-14 12:47:49	\N
6	1	\N	Ejempjjjjlo	asdasd	asdasd	t	2018-09-14 17:29:44	\N
\.


--
-- Name: modulo_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: postgres
--

SELECT pg_catalog.setval('modulo_id_seq', 11, true);


--
-- Data for Name: permiso; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY permiso (id, usuario_creador_id, usuario_modificador_id, nombre, descripcion, activo, fecha_creacion, fecha_modificacion, modulo_id) FROM stdin;
1	1	\N	ROLE_PERMISO_LEER	Permiso para leer los registros	t	2018-02-01 00:00:00	\N	2
2	1	\N	ROLE_PERMISO_ESCRIBIR	permisp para escribir	t	2018-02-01 00:00:00	\N	2
3	1	\N	ROLE_USUARIO_SEGURIDAD_CREAR	Permiso para crear usuarios en modulo seguridad	t	2018-09-18 14:37:08	\N	2
4	1	\N	ROLE_USUARIO_SEGURIDAD_EDITAR	Permiso para editar usuarios en modulo seguridad	t	2018-09-18 14:41:55	\N	3
\.


--
-- Data for Name: permiso_elemento_menu; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY permiso_elemento_menu (menu_id, permiso_id) FROM stdin;
\.


--
-- Name: permiso_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: postgres
--

SELECT pg_catalog.setval('permiso_id_seq', 4, true);


--
-- Data for Name: rol; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY rol (id, usuario_creador_id, usuario_modificador_id, nombre, descripcion, activo, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- Name: rol_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: postgres
--

SELECT pg_catalog.setval('rol_id_seq', 1, false);


--
-- Data for Name: rol_permiso; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY rol_permiso (rol_id, permiso_id) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY usuario (id, usuario_creador_id, usuario_modificador_id, nombre_usuario, clave, fecha_creacion, fecha_modificacion, fecha_asignacion, fecha_alta, fecha_baja, activo) FROM stdin;
1	1	\N	admin	$2y$13$Uv3bWP29BiMEb.TiJdk.AuFVIiYdHc.DbqLwqtL8WWPwqa9TmBP7G	2018-02-01 00:00:00	\N	2018-02-01	2018-02-01	\N	t
2	1	\N	pruebas	$2y$13$Uv3bWP29BiMEb.TiJdk.AuFVIiYdHc.DbqLwqtL8WWPwqa9TmBP7G	2018-02-01 00:00:00	\N	2018-02-01	2018-02-01	\N	f
5	1	\N	jllusco7039950	$2y$13$WMobApHIcqHMFYEKG3pnL.W1Gt9kIu.a4kwm.GpZtonM7bOOjUHmK	2018-09-14 11:06:39	\N	2018-09-14	2018-09-14	\N	t
6	1	\N	dyugar	$2y$13$xMKIFj3ks8ShpcP6IxMOpO2vDUzpRX/HZjTXbvlpe.oO3EAg1skx2	2018-09-14 11:07:33	\N	2018-09-14	2018-09-14	\N	t
7	1	\N	lyoung	$2y$13$VX9TMkrXsoceQm5iSkDVXubCx62YoybO2u.krrrLm7Fv5F7iW3QcW	2018-09-14 11:29:27	\N	2018-09-14	2018-09-14	\N	t
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: seguridad; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 7, true);


--
-- Data for Name: usuario_permiso; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY usuario_permiso (usuario_id, permiso_id) FROM stdin;
\.


--
-- Data for Name: usuario_rol; Type: TABLE DATA; Schema: seguridad; Owner: postgres
--

COPY usuario_rol (usuario_id, rol_id) FROM stdin;
\.


SET search_path = oauth, pg_catalog;

--
-- Name: oauth2_access_tokens_pkey; Type: CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_access_tokens
    ADD CONSTRAINT oauth2_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth2_auth_codes_pkey; Type: CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_auth_codes
    ADD CONSTRAINT oauth2_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth2_clients_pkey; Type: CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_clients
    ADD CONSTRAINT oauth2_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth2_refresh_tokens_pkey; Type: CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_refresh_tokens
    ADD CONSTRAINT oauth2_refresh_tokens_pkey PRIMARY KEY (id);


SET search_path = plataforma, pg_catalog;

--
-- Name: etapa_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY etapa
    ADD CONSTRAINT etapa_pkey PRIMARY KEY (id);


--
-- Name: grupo_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);


--
-- Name: institucion_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);


--
-- Name: mensaje_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id);


--
-- Name: meta_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY meta
    ADD CONSTRAINT meta_pkey PRIMARY KEY (id);


--
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: pilares_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY pilares
    ADD CONSTRAINT pilares_pkey PRIMARY KEY (id);


--
-- Name: producto_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- Name: provincia_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);


--
-- Name: proyecto_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (id);


--
-- Name: registro_variable_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY registro_variable
    ADD CONSTRAINT registro_variable_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: seguimiento_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY seguimiento
    ADD CONSTRAINT seguimiento_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: valor_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY valor
    ADD CONSTRAINT valor_pkey PRIMARY KEY (id);


--
-- Name: variable_pkey; Type: CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (id);


SET search_path = portal_transparencia, pg_catalog;

--
-- Name: actividad_archivos_imagenes_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY actividad_archivos_imagenes
    ADD CONSTRAINT actividad_archivos_imagenes_pkey PRIMARY KEY (id_archivo);


--
-- Name: actividades_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id_actividad);


--
-- Name: articulos_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (id_articulo);


--
-- Name: asistentes_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY asistentes
    ADD CONSTRAINT asistentes_pkey PRIMARY KEY (id_asistente);


--
-- Name: asistentes_rpc_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY asistentes_rpc
    ADD CONSTRAINT asistentes_rpc_pkey PRIMARY KEY (id_asistente);


--
-- Name: categoria_entidad_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY categoria_entidad
    ADD CONSTRAINT categoria_entidad_pkey PRIMARY KEY (id_categoria);


--
-- Name: componente_portal_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY componente_portal
    ADD CONSTRAINT componente_portal_pkey PRIMARY KEY (id_componente);


--
-- Name: consultas_ciudadano_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY consultas_ciudadano
    ADD CONSTRAINT consultas_ciudadano_pkey PRIMARY KEY (id_consulta);


--
-- Name: cronogramas_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT cronogramas_pkey PRIMARY KEY (id_cronograma);


--
-- Name: cursos_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);


--
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento);


--
-- Name: enlaces_componente_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY enlaces_componente
    ADD CONSTRAINT enlaces_componente_pkey PRIMARY KEY (id_enlace);


--
-- Name: entidades_params_web_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades_params_web
    ADD CONSTRAINT entidades_params_web_pkey PRIMARY KEY (id_entidad_param);


--
-- Name: entidades_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades
    ADD CONSTRAINT entidades_pkey PRIMARY KEY (id_entidad);


--
-- Name: entidades_rpc_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades_rpc
    ADD CONSTRAINT entidades_rpc_pkey PRIMARY KEY (id_entidad_rpc);


--
-- Name: horarios_curso_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY horarios_curso
    ADD CONSTRAINT horarios_curso_pkey PRIMARY KEY (id_horario);


--
-- Name: invitaciones_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY invitaciones
    ADD CONSTRAINT invitaciones_pkey PRIMARY KEY (id_invitacion);


--
-- Name: modulos_curso_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY modulos_curso
    ADD CONSTRAINT modulos_curso_pkey PRIMARY KEY (id_modulo);


--
-- Name: organizaciones_sociales_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY organizaciones_sociales
    ADD CONSTRAINT organizaciones_sociales_pkey PRIMARY KEY (id_organizacion_social);


--
-- Name: parametros_paginas_web_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY parametros_paginas_web
    ADD CONSTRAINT parametros_paginas_web_pkey PRIMARY KEY (id_parametro);


--
-- Name: personas_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (nro_carnet);


--
-- Name: requisitos_curso_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY requisitos_curso
    ADD CONSTRAINT requisitos_curso_pkey PRIMARY KEY (id_requisito);


--
-- Name: resultados_actividad_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY resultados_actividad
    ADD CONSTRAINT resultados_actividad_pkey PRIMARY KEY (id_resultado);


--
-- Name: resultados_rpc_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY resultados_rpc
    ADD CONSTRAINT resultados_rpc_pkey PRIMARY KEY (id_resultado);


--
-- Name: rpc_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY rpc
    ADD CONSTRAINT rpc_pkey PRIMARY KEY (id_rendicion);


--
-- Name: seccion_informativa_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY seccion_informativa
    ADD CONSTRAINT seccion_informativa_pkey PRIMARY KEY (id_seccion);


--
-- Name: tipos_actividad_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY tipos_actividad
    ADD CONSTRAINT tipos_actividad_pkey PRIMARY KEY (id_tipo_actividad);


--
-- Name: tipos_rpc_pkey; Type: CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY tipos_rpc
    ADD CONSTRAINT tipos_rpc_pkey PRIMARY KEY (id_tipo_rpc);


SET search_path = public, pg_catalog;

--
-- Name: mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id);


--
-- Name: meta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meta
    ADD CONSTRAINT meta_pkey PRIMARY KEY (id);


--
-- Name: migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- Name: pilares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pilares
    ADD CONSTRAINT pilares_pkey PRIMARY KEY (id);


--
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- Name: seguimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguimiento
    ADD CONSTRAINT seguimiento_pkey PRIMARY KEY (id);


SET search_path = seguridad, pg_catalog;

--
-- Name: elemento_menu_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY elemento_menu
    ADD CONSTRAINT elemento_menu_pkey PRIMARY KEY (id);


--
-- Name: entidad_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (id);


--
-- Name: modulo_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (id);


--
-- Name: permiso_elemento_menu_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY permiso_elemento_menu
    ADD CONSTRAINT permiso_elemento_menu_pkey PRIMARY KEY (menu_id, permiso_id);


--
-- Name: permiso_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id);


--
-- Name: rol_permiso_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT rol_permiso_pkey PRIMARY KEY (rol_id, permiso_id);


--
-- Name: rol_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);


--
-- Name: usuario_permiso_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario_permiso
    ADD CONSTRAINT usuario_permiso_pkey PRIMARY KEY (usuario_id, permiso_id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario_rol_pkey; Type: CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT usuario_rol_pkey PRIMARY KEY (usuario_id, rol_id);


SET search_path = oauth, pg_catalog;

--
-- Name: idx_3d060f9119eb6921; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE INDEX idx_3d060f9119eb6921 ON oauth2_auth_codes USING btree (client_id);


--
-- Name: idx_3d060f91a76ed395; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE INDEX idx_3d060f91a76ed395 ON oauth2_auth_codes USING btree (user_id);


--
-- Name: idx_ad1bb9dc19eb6921; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE INDEX idx_ad1bb9dc19eb6921 ON oauth2_refresh_tokens USING btree (client_id);


--
-- Name: idx_ad1bb9dca76ed395; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE INDEX idx_ad1bb9dca76ed395 ON oauth2_refresh_tokens USING btree (user_id);


--
-- Name: idx_ecc54f1619eb6921; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE INDEX idx_ecc54f1619eb6921 ON oauth2_access_tokens USING btree (client_id);


--
-- Name: idx_ecc54f16a76ed395; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE INDEX idx_ecc54f16a76ed395 ON oauth2_access_tokens USING btree (user_id);


--
-- Name: uniq_3d060f915f37a13b; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE UNIQUE INDEX uniq_3d060f915f37a13b ON oauth2_auth_codes USING btree (token);


--
-- Name: uniq_ad1bb9dc5f37a13b; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE UNIQUE INDEX uniq_ad1bb9dc5f37a13b ON oauth2_refresh_tokens USING btree (token);


--
-- Name: uniq_ecc54f165f37a13b; Type: INDEX; Schema: oauth; Owner: postgres
--

CREATE UNIQUE INDEX uniq_ecc54f165f37a13b ON oauth2_access_tokens USING btree (token);


SET search_path = plataforma, pg_catalog;

--
-- Name: idx_183f7410f625d1ba; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_183f7410f625d1ba ON etapa USING btree (proyecto_id);


--
-- Name: idx_1984e2fcf3037e8e; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_1984e2fcf3037e8e ON valor USING btree (variable_id);


--
-- Name: idx_20c30deb8346f13; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_20c30deb8346f13 ON meta USING btree (pilares_id);


--
-- Name: idx_2c3fb174b239fbc6; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_2c3fb174b239fbc6 ON usuario USING btree (institucion_id);


--
-- Name: idx_2c3fb174f5f88db9; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_2c3fb174f5f88db9 ON usuario USING btree (persona_id);


--
-- Name: idx_5375a54ff3037e8e; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_5375a54ff3037e8e ON registro_variable USING btree (variable_id);


--
-- Name: idx_5375a54ff625d1ba; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_5375a54ff625d1ba ON registro_variable USING btree (proyecto_id);


--
-- Name: idx_7aa60a47f625d1ba; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_7aa60a47f625d1ba ON seguimiento USING btree (proyecto_id);


--
-- Name: idx_8133eb13db38439e; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_8133eb13db38439e ON roles USING btree (usuario_id);


--
-- Name: idx_8ef145e09c833003; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_8ef145e09c833003 ON variable USING btree (grupo_id);


--
-- Name: idx_cdd954c74e7121af; Type: INDEX; Schema: plataforma; Owner: postgres
--

CREATE INDEX idx_cdd954c74e7121af ON municipio USING btree (provincia_id);


SET search_path = portal_transparencia, pg_catalog;

--
-- Name: idx_1449fb0424be01dc; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_1449fb0424be01dc ON requisitos_curso USING btree (id_curso);


--
-- Name: idx_159911aebf16c07b; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_159911aebf16c07b ON enlaces_componente USING btree (id_componente);


--
-- Name: idx_2d74140c9b1a19bb; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_2d74140c9b1a19bb ON cursos USING btree (id_entidad);


--
-- Name: idx_30f96d6610afd4b1; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_30f96d6610afd4b1 ON asistentes_rpc USING btree (id_entidad_rpc);


--
-- Name: idx_3bc50e63bf16c07b; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_3bc50e63bf16c07b ON tipos_actividad USING btree (id_componente);


--
-- Name: idx_488220e4dc70121; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_488220e4dc70121 ON resultados_actividad USING btree (id_actividad);


--
-- Name: idx_62bd392352fabf4e; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_62bd392352fabf4e ON actividades USING btree (id_tipo_actividad);


--
-- Name: idx_62bd39239b1a19bb; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_62bd39239b1a19bb ON actividades USING btree (id_entidad);


--
-- Name: idx_763834ba9b1a19bb; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_763834ba9b1a19bb ON entidades_params_web USING btree (id_entidad);


--
-- Name: idx_763834bacc27c578; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_763834bacc27c578 ON entidades_params_web USING btree (id_parametro);


--
-- Name: idx_8331a7739b1a19bb; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_8331a7739b1a19bb ON entidades_rpc USING btree (id_entidad);


--
-- Name: idx_8331a773da5611b8; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_8331a773da5611b8 ON entidades_rpc USING btree (id_rendicion);


--
-- Name: idx_94af418c2c12a223; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_94af418c2c12a223 ON rpc USING btree (id_tipo_rpc);


--
-- Name: idx_9abc9b4510afd4b1; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_9abc9b4510afd4b1 ON cronogramas USING btree (id_entidad_rpc);


--
-- Name: idx_9abc9b456325e299; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_9abc9b456325e299 ON cronogramas USING btree (id_departamento);


--
-- Name: idx_a0f5f82210afd4b1; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_a0f5f82210afd4b1 ON resultados_rpc USING btree (id_entidad_rpc);


--
-- Name: idx_b8bffc9fbf16c07b; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_b8bffc9fbf16c07b ON seccion_informativa USING btree (id_componente);


--
-- Name: idx_c34844bf6325e299; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_c34844bf6325e299 ON personas USING btree (id_departamento);


--
-- Name: idx_ddc64cbebf16c07b; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_ddc64cbebf16c07b ON consultas_ciudadano USING btree (id_componente);


--
-- Name: idx_e00ca004bf16c07b; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_e00ca004bf16c07b ON articulos USING btree (id_componente);


--
-- Name: idx_eb1507d0b5c87cf1; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_eb1507d0b5c87cf1 ON invitaciones USING btree (id_organizacion_social);


--
-- Name: idx_eb1507d0c0b2a2d8; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_eb1507d0c0b2a2d8 ON invitaciones USING btree (id_cronograma);


--
-- Name: idx_eb1507d0c8081b5c; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_eb1507d0c8081b5c ON invitaciones USING btree (nro_carnet);


--
-- Name: idx_ec851f96dc70121; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_ec851f96dc70121 ON actividad_archivos_imagenes USING btree (id_actividad);


--
-- Name: idx_f130e74724be01dc; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_f130e74724be01dc ON horarios_curso USING btree (id_curso);


--
-- Name: idx_f537086ce25ae0a; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_f537086ce25ae0a ON entidades USING btree (id_categoria);


--
-- Name: idx_f5cd6c4d24be01dc; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_f5cd6c4d24be01dc ON modulos_curso USING btree (id_curso);


--
-- Name: idx_f73960e7dc70121; Type: INDEX; Schema: portal_transparencia; Owner: postgres
--

CREATE INDEX idx_f73960e7dc70121 ON asistentes USING btree (id_actividad);


SET search_path = public, pg_catalog;

--
-- Name: idx_d7f21435b8346f13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d7f21435b8346f13 ON meta USING btree (pilares_id);


SET search_path = seguridad, pg_catalog;

--
-- Name: idx_363462842de240fd; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_363462842de240fd ON permiso USING btree (usuario_modificador_id);


--
-- Name: idx_3634628491c4469f; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_3634628491c4469f ON permiso USING btree (usuario_creador_id);


--
-- Name: idx_36346284c07f55f5; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_36346284c07f55f5 ON permiso USING btree (modulo_id);


--
-- Name: idx_4001c4448f04052b; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_4001c4448f04052b ON elemento_menu USING btree (elemento_padre_id);


--
-- Name: idx_6ca8fa5a6cefad37; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_6ca8fa5a6cefad37 ON permiso_elemento_menu USING btree (permiso_id);


--
-- Name: idx_6ca8fa5accd7e912; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_6ca8fa5accd7e912 ON permiso_elemento_menu USING btree (menu_id);


--
-- Name: idx_78f4819e4bab96c; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_78f4819e4bab96c ON rol_permiso USING btree (rol_id);


--
-- Name: idx_78f4819e6cefad37; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_78f4819e6cefad37 ON rol_permiso USING btree (permiso_id);


--
-- Name: idx_8ec979d11d912d14; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_8ec979d11d912d14 ON entidad USING btree (entidad_tutora_id);


--
-- Name: idx_8ec979d15a91c08d; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_8ec979d15a91c08d ON entidad USING btree (departamento_id);


--
-- Name: idx_8ec979d16dc9ed25; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_8ec979d16dc9ed25 ON entidad USING btree (alcance_id);


--
-- Name: idx_8ec979d191c4469f; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_8ec979d191c4469f ON entidad USING btree (usuario_creador_id);


--
-- Name: idx_8ec979d196bcbda2; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_8ec979d196bcbda2 ON entidad USING btree (usuario_ultima_modificacion_id);


--
-- Name: idx_8ec979d1fd2406c7; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_8ec979d1fd2406c7 ON entidad USING btree (tipo_entidad_id);


--
-- Name: idx_9b3544b46cefad37; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_9b3544b46cefad37 ON usuario_permiso USING btree (permiso_id);


--
-- Name: idx_9b3544b4db38439e; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_9b3544b4db38439e ON usuario_permiso USING btree (usuario_id);


--
-- Name: idx_a1df8bd82de240fd; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_a1df8bd82de240fd ON rol USING btree (usuario_modificador_id);


--
-- Name: idx_a1df8bd891c4469f; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_a1df8bd891c4469f ON rol USING btree (usuario_creador_id);


--
-- Name: idx_b17bb2234bab96c; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_b17bb2234bab96c ON usuario_rol USING btree (rol_id);


--
-- Name: idx_b17bb223db38439e; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_b17bb223db38439e ON usuario_rol USING btree (usuario_id);


--
-- Name: idx_c38b59862de240fd; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_c38b59862de240fd ON modulo USING btree (usuario_modificador_id);


--
-- Name: idx_c38b598691c4469f; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_c38b598691c4469f ON modulo USING btree (usuario_creador_id);


--
-- Name: idx_e92b79472de240fd; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_e92b79472de240fd ON usuario USING btree (usuario_modificador_id);


--
-- Name: idx_e92b794791c4469f; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE INDEX idx_e92b794791c4469f ON usuario USING btree (usuario_creador_id);


--
-- Name: uniq_363462843a909126; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE UNIQUE INDEX uniq_363462843a909126 ON permiso USING btree (nombre);


--
-- Name: uniq_a1df8bd83a909126; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE UNIQUE INDEX uniq_a1df8bd83a909126 ON rol USING btree (nombre);


--
-- Name: uniq_e92b7947d67cf11d; Type: INDEX; Schema: seguridad; Owner: postgres
--

CREATE UNIQUE INDEX uniq_e92b7947d67cf11d ON usuario USING btree (nombre_usuario);


SET search_path = oauth, pg_catalog;

--
-- Name: fk_3d060f9119eb6921; Type: FK CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_auth_codes
    ADD CONSTRAINT fk_3d060f9119eb6921 FOREIGN KEY (client_id) REFERENCES oauth2_clients(id);


--
-- Name: fk_3d060f91a76ed395; Type: FK CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_auth_codes
    ADD CONSTRAINT fk_3d060f91a76ed395 FOREIGN KEY (user_id) REFERENCES seguridad.usuario(id);


--
-- Name: fk_ad1bb9dc19eb6921; Type: FK CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_refresh_tokens
    ADD CONSTRAINT fk_ad1bb9dc19eb6921 FOREIGN KEY (client_id) REFERENCES oauth2_clients(id);


--
-- Name: fk_ad1bb9dca76ed395; Type: FK CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_refresh_tokens
    ADD CONSTRAINT fk_ad1bb9dca76ed395 FOREIGN KEY (user_id) REFERENCES seguridad.usuario(id);


--
-- Name: fk_ecc54f1619eb6921; Type: FK CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_access_tokens
    ADD CONSTRAINT fk_ecc54f1619eb6921 FOREIGN KEY (client_id) REFERENCES oauth2_clients(id);


--
-- Name: fk_ecc54f16a76ed395; Type: FK CONSTRAINT; Schema: oauth; Owner: postgres
--

ALTER TABLE ONLY oauth2_access_tokens
    ADD CONSTRAINT fk_ecc54f16a76ed395 FOREIGN KEY (user_id) REFERENCES seguridad.usuario(id);


SET search_path = plataforma, pg_catalog;

--
-- Name: fk_183f7410f625d1ba; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY etapa
    ADD CONSTRAINT fk_183f7410f625d1ba FOREIGN KEY (proyecto_id) REFERENCES proyecto(id);


--
-- Name: fk_1984e2fcf3037e8e; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY valor
    ADD CONSTRAINT fk_1984e2fcf3037e8e FOREIGN KEY (variable_id) REFERENCES variable(id);


--
-- Name: fk_20c30deb8346f13; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY meta
    ADD CONSTRAINT fk_20c30deb8346f13 FOREIGN KEY (pilares_id) REFERENCES pilares(id);


--
-- Name: fk_2c3fb174b239fbc6; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_2c3fb174b239fbc6 FOREIGN KEY (institucion_id) REFERENCES institucion(id);


--
-- Name: fk_2c3fb174f5f88db9; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_2c3fb174f5f88db9 FOREIGN KEY (persona_id) REFERENCES persona(id);


--
-- Name: fk_5375a54ff3037e8e; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY registro_variable
    ADD CONSTRAINT fk_5375a54ff3037e8e FOREIGN KEY (variable_id) REFERENCES variable(id);


--
-- Name: fk_5375a54ff625d1ba; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY registro_variable
    ADD CONSTRAINT fk_5375a54ff625d1ba FOREIGN KEY (proyecto_id) REFERENCES proyecto(id);


--
-- Name: fk_7aa60a47f625d1ba; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY seguimiento
    ADD CONSTRAINT fk_7aa60a47f625d1ba FOREIGN KEY (proyecto_id) REFERENCES proyecto(id);


--
-- Name: fk_8133eb13db38439e; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT fk_8133eb13db38439e FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: fk_8ef145e09c833003; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY variable
    ADD CONSTRAINT fk_8ef145e09c833003 FOREIGN KEY (grupo_id) REFERENCES grupo(id);


--
-- Name: fk_cdd954c74e7121af; Type: FK CONSTRAINT; Schema: plataforma; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT fk_cdd954c74e7121af FOREIGN KEY (provincia_id) REFERENCES provincia(id);


SET search_path = portal_transparencia, pg_catalog;

--
-- Name: fk_1449fb0424be01dc; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY requisitos_curso
    ADD CONSTRAINT fk_1449fb0424be01dc FOREIGN KEY (id_curso) REFERENCES cursos(id_curso);


--
-- Name: fk_159911aebf16c07b; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY enlaces_componente
    ADD CONSTRAINT fk_159911aebf16c07b FOREIGN KEY (id_componente) REFERENCES componente_portal(id_componente);


--
-- Name: fk_2d74140c9b1a19bb; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT fk_2d74140c9b1a19bb FOREIGN KEY (id_entidad) REFERENCES entidades(id_entidad);


--
-- Name: fk_30f96d6610afd4b1; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY asistentes_rpc
    ADD CONSTRAINT fk_30f96d6610afd4b1 FOREIGN KEY (id_entidad_rpc) REFERENCES entidades_rpc(id_entidad_rpc);


--
-- Name: fk_3bc50e63bf16c07b; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY tipos_actividad
    ADD CONSTRAINT fk_3bc50e63bf16c07b FOREIGN KEY (id_componente) REFERENCES componente_portal(id_componente);


--
-- Name: fk_488220e4dc70121; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY resultados_actividad
    ADD CONSTRAINT fk_488220e4dc70121 FOREIGN KEY (id_actividad) REFERENCES actividades(id_actividad);


--
-- Name: fk_62bd392352fabf4e; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY actividades
    ADD CONSTRAINT fk_62bd392352fabf4e FOREIGN KEY (id_tipo_actividad) REFERENCES tipos_actividad(id_tipo_actividad);


--
-- Name: fk_62bd39239b1a19bb; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY actividades
    ADD CONSTRAINT fk_62bd39239b1a19bb FOREIGN KEY (id_entidad) REFERENCES entidades(id_entidad);


--
-- Name: fk_763834ba9b1a19bb; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades_params_web
    ADD CONSTRAINT fk_763834ba9b1a19bb FOREIGN KEY (id_entidad) REFERENCES entidades(id_entidad);


--
-- Name: fk_763834bacc27c578; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades_params_web
    ADD CONSTRAINT fk_763834bacc27c578 FOREIGN KEY (id_parametro) REFERENCES parametros_paginas_web(id_parametro);


--
-- Name: fk_8331a7739b1a19bb; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades_rpc
    ADD CONSTRAINT fk_8331a7739b1a19bb FOREIGN KEY (id_entidad) REFERENCES entidades(id_entidad);


--
-- Name: fk_8331a773da5611b8; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades_rpc
    ADD CONSTRAINT fk_8331a773da5611b8 FOREIGN KEY (id_rendicion) REFERENCES rpc(id_rendicion);


--
-- Name: fk_94af418c2c12a223; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY rpc
    ADD CONSTRAINT fk_94af418c2c12a223 FOREIGN KEY (id_tipo_rpc) REFERENCES tipos_rpc(id_tipo_rpc);


--
-- Name: fk_9abc9b4510afd4b1; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT fk_9abc9b4510afd4b1 FOREIGN KEY (id_entidad_rpc) REFERENCES entidades_rpc(id_entidad_rpc);


--
-- Name: fk_9abc9b456325e299; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT fk_9abc9b456325e299 FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);


--
-- Name: fk_a0f5f82210afd4b1; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY resultados_rpc
    ADD CONSTRAINT fk_a0f5f82210afd4b1 FOREIGN KEY (id_entidad_rpc) REFERENCES entidades_rpc(id_entidad_rpc);


--
-- Name: fk_b8bffc9fbf16c07b; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY seccion_informativa
    ADD CONSTRAINT fk_b8bffc9fbf16c07b FOREIGN KEY (id_componente) REFERENCES componente_portal(id_componente);


--
-- Name: fk_c34844bf6325e299; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_c34844bf6325e299 FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);


--
-- Name: fk_ddc64cbebf16c07b; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY consultas_ciudadano
    ADD CONSTRAINT fk_ddc64cbebf16c07b FOREIGN KEY (id_componente) REFERENCES componente_portal(id_componente);


--
-- Name: fk_e00ca004bf16c07b; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT fk_e00ca004bf16c07b FOREIGN KEY (id_componente) REFERENCES componente_portal(id_componente);


--
-- Name: fk_eb1507d0b5c87cf1; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY invitaciones
    ADD CONSTRAINT fk_eb1507d0b5c87cf1 FOREIGN KEY (id_organizacion_social) REFERENCES organizaciones_sociales(id_organizacion_social);


--
-- Name: fk_eb1507d0c0b2a2d8; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY invitaciones
    ADD CONSTRAINT fk_eb1507d0c0b2a2d8 FOREIGN KEY (id_cronograma) REFERENCES cronogramas(id_cronograma);


--
-- Name: fk_eb1507d0c8081b5c; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY invitaciones
    ADD CONSTRAINT fk_eb1507d0c8081b5c FOREIGN KEY (nro_carnet) REFERENCES personas(nro_carnet);


--
-- Name: fk_ec851f96dc70121; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY actividad_archivos_imagenes
    ADD CONSTRAINT fk_ec851f96dc70121 FOREIGN KEY (id_actividad) REFERENCES actividades(id_actividad);


--
-- Name: fk_f130e74724be01dc; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY horarios_curso
    ADD CONSTRAINT fk_f130e74724be01dc FOREIGN KEY (id_curso) REFERENCES cursos(id_curso);


--
-- Name: fk_f537086ce25ae0a; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY entidades
    ADD CONSTRAINT fk_f537086ce25ae0a FOREIGN KEY (id_categoria) REFERENCES categoria_entidad(id_categoria);


--
-- Name: fk_f5cd6c4d24be01dc; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY modulos_curso
    ADD CONSTRAINT fk_f5cd6c4d24be01dc FOREIGN KEY (id_curso) REFERENCES cursos(id_curso);


--
-- Name: fk_f73960e7dc70121; Type: FK CONSTRAINT; Schema: portal_transparencia; Owner: postgres
--

ALTER TABLE ONLY asistentes
    ADD CONSTRAINT fk_f73960e7dc70121 FOREIGN KEY (id_actividad) REFERENCES actividades(id_actividad);


SET search_path = public, pg_catalog;

--
-- Name: fk_d7f21435b8346f13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meta
    ADD CONSTRAINT fk_d7f21435b8346f13 FOREIGN KEY (pilares_id) REFERENCES pilares(id);


SET search_path = seguridad, pg_catalog;

--
-- Name: fk_363462842de240fd; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_363462842de240fd FOREIGN KEY (usuario_modificador_id) REFERENCES usuario(id);


--
-- Name: fk_3634628491c4469f; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_3634628491c4469f FOREIGN KEY (usuario_creador_id) REFERENCES usuario(id);


--
-- Name: fk_36346284c07f55f5; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_36346284c07f55f5 FOREIGN KEY (modulo_id) REFERENCES modulo(id);


--
-- Name: fk_4001c4448f04052b; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY elemento_menu
    ADD CONSTRAINT fk_4001c4448f04052b FOREIGN KEY (elemento_padre_id) REFERENCES elemento_menu(id);


--
-- Name: fk_487141ab1d912d14; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT fk_487141ab1d912d14 FOREIGN KEY (entidad_tutora_id) REFERENCES entidad(id);


--
-- Name: fk_487141ab91c4469f; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT fk_487141ab91c4469f FOREIGN KEY (usuario_creador_id) REFERENCES usuario(id);


--
-- Name: fk_487141ab96bcbda2; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT fk_487141ab96bcbda2 FOREIGN KEY (usuario_ultima_modificacion_id) REFERENCES usuario(id);


--
-- Name: fk_6ca8fa5a6cefad37; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY permiso_elemento_menu
    ADD CONSTRAINT fk_6ca8fa5a6cefad37 FOREIGN KEY (permiso_id) REFERENCES permiso(id) ON DELETE CASCADE;


--
-- Name: fk_6ca8fa5accd7e912; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY permiso_elemento_menu
    ADD CONSTRAINT fk_6ca8fa5accd7e912 FOREIGN KEY (menu_id) REFERENCES elemento_menu(id) ON DELETE CASCADE;


--
-- Name: fk_78f4819e4bab96c; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT fk_78f4819e4bab96c FOREIGN KEY (rol_id) REFERENCES rol(id) ON DELETE CASCADE;


--
-- Name: fk_78f4819e6cefad37; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY rol_permiso
    ADD CONSTRAINT fk_78f4819e6cefad37 FOREIGN KEY (permiso_id) REFERENCES permiso(id) ON DELETE CASCADE;


--
-- Name: fk_9b3544b46cefad37; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario_permiso
    ADD CONSTRAINT fk_9b3544b46cefad37 FOREIGN KEY (permiso_id) REFERENCES permiso(id) ON DELETE CASCADE;


--
-- Name: fk_9b3544b4db38439e; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario_permiso
    ADD CONSTRAINT fk_9b3544b4db38439e FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE;


--
-- Name: fk_a1df8bd82de240fd; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT fk_a1df8bd82de240fd FOREIGN KEY (usuario_modificador_id) REFERENCES usuario(id);


--
-- Name: fk_a1df8bd891c4469f; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT fk_a1df8bd891c4469f FOREIGN KEY (usuario_creador_id) REFERENCES usuario(id);


--
-- Name: fk_b17bb2234bab96c; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_b17bb2234bab96c FOREIGN KEY (rol_id) REFERENCES rol(id) ON DELETE CASCADE;


--
-- Name: fk_b17bb223db38439e; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk_b17bb223db38439e FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE;


--
-- Name: fk_c38b59862de240fd; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT fk_c38b59862de240fd FOREIGN KEY (usuario_modificador_id) REFERENCES usuario(id);


--
-- Name: fk_c38b598691c4469f; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT fk_c38b598691c4469f FOREIGN KEY (usuario_creador_id) REFERENCES usuario(id);


--
-- Name: fk_e92b79472de240fd; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_e92b79472de240fd FOREIGN KEY (usuario_modificador_id) REFERENCES usuario(id);


--
-- Name: fk_e92b794791c4469f; Type: FK CONSTRAINT; Schema: seguridad; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_e92b794791c4469f FOREIGN KEY (usuario_creador_id) REFERENCES usuario(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
