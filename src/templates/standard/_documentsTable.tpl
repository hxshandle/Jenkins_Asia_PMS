{*latest version*}
{if $odd == 0}
  <tr class="color-a">
{else}
  <tr class="color-b">
{/if}
    {if $smarty.session.userRole == "1"}
    <td style="width:130px">
      <a class="butn_link" href="#" onclick='deleteDocument({$latest.ID})'>{#delete#}</a>
      <a class="butn_link" href="#" onclick='editDocument({$latest.ID})'>{#edit#}</a>
    </td>
    {/if}
    <td style="height:auto">
      <div class="">
        <a href="{$latest.download_url}" target="blank"><div>{$latest.name}</div></a>
        {if $old|@count > 0}
          <span style="display:block;text-align:right;padding-right:10px">
          <a href="javascript:void(0)" class="doc-more-version" style="color:#D14233;" data-show="false" onclick="toggleOldVersion(this)">Show old versions</a>
          </span>
          <div id="old-version-docs-{$latest.document_no}" style="display:none">
            <ul>
            {foreach from=$old key=k item=doc name=oldDoc}
              <li>
                {if $smarty.session.userRole == "1"}
                  <a class="butn_link" href="#" onclick='deleteDocument({$doc.ID})'>{#delete#}</a>
                  <a class="butn_link" href="#" onclick='editDocument({$doc.ID})'>{#edit#}</a>
                {/if}
                <a href="{$doc.download_url}">{$doc.document_no}-{$doc.revision}</a>
              </li>
            {/foreach}
            </ul>
          </div>
        {/if}
      </div>
    </td>
    <td>{$latest.document_no}</td>
    <td>{$latest.revision}</td>
    <td>{$latest.project_name}</td>
    <td>{$latest.description}</td>
    <td>{$latest.order_name}</td>
    <td>{$latest.quality_name}</td>
    <td>{$latest.insert_date}</td>
</tr>
