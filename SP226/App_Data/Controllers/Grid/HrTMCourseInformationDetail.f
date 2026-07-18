<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrTMCourseInformation">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbYnZFLnfuTpqo+AX4kd2jFBjm925Z0K50ZN41uyNVllfeQiz++w9acjV+T6bppTyBOs4mns5U4lb5jWvy3otmXcYkpNIjc4GiUsClF3Kbf7supv61WCr35fqePDtcIDkjK5kEhhAP6LkqGvW6mrN5LFOFEpbTkUXtiLfx92senmy7OzBK0nnAW+4qpI2dnsraaWpvEnarurUs0MYy/egClFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="hrdtctkh" code="a.stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="H08" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrdtctkh" prime="hrdtctkh" inquiry="hridtkh" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_nv" allowNulls="false" width="100" aliasName="b">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bb/qspxo/In64/zacjRF5X0sQs7qjzsK/7ycA1fO/E2hCBritmFMBqCB7q4j2cRoj8JJTybAnIhdrhG1LEorqk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="b">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="stt_rec_nv" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="150" aliasName="b">
      <header v="Vị trí" e="Job Position"></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten"/>
      <field name="stt_rec_nv"/>

      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>
      <field name="ghi_chu"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/dMtMnDmcip7QOXdz/wAQVIjmb9GIKh0p3FMTnu6DUhh7sF7+IkgoTHLYxl/mFWnux+ehPQev4QeBoZ7f9NgbXj4qGYSPTLevdwlaMEU3ReVlO7IXmLpp/c2oWn3zb7SQ==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEAwYZcB3DJ8VktUj+e3SXGjczj1lep4VPWDCjgMPhpa1fEHNjQWSNnP+L5HW2+aw2KMK4ARQr0FhSZpawW0IWzjjdO6ZC6QYzefOEh80EaTwhpMWUK8xMI9FPrmmK5658wbq4jLgEmqtskzLTjrPo0GEQ6cun/EiFCxTv3/GD9rgpM6YyUh8P/ZeTm6lms09rpoA1pZ3pzThHewICxX/sGYjYKrBxrRsTHRNYhqGU60TWJ+dpVr15rVfJVUt9KaI7MzLeHoAECRjBWG+6p2YQ0na8NWCSePKsdolrAoMwfpvv0IiRkslwJaxhDnNOF22Wcg+7t9OQUltL5JQlho8L935SdnXsibNY9p1iUaUVHkSnCeS21sEDhM3PIG/VAdjO3l3kJjoURmwG1gB3Iy1M8Nru07oHB3vM79JOrS8+1fmh8VncNcgIMBsBFdCary/pCDDZCoiC/WK5yOtxovizKulOaIYq0O5O6K9Qgvl4FGZcFG1Tv0N8RXoK/E0eTdAbEiTw9q4vWePoXLTudNwBbCKFuBRywqUytadI6SOVMkRvURN9JoJZ+dCM8rF8wnD09rYpWpGXOofab4uT+5U9hQXfOtc9WuFmkDnvjt2VP8sqbBqCCfxKds0l2KiQLjlYz9vUShmVuIMXDjJHPb8ajbMWu11xkhP/SJba3k0bN+jKPxXEWMMc4eGvrjjFkojf</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWOy8k1ZwwoW/sSin1DVr7qPeeK/OJmwzd+1ii8eIFi6dGeVidqQ/2lRL3iOW0h74QMCjts8kY9CWObMyhZx+bkZjvCmIDjwaht16CytyBn+MBRQ3V4tNOEWnNw8iL/upYkCI4USoc9rhI41oO+T04uE=</Encrypted>]]>
      </text>
    </action>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSDV49hXpphWWPk0sSDatADNXOFFI4QHp9oxOvflEiLptB72b+L26K8CZvGeohgq9VLfjhxmtnq5vEmfeCDGufOuymoEk5TN0yH96cmWAjZux</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5dfinL5IP8rhT8LzRDfvuUBgD2MNAtzN1DiOZa52FE8IuRDX2Y2OwROitpbvZAnJR</Encrypted>]]>
    </text>
  </css>

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
    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Retrieve">
      <title v="Lấy số liệu từ phiếu yêu cầu$$90" e="Extract Data from Training Request$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>