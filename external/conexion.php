<?php
	
define( '_JEXEC', 1 );
define( 'JPATH_BASE', realpath(dirname(dirname(__DIR__)))."/joomla-torneos");
define( 'DS', DIRECTORY_SEPARATOR );
require_once ( JPATH_BASE .DS.'includes'.DS.'defines.php' );
require_once ( JPATH_BASE .DS.'includes'.DS.'framework.php' );
$mainframe =& JFactory::getApplication('site');
$mainframe->initialise();

JHtml::_('bootstrap.framework');

//$db =& JFactory::getDbo();

$option = array(); //prevent problems

$option['driver']   = 'mysql';            // Database driver name
$option['host']     = 'localhost';    // Database host name
$option['user']     = 'root';       // User for database authentication
$option['password'] = '12345';   // Password for database authentication
$option['database'] = 'torneos';      // Database name
$option['prefix']   = '';             // Database prefix (may be empty)

//Hacemos el SQL

//print_r($results);
//$user =& JFactory::getUser();

//Recuperamos los valores del usuario así.
//$user->id	
?>