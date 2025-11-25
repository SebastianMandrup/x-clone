<?php

try {

	require_once __DIR__ . '/../x.php';

	$page = validatePage();

	require_once __DIR__ . '/../db_connector.php';

	$LIMIT = 4;
	$OFFSET = ($page - 1) * ($LIMIT - 1);

	$sql = "SELECT topic_pk, topic_name, topic_field, topic_count, topic_rank FROM topics ORDER BY topic_rank DESC LIMIT :_limit OFFSET :offset";
	$stmt = $_db->prepare($sql);
	$stmt->bindParam(':_limit', $LIMIT, PDO::PARAM_INT);
	$stmt->bindParam(':offset', $OFFSET, PDO::PARAM_INT);

	$stmt->execute();

	$trends = $stmt->fetchall();

	if (!$trends) {
		throw new Exception("No trends found.");
	}

	$last_page = false;

	// check if there are 4 results
	if (count($trends) < $LIMIT) {
		$last_page = true;
	}

	// remove last item if last page
	if (!$last_page) {
		array_pop($trends);
	}

	echo json_encode([
		'status' => 'success',
		'data' => $trends,
		'last_page' => $last_page
	]);
} catch (Exception $e) {
	echo json_encode([
		'status' => 'error',
		'message' => $e->getMessage()
	]);
}
