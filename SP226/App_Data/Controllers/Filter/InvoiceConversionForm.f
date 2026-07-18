<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận" e="Confirm"></title>
  <fields>

    <field name="user" external="true" defaultValue="''" allowNulls="false">
      <header v="Người chuyển đổi" e="Converter"></header>
    </field>

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
      <item value="110: [user].Label, [user]"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1b1Z6DQVvjDrs5T4h/4lG0CbjVbO1W65i0NV6HTl4uq96Ka83wyfxfP7iPuy3gYnLVq6ifEmRiV7J23CXMD8KUAMoHhVVED7RXXtz0IbvbpSwOZ3Z899Y5R2B/QdxZF6xKJKXqHy7i5Q01UQ4M4Fekt+huAH2jR2gjCU6PZ3EcWLoeB6gKe1AOuEfghOT9QjcZjWu6rqKPDXakCbk2LEjAO2Ff9iSI+6utjDPbAR4uRdGLfKiutH6iYM8fJhj6m8=</encrypted>]]>
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