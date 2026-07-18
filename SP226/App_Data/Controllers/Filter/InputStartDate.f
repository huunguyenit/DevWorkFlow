<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khai báo ngày bắt đầu nhập liệu" e="Declare Beginning Input Date"></title>
  <fields>
    <field name="ngay_ky1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110--: [ngay_ky1].Label, [ngay_ky1]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZ0oyQejAKOjhPui1Zh6zxPk3Jid87ZhB1HTOC94NP31bE99S0MrCuw1Sa7r/Z3pVpmkRCvZ6/i+wq2RyPl829CWmo/MmEehX/8MsOQjmqU8Hb3QktGBRf/olo1FP6NV3a5kGb81wrV0ful/DC8xmMgJW5/ZbZpcba/mp72SHwa/sD2XPRPW8tZEYH2qNxRzQ4R/b1xeTCKBLi0N4AEBDqZpERymv/kL+yAMldWtCJBVg0aiDqpgeAA9pe2jqYDVruXIfq5HQXOnBwPEDwo26AtRDe2aXvyoMrktkKU+G0YwqP4yv227HiwypSYvvg43cMZa2+JTHVn8yxAlq1mLAuSqSTLtvhASWtBn5CjcyAAEg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RS81+WTZpvg6mmwR7ihG+t1XfJPdd8dyduXe1+MN9RfNjN+zaQzPB3DSDAWMOqdBU1kwqrqw4OX2x9MkpLp5S8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY64w/6mZKJp2EmfUjtQddevlJWz3PPKEqIpt2m6G/nGug44+iO2UeDJfxKR793eo0oYa4afP5j1EnzAooYD3/rWV2ExsgZ7iKlrV81fss3h4=</encrypted>]]>
    </text>
  </script>
</dir>