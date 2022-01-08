<?php
$webhookurl = "https://discord.com/api/webhooks/810558079804375091/jR8opON_jgXWgEXbK7O0pF8u1v04X9ONaUN8H21WG1hhuBClLETb2CRZ6PQA-xXy_BQU";
$hwidTypes = array("Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint");

$database = array(
);


$timestamp = date("c", strtotime("now"));

$ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : 'not found ip';
$iklolimnoob = isset(getallheaders()["Syn-Fingerprint"]) ?getallheaders()["Syn-Fingerprint"] : 'couldnt get hwid (maybe snitch)'; //hwid
$kecccy = isset($_GET["key"]) ? $_GET["key"] : 'not found key';

$json_data = json_encode([
    "username" => "Kraken Logger",
    "tts" => false,
    "embeds" => [
        [
            "timestamp" => $timestamp,
            "color" => hexdec( "3366ff" ),
            "footer" => [
                "text" => "Kraken"
            ],
            "author" => [
                "name" => "First Time Execute:"
            ],
            "fields" => [
                [
                    "name" => "Key Used:",
                    "value" => $kecccy,
                    "inline" => false
                ],
                [
                    "name" => "IP Address:",
                    "value" => $ip,
                    "inline" => false
                ],
                [
                    "name" => "Synapse HWID:",
                    "value" => $iklolimnoob,
                    "inline" => false
                ],
                [
                    "name" => "hwid checksum (ignore if hwid not found)",
                    "value" => crc32($iklolimnoob),
                    "inline" => false
                ],
            ]
        ]
    ]

], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE );

$ch = curl_init( $webhookurl );
curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-type: application/json'));
curl_setopt( $ch, CURLOPT_POST, 1);
curl_setopt( $ch, CURLOPT_POSTFIELDS, $json_data);
curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt( $ch, CURLOPT_HEADER, 0);
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);

if (isset($_GET["key"])) {
		


	$response = curl_exec( $ch );
	// If you need to debug, or find out why you can't send message uncomment line below, and execute script.
	// echo $response;
	curl_close( $ch );
	$didUserPass = FALSE;
	$errorMsg = "fuck you";
	$key = $_GET["key"];

	foreach($database as $_ => $stored_key) {
			$didUserPass = TRUE;
	}

	if (!$didUserPass) {
		echo($errorMsg);
	};
} else {
	echo file_get_contents("../PAGEDOESNTEXIST.html");
}

?>