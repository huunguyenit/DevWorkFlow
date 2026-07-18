<?xml version="1.0" encoding="utf-8"?>

<dir table="hrky" code="nam, ky" order="nam, ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo kỳ tính lương" e="Salary Computing Period"></title>

  <fields>
    <field name="nam" isPrimaryKey="true" dataFormatString="###0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="so_ngay" type="Decimal" dataFormatString="#0.00">
      <header v="Số ngày qui định" e="Regular Days"/>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11---1: [ky].Label, [ky], [nam]"/>
      <item value="110---: [ngay_tu].Label, [ngay_tu]"/>
      <item value="110---: [ngay_den].Label, [ngay_den]"/>
      <item value="110---: [so_ngay].Label, [so_ngay]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eLXk9eVxdq+T/3rjD3quyaDiJfwNZ1wAYOqwg0dfAf3HVvkUoa+Hbw3F3GdKyAtdgeJ8bvx5Y3hzZ+nNMNRajDkfnGjl6v0S7T5KegJCnf3p+/Dy4/gFX2DanRVJHuEgKer6xHO3wxNfsj39v1MG245VbxRMKdEseR1Wt9P15Qx5seYjk5Zn3XpG0h4f1kxIcj9mQAudbNrQL1/dDBLUE7NxidnDytjjxbfnRBCcE+K</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1xNB5iPSzsdQiYmgGM9x9Guayyfa/5s/pil/uoFjLRlRC3o4KGcA+Zn/jqdDiUa0FWlbNWJVwjZAd8u0njD2XNsBF35eMQWa8sGXb+iCJ5c</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz8h2R94E9vjRHnJe8iFc1HrNqveb+TrXJeyPrtguF9caNcY8yfBpgAIUHKCc/5tYtH2lLrLLg86CW5tkxIKTFLIQN9kTwAMpNXxCDUksyr7</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cvggAmSpr8CP1SSYbwIay2RoIHgSHtt4MYkVE0D21/jiiy4lcorzxPXjZrsVHEBVND4iC1IfFeE9lyql0+o29LeyNRuUDTYS0+39PvH+c0HOgvp60aE9ZYUTD4CBUaUwUiOSq+5u94h1ZoNroJhMaTbqMAMc/YGQVxEZLcESpOKdyKeb3+GzJK9ORc9r0407TlNwy4v4i4vt81JceDQhDFmo6a3VIu/7ZhrB3LkQ/v8Lyrfd0LadeYx459I2rI+WixzEGRHtdv5aVIKkwXj0yf1DgLZDHt2gK0L3RZLO7eWLx7DFFChR1jyqq7kyOWer52ysuYs+DfvI33m3/OkkhA8zsHfUv7ylgSKZC3TlIFXrQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nxznuZ/qpE0ZPf2MOpNZdf9IA3UNgvC+hIexUayfT3GcGkoyrBcQWYrxAnok84b4xfQntHQaX8siSPkhOhkXsiuQtHvQMXhPVUF0AjboWpGc/EnArwrIT85rzAbcikJ6fly/Ea7ZiEnwKGSQiWJM4vuHAplAAc119/2NsawLndjEhqQEfT9yj4eZKcbT69rsT</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSWGbk2IopgpLKZ++unQ50wZRDgU9hmM6bwBbl8XgsQ0Cji286JgYyufNPhyAXPwh3z8dqSqc/uXl6fY14m0Qx241GIi3OqY/KBI5zUHuyzHSA2yOdf0y5Syc4frVWb8lNZ2T/PIlEA3KTV1WXfpUZK8PjVKCwdkqXUFPXef2KUYXTdqUwzLS2EROMgIQ/Q3H7g==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuZh6ZMhJ3z4eB1uSgYugrbKogw93//a+q8AqjgJ+JQH1GXirN1pAweGwOQ5g66+Ng==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NSWoArEBNuSCc4Tc5/4ykPXuqAiBViNMJf3Vekv/cxbFHxL6O+e0O5EMCrL1HhdtrPJT20A4aeT5mOXXhj5TtXMsAEfRG1zC48HkTrOXCJGu6oX7SOm3a4uo1Ldb+u/DjA7ymP/wUlqhlpTpOx7PeWwQMrZgBPcsJ9A040W6ZrYRk1v/IwHhwlyvn9LuqCjmRUePtYwxxyBCY1medmIiwhela89f9ubwsgl+HWYeK433pj6qEo8gvrOHDC6pS5NUTGK3A0E60cpo/SOUQgru7FSoBOkK7skGbpfQT6jFvDlCWxhefYHD8Yr4lGs3/KfZ0pTXkoW6eIXkqc7rTjxyDZM7Db+drUOzs8hJZDdd1WlaH6EqOr3LovuH16WTS5gAXYkrTZeyXq50mKaVO1rlIXqw+t2ceQS6lLQbaiz9MHP6JRSFGdxJptgyccFzrmFT8XMByZEBjWCmrWZymMHjROLcGZ1ubvx6gr8FZ8lkQdls4fGqo1n2BugvyY0USqS/yPb+I51W1OXoZVos9QvtFOIhtXzewkgt2sxJhMJ1vc+zQvjy6PUmWjTDwIBJDDMD8PBH9wWiAs0aw4SHZbhwhCZcwlRwtA5xF2x1IviUn94SlUfzFKji2OgVyHb8bAh9g==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FM8YnOQuI8ZWnSCiEF0MtkpEtae6g4yDfN8dlM1HTFJtJhcb5Tl5wWhzpUAdzG0Dm5boEfvd/p9jV1a1fm+q38nZ5b9NtMLgH44sCtKHXESdlza+V8YDTTHgg3rJZCTD68gsvne3gzOXG7xr73dH5QC8qw3IulfAzRmAHYvgfVtzrTBC3NvSfJmAMFgDRputjQuM0CwktQGHoRcgGDgQ6525F4R9acFBAjYl0JBl7L5mNCnbVs9Td3a4Hv1FIVAsKhs6u/ccBxLIia0w2YT5fH0wUMeK26mKfaesYRJdNQvWnPl0S8LNGBbuFDqstan7lNrrBl8KS134tdqEetk5YD0rjMvZThyyyVyhG3HEtju3cw90xwvi100cSafbMCv9AWQz2VnKpXFQ2+UwDCCwuuqu0FxA/kZT2xRxtxaB8mzseH68OsafH07upjFFFCrhw==</encrypted>]]>
    </text>
  </script>

</dir>