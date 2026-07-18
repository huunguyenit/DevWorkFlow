<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % EIOptions SYSTEM "..\Include\EIOptions.ent">
  %EIOptions;
  <!ENTITY % Discount SYSTEM "..\Include\Discount.ent">
  %Discount;
  <!ENTITY % EINote SYSTEM "..\Include\EINote.ent">
  %EINote;

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận mật khẩu" e="Confirm Password"></title>
  <fields>
    <field name="type" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Kiểu xử lý" e="Process Type"></header>
      <footer v="1 - Bỏ ghi sổ, hạch toán của hóa đơn gốc, 0 - Không" e="1 - Unpost invoice, 0 - No Action"></footer>
      <items style="Mask"/>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="11100: [type].Label, [type], [type].Description"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ6Z3osRRn7IZEXHQKbH7bvn00/BFtMGq+dcWebrvfFZhWGGYQLUbGHYAN5/PoDqCd+LYXeP2DAdwuGdE7jnrPz9odFsMAeG1ZpUyWKPwKcB</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EVysHeAi+9H2/tp6pPuuLMVoacUjm0aTAx4OTopU/Y61x6glMwJvt1Xq+H/5YTXSrDGUxsRNy05rb1eML3Epng0FM7PbIJx9w2ilIfd22bHcVvdiUyCKrYtJaPAyUrhtypJBETCrQ6DkDBkaRLGswBftSnJOabAbI6op8pwRv/WT88S3EcIwDTmIhND8UkhJow==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYSqE01NzeJhLZfwoXbIa4Iw3exCULpZd67KEzrxwSxtiAtGK5xqvsGat4w+LTyTOEpFGP6r7T3S8O81gT/wzn3K1S6q8FF/4AvRjR9SE8jG5c3PtbbNkc2QHUQG/JvL+8yNC+j2WNPbioc6UVTQTJR++7Enx8+jESVRqy4eR1JQXA2YXgyHvrmTFZHqE3QK9/aGGO1xdIYmKjsyffZqZ5sv3AK399PJwjKgwhE/yUniMJFvGTespuoCQlEj9RWg7+tVptPldwEfaM7TIxl/lvYN+Nso8H8mWx6ER9oReOynWGMVRLM2oGwQrqYpuP3qODn1VGYGrNvnWCq4oeHB8vG7Xfw5GlTiE4NDPAN+otX94uXWg6Y8G1DyLbxyxvTeYsn4ZVhUE6EhnpIzpMTg5Bv/93k3aJG0x59ImzW14DdJI5ec0d0Wx2P+DHSZc3P55rrfrP7LHfJ+O/V1EtXcF+Gvj9L+Z1dog+eM8AJgmJqwzNtqo9w7ZdgoBVndq8WVjiWP/FBmxYBSrMsM0xIRPyT2HFmU/V2cxvemIUH6WsymU1NJfljS1Iy0ZuDR9VptHr7zMehgP55/osxy6/hIHBre/CED5LFXWsT8cyI8HREi7QSYHl6uR9yBNWt07Ay2xu0HKDvBZnwTkHC8GbehVixxsMMxj8VvTj/tCi6aLHzG8QXoqe9UB3YrXOYqD/+BxOz3Wym70gwpamPntHyF2gJJ/J2AQSwgcJdMdu78EesdiJlFjWShZqXLFwTpXyJd0BTENDEcZlKCawMD2ePM8PZAGBCWm2aeLXpV12khiEcg7a3NTFzloCkrbdOkCoOMrdCPiV/KU86yl/ZpOPso31CKjCn/Z8rd+dUQh421t0JGg0JSX9/Z7n/FqUEFhjtw7k7GrtsWdP0Tk87oXSCdOteapsH8T1kMnYXPjbQFe/5udsXDqjguT8dorLIRmc+qV9JElaN+ybaFmhI17DCAICIwQ6eC7MGh0x2DZz8XRFjP4hRK7+V3loge5xzFKcSS+w0l2tS6oKKWbBA/2ibiOjDg15I3hSccZdTv3bab+OUuF8RMWNkgFaTDNpSR7LV0LCdPU5/eqIKVpZ0eE1nu4VU=</Encrypted>]]>&DetailTaxFlag;&EICustomerAuthentication;&DiscountFlag;&EINoteFlag;<![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSBQg/pBQX51W2+SC6JFeQlYux5/aJVLXn3tCW+LRjpfAIianrkMuFLLZ95pGw6gw==</Encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QFC2P1K/gBCoiwOZkDh31ai1fCIQGArLLgWYzIt0jkNsqh7ob8MrP2CF+e9X/+iPcOhieCfYFZERiaQJIh0XAUriVNnCzT+Vwgg2pcWDPtBSziZhbq8QqSUNUR/PA1v0Kjonrp9ascrICM0l79ryLadETLrITsr0/s3HUF/EP79Fx/T8J6noW8qYDdf1H4EhxQNO0osV9DAgzDRDjboC4=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>