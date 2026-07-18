<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận mật khẩu" e="Confirm Password"></title>
  <fields>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP5I+LMRVVTCDYR0bnCpItFqWuqxrcCE50IrrGzdMoOWqQ==</encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzfFD/WNKZN8bu6KUHfZEi7F9Hrm8bLDOs6RT/1ntdsew4neVfZfRCMHWq8AceXJVinNdx/bszVuwDJfZxxSCZPo</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HxP0fz4MjycPzxMWD43kFv1iXLAaQom9yfKaiLJNYQT2ffWnLPBn6soodgzhQ7SNeU=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LBBxTxVo2wdYrIJzAd/YcC9NbpJekWxiFVMLD+8Fr07zui+H1rtFtE/S5Ue4r54P1Avbx4zOI3lZBShVhS88+uKH64YtRGOVOqSUZXemezYSI1H2bbDJ8aJWDsgqZKpQO0UcCjvQlFPTkpesLrH6DrubSZ1X3lNVlZ6JhxxnY7Rc6rHlP5igLEWDgeTRqh7JxgCwnwqILowDyiby7bFlyo=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%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</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5cBdf+Y6fnghL241kyDz6YVX/jV68KjRqPZfYObLs198eJ7N163RjkeuXcCXYvGag==</encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dXWbZTKDy+Sko210bcGJP4a/mEFUDlN56pJkixuOCUyrFPvRvXgSUA8i1DhsSg2+9ZVW6k7iEDAm9VMmb8h5MGloZ8pSKTb8nDKVpp6yb5Vw88JsMFZqID/6sSnaYwfERSxWwBjQ2Fz8GyIYmjcitMxQVXXqzUpMIkbQ7VA2+aIZJfKRLvVitWiha+xRl2ZXGSbO5jhetG2ck0bqCz2Dy4=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>