<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Item">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnkin4NCbSgFmfUZrBd3GfWLiZsnEc7aKMBuI3Z7hM1NMeEBgRO/JcAjTZ3dmyi98pXz9d6nub9B8gaVOhvyoKqnoxBVtNvl7fJRFl+EKMsaNPrpaGRbGtGFrKp2WGkLenBWC+1mwEVXgYGVa9x+U9OlsLVGrDhekg4ciaiK9ZCzjrFwE79X+0ObKfDa7UGAx5ruNECcUkzmut4iffszh261ajPzz7W/dfpmTs8pODfMs+RDi8ArrkvNN97yEYq9JoLkzLP/1cbdNRr90MuvW4QgKUoznCMWlCWMTaQ38NwVV70xzemX+Pa7ZDLPXPI5N0=FastBusiness.Encryption.End&UnitConversionFilenameImport;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcOJkMrD15Aw1XnSW6bB4eJ4qv3B8vkMq7Ac0BRuJ/BmDqB+jYWp/vNVm9j3ZHN0VMkVkdNKUu9RoZJZpJKZWsjI=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % UnitConversion SYSTEM "..\Include\UnitConversion.ent">
  %UnitConversion;

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_vt">
  <!ENTITY Tag "dmvt">
]>

<grid table="dmvt" code="ma_vt" order="ma_vt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục hàng hóa - vật tư" e="Item List"></title>
  <subTitle v="Cập nhật hàng hóa, vật tư: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>
    <field name="dvt" width="80" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="gia_ton" type="Byte" width="120" allowSorting="true" allowFilter="true">
      <header v="Cách tính giá" e="Valuation Method"></header>
    </field>

    <field name="tk_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk vật tư" e="Account"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="gia_ton"/>
      <field name="tk_vt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzmlG9QvhefESBpvdRL8cT2QcTuB34GxNrU7poLe1H4uXqCTlSKVNafM80zxt5pm4osXosZllRqH4ox79C+KAZi56s1tnwWhlx8nR6HHTgRAPJ8YpEAufpCQHQIwLC0tcb</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrlYN8OTNcRdp+JCKSIPlm+momEKkNYyItTwvz0SDWAJQyiI6gT2b1P0+3AelP3RjfnH9JCB0098DCXluFnHtbq7J8biQQU+ID7spl47OlYX2N9yxUIax2wDntQw0Y9Umv22bg5m5ThJnizZSSH00/5aHif69CzHKdX39DpkTF9/iFIuhDFsII0bDtA5L9QS6MvpebFjJ9XzuIXCxWnL1fI5wvR7tbgN8HjaMTNMW/QT5Mz/AIab+xhlO83XlCYvmK2LnZXA5OVbXfvR19PKqAotDGchZ0sYGars632DavQAzO3HVNiO61n/WvtdpzDv1p29xzbah/ktk087+DbCjnnlabjG3k5zhk0yPljdczM3j1DDDnDsvSkl6q+AxHmp/V6gp8BA2TgeF+aAnv8gBJRavkzi1NSSRV6+4m6R9Fjm3qdTQZmSZGpUWs+wjKBQU0KPzqVW5imcNPDfBnAa4aMWUb/wwSgSDs/qTBes+RMbA==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>


  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
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

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>