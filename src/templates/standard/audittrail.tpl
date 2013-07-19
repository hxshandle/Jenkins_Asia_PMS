<!-- Audit trail -->
<ul>
{section name=audit loop=$audits}
  <li>{$audits[audit].user_name} {$audits[audit].action} {$audits[audit].comments|escape} at {$audits[audit].create_at}</li>
{/section}
</ul>
<!-- Audit trail end -->
