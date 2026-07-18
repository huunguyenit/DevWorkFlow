<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjmy5qh9o6yahgy9KNWbrdJTkD4bJG88YfHMdl/f9aLSkhkWB1Gm2YPkhMXE/dO8Wo1QsP4Kzcm7k5Azgkif01bc6mF5N/TQovAQDuCABmpMnT175QLkci5r5qliN80X4003PNYn/prpSb+pqzMMnMQ5asxxhoHs34W25o4iP8bytI/1iPmzLGlUhr0rAn+091XDbjruOycpyCOy+7/EJG/gdKpm36r4XjUhyjdw4JcR00nQzB0ubnloS5u7I2nl0L2fsYeKHt+xm1/V573L0/tG5KgXegWPrwrYpaGBxQlW9fBAPdotNpJy+MEg+in8/phptU5mhtd++UP2vFmUCf74PkOLP3XVZ9XbSLVthgwB6FH25YQDyoDW8Ju/73T8A389MPcBtFUfkdLRgYTYYVzp2KQU5zAAO5KVWdJvf7bottroYmA9azQQNgfSALnp06B+uJubChmbb7G6uHh7Ut75uLksNbkbckTvPa6qcCVsIHY634+tD5pXXYGOkKkB5tz/+LT0CJ3IcNg/R1jvN5Cz4zA4dD0j9GJNj3sQ6m3keXPF6+ary/rseqgaEujmdzVgdEXgIoBt8eRL9LY9aO+ilia7gyCeTSn0/cTtqBcizJ9xiYnURPAZuvKgpQ1HrK7W2giggAx1dAFCyX4uuqAZeblnCJeswdaiJzRGnTip2lOjtInXDYfjrh+a5zzFrlDM+d3UfEI2nRNYmyudaZOeHbFdW7HdJwckm8leEAW434g45CdJfKEmI359Kdwe5OZNll02Rb+Nr1mB6NLGyNZzd1TSBxk1bLMLJorrHbH4qCiuwxJMWzT3lKk0MSxRJ0N7ZQesnlEryw1FXaQ10Z6pdam0RsZM7SbPMbPOKjBTWOHVQjzoQtBafLR+9nCSy8yALBCte5PrDEPxfgZBiZ9K+xqkZgbxrE3DaCQ1gSO3bxUeszbbxmMAQsuEhb5ofZTGG56iW23iNebqJvGBqDLI4zb7CQM/yJxz4ZVooZ5bC5/CUwSN73yzgDVcJ15CDix81pCVr+cFL+MIqTl3s2rKvKuka94VjvCDwmpL/+ShTQD8ue1oCI23NZipopW9B25/O2MvdsM0vwrjeO35nrH+</encrypted>]]>
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