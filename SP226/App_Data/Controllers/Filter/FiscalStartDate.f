<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khai báo ngày bắt đầu năm tài chính" e="Declare Fiscal Year"></title>
  <fields>
    <field name="ngay_dn2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110--: [ngay_dn2].Label, [ngay_dn2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZ0oyQejAKOjhPui1Zh6zxPk3Jid87ZhB1HTOC94NP31bE99S0MrCuw1Sa7r/Z3pVpmkRCvZ6/i+wq2RyPl829CWmo/MmEehX/8MsOQjmqU8Hb3QktGBRf/olo1FP6NV3aNkn1qyUXYyCy7YgSlocF1+6AOjt8UD/zBdjWJJOUH2Elu72yeeeQREPtAw1sId7fcO6pYeavrICL8Juq6+i+n9qQhwLkNerwrgSx9f80wqw8GpjuXG1Z48nA+E85oM6pQGKpuMSHh3/ppoHbVmXgEJNIQlAtPFA4mulLFDv5lDkdYe4rhUd7+QzYYgIGTKC87jq1Znlez16qZ3T5Hdr3F1AbbMSvgtgDT4cJOZ7aQ1w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RS81+WTZpvg6mmwR7ihG+uLvPuTeMwwzMD7ytE2YVrwZKJ69Xs31MHcywqG/Pb6eQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY64w/6mZKJp2EmfUjtQddes6fZQDY1U50Q7lnkwrU74xEXAV7tiCj3P53IU+bcemK3bT7DBDY62MMiGktUot6ydr4blADdNw+iibvUOE2D7k=</encrypted>]]>
    </text>
  </script>
</dir>