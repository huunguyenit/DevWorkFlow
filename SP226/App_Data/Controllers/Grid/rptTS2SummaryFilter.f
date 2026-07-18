<?xml version="1.0" encoding="utf-8"?>

<grid table="sysrpoptions" code="form_id" order="form_order" type="Detail" freezeColumns="2" id="" xmlns="urn:schemas-fast-com:data-grid">
  <fields>
    <field name="form_id" allowNulls="false" readOnly="true" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="form_name" readOnly="true" width="300">
      <header v="Đối tượng" e="Object"></header>
    </field>
    <field name="stt" type="Int16" width="100" dataFormatString="##0">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form_id"/>
      <field name="form_name"/>
      <field name="stt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiGQsfptMYvvh0IGVdr9vq+DQaky5A16ryNNpvsoPM3+CqmlrUC2m1h27tWw/47AzMdhIefK2i+mHTH/2xQo3uHw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FcMhrBUTX56wH8pyDHnCtSJyQUavXAzwEB1zZ8ncwdP+6Taj0bAC24G5cpWLaXqK493qggtZXklfWI0IIF6yv3ZsLbfc9c9qBXm76L+vNVxe/kMe8maKen1sv1eLLtgFT22hCsvuG5i+u8UPSGVmWdtAqfIyof/E9elkk48zC2vi82a8fv26Bf8dYRTFDwit5IL46hE9peQelV+uSr68rQhyZ/a/a/0BFenYoLE3GSEGn7/WK8smW4lyTdcVLeO4LStjX7TQorDt/qksKRUkw4YIj7SNi2qjTKiz6h+EzWZ</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyfsXGgTGykBvLLMnttyRkQ4+WQ3yVk/d3Ewxx6M+zkRTkduw8mKUG5e7OvAif6uRjZeZDnXsPn0IlMCrNKVIYjffWIQaW/TsrxKsm3m4P/gYubQM7QCgDMXhABCXEzdEs0jXTkhs6q6H7kA9CmAx3eFXpQojBfyk4VzRR6lMVLjMYCguDaUXg697jyWM8G51j2jlDYnUcNSuPDfePCv9+QyGAPH7pyG21P7OQYJQslo2ElORGnA3Dqv5PhRmdTY9qnJJXYS2/zd6kv8W9MpOZM=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>