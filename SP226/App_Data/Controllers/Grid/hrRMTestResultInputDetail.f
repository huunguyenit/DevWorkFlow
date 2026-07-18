<?xml version="1.0" encoding="utf-8"?>

<grid table="hrrmkqktrct" code="stt_rec_" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ma_ktr" width="100" aliasName="a" allowNulls="false">
      <header v="Loại kiểm tra" e="Test Code"></header>
      <items style="AutoComplete" controller="hrRMTest" reference="ten_ktr%l" key="status = '1'" check="1 = 1" information="ma_kt$hrdmktr.ten_kt%l"/>
    </field>
    <field name="ten_ktr%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Nội dung kiểm tra" e="Content"></header>
    </field>
    <field name="diem" width="100" type="Decimal" dataFormatString="@markInputFormat">
      <header v="Điểm" e ="Score"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kq" width="100" aliasName="a" allowNulls="false">
      <header v="Kết quả" e="Result"></header>
      <items style="AutoComplete" controller="hrRMResult" reference="ten_kq%l" key="status = '1'" check="1 = 1" information="ma_kq$hrdmkq.ten_kq%l"/>
    </field>
    <field name="ten_kq%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="trong_so" width="100" type="Decimal" dataFormatString="### ### ##0">
      <header v="Trọng số (%)" e ="Weight (%)"/>
      <items style="Numeric"></items>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ktr"/>
      <field name="ten_ktr%l"/>
      <field name="diem"/>
      <field name="ma_kq"/>
      <field name="ten_kq%l"/>
      <field name="trong_so"/>
      <field name="ghi_chu"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752CmBzyWz03Q1JxFVvBFHEBUbEhxM5jR8xai1pChatZxafrxg15wC6WttIWBkw9FVANEI3NYc36U7L3j9ZSdtZw=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEFZENl+E/dEb3G/jkvZGxE89N6hd4nCDkh2xAkotEz/pyRgzu22j6mEZAVNcWxCrRwPLeoyFO91X+E4Lu+zcMgT0RPN79dbsKg0BCLc42q0rReScnrUSjws7FU+SCjWQnKpfLBNIXdGIbxA05KtyC8N2vj0SnhN5w7IkAPxrz8MQntCv7x6LvcGHmHCEq4+LzmBZLGuVcS/lyi0SmY0fz2JVEf+3teKvQKcjW4DH2jOkpeRstrl4hmgj0UVdMw0YWFvfXcSMkzYLbbXy2KZP98QtBh1oMlxXiXjAaGwAJK8QXRnUZgw3TsCpRIab+vBINdP9ZNCo8gZYgJdKHzQZmPnY1LBuYUoaLgQS5B07v/43u7085a8lO9ePIdNvNJMdWwWHj8akVHdgnP31a2J3xjlKCENw2VrUeR7BamEd+EwLNOgu3F1Zyhgb/dftBOL+MJj+OpgbPLus1xwme5TAXr7Y4g6SYx/pfZJ8Q6jOHWoSq7U3U1c2CraBRbNBsVJXi0EJA5JZNs50NeGIF90HLocg9eSciq68LxOHeVVH/I6r2opgsR6iDl1NLSuHzH4q5UptG3QkccjMXJqmZ3pYlgUMZMSEg1bFG6nPstSEp4m10fsldUDDE1i49Wbeoe31aqHOLS0X18yiOdsq36RJq421i1LcFRXF+3Xlo0OIZWxGr38HJHJWOBYTvcxMnH0X/vopeZDDes7/mpS9PQovSJUPivdiNRry73B5PM8TXpLDEIq07lXtiRP4KJNw/iDkLAbwp8uV5273GWqBRbU/3tY+Bpt+y/aDts311IWpaze5GIYupmJyX8Os3yEB7cxUofUUVFGPsY681FzPepiGDPbpi3fY4eVIg5X69JvCRog4VcF9/e56bLAfTD+whJcXZ8EdLVafY8Y9X3nEhvIQ3Xw==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Retrieve">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5My9hatt6A7yiJKmmluod81YU9c3qD4yrTWhef3nyhtWI/v18/8UQ6WNcBlAvuUYfljy0Ai4vMNEDsWUIQHF8e9QcAVKUHE9fGylln/K2c7NNPLL2iAcY/Fh8NIA2i7mSbR1PATzPyP8gH5/hUqPjSAhRVeQjHzfA4OnMcGwYtcMMl8/T/ywWcVzCEYow0unVqW+eHUAgw43MLY3VGQ1N6DXZKYy4KsPTbvLKaI8VnGg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/i78tusYOHM8A+jYm/tXbRloVyEmARsWvqdvuN+JF94esNx1gtI+hpcBKt45LKNwr/ejUAs19nIwMijxLa5NxvPRr0+O2uWGn84YbS1IbqdJIx8O+9QBIzSdravDn69VY=</Encrypted>]]>
      </text>
    </query>
  </queries>

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

    <button command="Retrieve">
      <title v="Lấy số liệu từ yêu cầu kiểm tra$$90" e="Extract Data from Test Requisition$$120"></title>
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