
<table  id="timeline1" cellpadding="0" cellspacing="1" border="0" class="thecal"">

{*calender head bereich*}
  <thead class="calhead">
    <tr>
      <th><a class="scroll_left" href = "javascript:getResourceCalByMonth({$py},{$pm});"></a></th>
      <th colspan="5" align="center">
        {*lokalisierter monat + jahr ausgeben*}
        {$mstring} {$y}
      </th>
      <th><a class="scroll_right" href = "javascript:getResourceCalByMonth({$ny},{$nm});"></a></th>
  </tr>
  {*tagesnamen ausgeben*}
  <tr class="dayhead">
    <th>{$langfile.monday}</th>
    <th>{$langfile.tuesday}</th>
    <th>{$langfile.wednesday}</th>
    <th>{$langfile.thursday}</th>
    <th>{$langfile.friday}</th>
    <th>{$langfile.saturday}</th>
    <th>{$langfile.sunday}</th>
  </tr>
  </thead>
  
  <tbody class = "content">

  {section name = week loop=$weeks}
    
    <tr valign="top">
    
    {*tage der aktuellen woche durchlaufen*}
    {section name = day loop=$weeks[week]}
    
      {**}
      {if $weeks[week][day].currmonth == 1}
        {*wenn es heute is, hervorheben*}     
        {if $thism == $m and $thisy == $y and $thisd == $weeks[week][day].val}
        <td class="today" id = "{$weeks[week][day].val}"><a href = "javascript:void(0)" onclick = "fadeToggle('t{$weeks[week][day].val}');">{$weeks[week][day].val}</a>
        {else}
        <td class="second  {if $weeks[week][day].tasksnum>0}hastask{/if}" id = "{$weeks[week][day].val}"><a href = "javascript:void(0)" >{$weeks[week][day].val}</a>
        {/if}
      {else}
        <td class="othermonth" id = "{$weeks[week][day].val}">{$weeks[week][day].val}
      {/if}
      

      
      {if $weeks[week][day].currmonth == 1}
      <div class="calcontent">
          {*Tasks*}
          {if $weeks[week][day].tasksnum > 0}
            {$weeks[week][day].taskname}:{$weeks[week][day].location}
          {/if} {*Tasks End*}
      </div> {*calcontent End*}
      {/if}
      </td>
      
  
    {*ende des tages*}
    {/section}
    </tr>
    
  {*ende der woche*}
  {/section}

  </tbody>
</table>
{*loading indicator off*}
{literal}
<script type = "text/javascript">
stopWait('progress');
</script>
{/literal}