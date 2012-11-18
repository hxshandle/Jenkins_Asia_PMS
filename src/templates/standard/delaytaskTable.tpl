{config_load file=lng.conf section = "strings" scope="global" }
{*tkument table*}
<table id="delatyTaskTable" cellspacing="0" cellpadding="0" border="0" style="width:100%">
  <thead>
    <tr>
      <th><input type="checkbox" name="selAll" onclick='normalSelAll(this,"selectedDelayTask")' ><Action/th>
      <th class="b tx">{#task#}</th>
      <th class="b tx">{#project#}</th>
      <th class="b tx">{#status#}</th>
      <th class="b tx">{#end#}</th>
      <th class="b tx">{#assignto#}</th>
    </tr>
  </thead>
  <tbody id="tkumentTBody">
    {section name=tk loop=$tasks}
        {if $smarty.section.tk.index % 2 == 0}
          <tr class="color-a">
        {else}
          <tr class ="color-b">
        {/if}
            <td><input type="checkbox" name="selectedDelayTask" value = "{$tasks[tk].ID}"></input></td>
            <td>{$tasks[tk].title|truncate:30:"..."}</td>
            <td>{$tasks[tk].pname|truncate:20:"..."}</td>
            <td>{dispstatus statusId =$tasks[tk].status}</td>
            <td>{$tasks[tk].endstring}</td>
            <td>{$tasks[tk].user}</td>

          </tr>
    {/section}
  </tbody>
</table>
