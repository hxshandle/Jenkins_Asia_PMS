<?PHP

require("init.php");

$project = new project();
$pt = new PerformanceTime();
$pt->start('test page');
$projects = $project->getProgress(557);

$pt->end('test page');
echo $projects;
echo 'done';
