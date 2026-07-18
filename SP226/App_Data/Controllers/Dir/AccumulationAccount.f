<?xml version="1.0" encoding="utf-8"?>

<dir table="dmtklkvv" code="tk_lkvv" order="tk_lkvv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tài khoản" e="Account"></title>
  <fields>
    <field name="tk_lkvv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="no_co" type="Boolean" clientDefault="Default">
      <header v="Nợ/Có" e="Debit/Credit"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 330"/>
      <item value="11001: [tk_lkvv].Label, [tk_lkvv], [ten_tk%l]"/>
      <item value="11---: [no_co].Label, [no_co]"/>
      <item value="11010: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli/YqWcZNeXRls7ZCxAJkC+B0nuQcpF8flg1r2aNOi4wt6NfwE3Djj0/55SDKxFOBAV4T0uLVxU1G928KXGI5PU/X53ZpwqIIwqn+BaJcJhwrK3hRlrIkpBgYqksD+H5GnrOj/o1NJyjZ4T8oQal4srQe3C8zpn+kpHzZBoK1IXAadqFAv6IIr+7cHJNsD2wtT0/65PwP95nosh8RrrGJiUJwkUgEG7cIxkt8cNB+XhsRug2iF5f/rkRVJNoqPX6dalnLbKJvRh7idYMWTuCsmD1xvToDvA3EVyjfuQNe9ZynR/4Lz+vnThK5AJoA9F30+hokC97le+N2tCIfyhqaedZBlLfBiKiJjeW0hmV6LAz0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nEQp3WHOxNklDmlFuZN/hGOXCWVLTDWEQYdyTdJbZr5smRqC1u/SnWX+E+hXVeC2N/yIPTQgEMQRj/XvYGxTkcTBaPfte5FvYVgNDdUMpivGfi4GRrqSjlL9vSg+qplm4MiqbkUa33PnK1nCny9XPtjehpFkg4utfpuzMBCykU9chBEXMf3PKyxsIN8E7kLYl</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jyHlWMnpHv5kVKkACRh88f44UI0NIsxUcyO0mrz6/WfSz63hK/FSHQyNkTlyP9RtpOfI2DYggAAqEVChm+J6V2I0vC9EXCdyGJGqvhQEEkGeG5Yr6CsjIUUz1NIf9eZuGOH6kCjM0A6TEuluy5oflgTMUQ1cKubo0q+SVqTMsu8VADazB4N1hLQDZ7d5gUXvxtnkKL/gRa/y+nCkMigx9svkeWdWIlCQqaMWYdB3r6wU=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqxPWwalYF83oZFROzSc3UZUMyFCHmkhF3M/WTcwjdnH</encrypted>]]>
      </text>
    </command>

  </commands>
</dir>