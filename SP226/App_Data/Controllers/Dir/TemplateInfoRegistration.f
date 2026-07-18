<?xml version="1.0" encoding="utf-8"?>

<dir table="dmmausoct" code="ma_maubc, ccode" order="ma_maubc, ccode" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin báo cáo" e="Template Information"></title>
  <fields>
    <field name="ma_maubc" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ccode" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_cn%l" external="true" defaultValue="''">
      <header v="Chức năng" e="Function"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
      <header v="Stt" e="Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ten" clientDefault="Default">
      <header v="Tên" e="Value"></header>
    </field>
    <field name="ten2" clientDefault="Default">
      <header v="Tên khác" e="Other Value"></header>
    </field>
    <field name="stt_cn" type="Int16" dataFormatString="####" external="true" defaultValue="0" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 80"/>
      <item value="110000: [ten_cn%l].Label, [ten_cn%l]"/>
      <item value="11-111: [stt].Label, [stt], [ma_maubc], [ccode], [stt_cn]"/>
      <item value="110000: [ten].Label, [ten]"/>
      <item value="110000: [ten2].Label, [ten2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1bZ6B5atbZg/+vHOz7SdC3Ed64LNS1uJdKN/B3Rm0Rx/V2VAEkXQItYwA7FtUm4OUBFusz5vYHGjmuL6zvHpObRZS8A98sYGH49+pTPs586i/ncHx+3o0t12V8ioQeAz4DQxVvHCyWAZlCAytx1RFX8cIvzRHs+HrM27e8ycrM35KTqZZcZ3U+CMPxVIyNy6o8+WE+WuW5eRcTahevL6OH3hlQF9ZwjiP+htHoRMoezqRmnYYgoJ+ER0GgLGYvgaA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6+4aAsM/u0wUaXC6tx/xCc0UFmvxJY5zUvBsZK5SdGxFbKHID+LyyB8IuCsMUqji2JbImARD6PJQQr0h//ZjYryWZyF+s01gYQ7ACtbbAHUDCUeemCjYvjm+TFckTME8ss5lJia1PGLG+jK5F9UTUw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmRkS7VVkKdsWocTjne8/+cWQWgyHG7pLg08RA5lFlf1iqSaFBhCteWVdkA+bWVfCvG8lECOwaJUS1l7vH/fRg2+StiLQrFD2cbPWjBSyJCszzx1VWcav96o91XrNGgiABwE7Pd3ijd08JAw0cJQ4yp3IF4nM8ujkw9wlZMZKpQNgA==</encrypted>]]>
    </text>
  </script>
</dir>