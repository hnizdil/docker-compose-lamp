<?php

#http://www.bmwklub.cz/forum/feed.php?f=57

ob_start(function ($buffer) {
	return preg_replace('~^</feed>.*$~m', '</feed>', $buffer);
});

header('Content-Type: application/atom+xml; charset=UTF-8', true);

readfile($_SERVER['QUERY_STRING']);
