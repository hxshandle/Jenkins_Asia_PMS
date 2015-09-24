{include file="header.tpl"  jsload = "ajax" }

{literal}
<style>
  * {color:#fff;}
  .ipt-group{
    margin: 8px;
  }
  label{
    width: 180px;
    display: inline-block;
    text-align: right;
  }
  input,textarea{
    width: 300px;
    color: #666;
  }
</style>
{/literal}

<div>
  <h2>{$msg}</h2>
  <form action="/emailValidator.php?action=sendMail" method="post">
    <div class="ipt-group">
      <label for="to">To:</label>
      <input type="text" name="to">
    </div>

    <div class="ipt-group">
      <label for="subject">subject:</label>
      <input type="text" name="subject">
    </div>

    <div class="ipt-group">
      <label for="content">Content:</label>
      <textarea type="text" name="content"></textarea>
    </div>

    <button type="submit">Send</button>
    <button type="reset">Reset</button>
  </form>  
</div>

{include file="footer.tpl"}