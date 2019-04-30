<?php

ob_start(function($output) {
	$xml = new DOMDocument();
	$xml->loadXML($output);

	$xsl = new DOMDocument();
	$xsl->load(__DIR__ . '/rss.xsl');

	$processor = new XSLTProcessor();
	$processor->importStylesheet($xsl);

	return $processor->transformToXml($xml);
});

ob_start(function($output) {
	$htmlDoctype = '<!doctype html>';
	$xmlDoctype = '<?xml version="1.0" encoding="utf-8"?>';
	$htmlOpenTag = '<html lang="cs">';
	$newHtmlOpenTag = '<html lang="cs" xmlns:xlink="http://www.w3.org/1999/xlink">';
	$output = substr_replace($output, $xmlDoctype, 0, strlen($htmlDoctype));
	return substr_replace($output, $newHtmlOpenTag, strlen($xmlDoctype) + 1, strlen($htmlOpenTag));
});

ob_start(function($output) {
	return preg_replace('~<script( [^>]+)?>.*?</script>~s', '', $output);
});

header('Content-Type: application/rss+xml; charset=utf-8', true);

readfile('https://www.sbazar.cz/' . $_SERVER['QUERY_STRING']);
