<?xml version="1.0" encoding="utf-8"?>

<grid table="ctdmbbnkt" type="Detail" code="stt_rec" order="line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="ma_truong" width="100" allowNulls="false" aliasName="a">
      <header v="Mã trường" e="Field Code"></header>
      <items style="AutoComplete" controller="AccountVoucherLookup" reference="header%l" key="status = '1' and ma_ct = '{[$ma_ct]}'" check="ma_ct = '{[$ma_ct]}'" information="id$dmtktct.header%l"/>
    </field>
    <field name="header%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c">
      <header v="Tên trường" e="Field Name"></header>
    </field>

    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="ma_truong"/>
      <field name="header%l"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH55nSIipztr/Cfxm9sY193qrYlfAMLe05HKyZ9smMmzRi7gp07EBjuqMtQ9IoYGItQfAaFz5tnXVtnqrnqaLcIXH</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8h842utXmI8+w0DR4Pq8eukBqFKJuwEfYv8/zvoT8NivN4AsoIyEskxI+coA0pPuCyoispvPDaMBnePTSvDO5CU</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV3cWgSUjgKlReKY0mh6LQbv+oXjkZ8m0/v9CcjX4x0eqRO77QHFFkBdeMCUMlCPQ+pSrsGriwNGZfYf4uN3h66gB4dnv7Iq9sFmsyCCcXP++iXvdkHUtmjVuofRksvn2abe8y3CR61wnKtju7ulMHPncpjGX3e0AhMSwZqM+pzK3E8Fpn4f5PaunfTjTd51kGQHJ0mK3TPmMoxRJvxoAVANN2ZCJpcVO/G3/5xmXASDWxm6mt5q4984qZUiDMRdwUng//LxaWWwGnTrqxtEtuQNvxelCxoiiGYFEj9Zj4X6eN3Z7ucimA2nS4fOQx3iaw==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/i78tusYOHM8A+jYm/tXbR8zQoL2L+/9BZ4W02lZNBU9mRXPPDqMePz2DoWs2x/BTnvD23cKKHu+jFfMVbW6Wt8ydMSQIrotYKcjKEn97OTmH6uW0pmAnzz0T4NPm4aGSvO9j40U7eNbQrT3PggZ2hpJ+UYkZowiocNfD53eAmNw==</Encrypted>]]>
      </text>
    </query>
  </queries>

</grid>