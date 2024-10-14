<?php
// Parámetros básicos de configuración de la base de datos
define( 'DB_NAME', getenv('DB_DATABASE') );
define( 'DB_USER', getenv('DB_USER') );
define( 'DB_PASSWORD', getenv('DB_USERPASS') );
define( 'DB_HOST', 'DB_HOSTNAME' );

// Prefijo de las tablas de la base de datos
$table_prefix = 'wp_';
