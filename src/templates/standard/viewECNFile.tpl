{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
<div class="projects block_in_wrapper">

  <h1>{#ecnname#}</h1>
  <div><b>{#name#}:</b></div>
  <div>{$ecn.name}</div>
  <br/>
  <div><b>{#description#}:</b></div>
  <div>{$ecn.submitter_comments}</div>
  <hr/>
  <div><b>{#files#}:</b></div>
  <ul id="ecnList">
    {section name=d loop=$documents}
      <li><a target="blank" href="{$documents[d].download_url}">{$documents[d].name}:{$documents[d].revision}</a></li>
    {/section}
  </ul>
  <div style="float:right;padding:8px;">
    
  </div>
</div>
</body>