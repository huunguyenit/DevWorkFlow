<?xml version="1.0" encoding="utf-8"?>

<grid table="giatrimauct" code="ma_gia_tri, ma_xu_ly" order="ma_xu_ly, stt" filter="hien_thi_yn = 1" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ma_xu_ly" allowNulls="false" width="60" readOnly="true" inactivate="true">
      <header v="Mã xử lý" e="Process Code"></header>
    </field>
    <field name="dien_giai%l" width="300" readOnly="true" inactivate="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="gia_tri" width="300">
      <header v="Giá trị" e="Value"></header>
    </field>
    <field name="gia_tri2" width="300">
      <header v="Giá trị khác" e="Other Value"></header>
    </field>
    <field name="gia_tri_nd" width="300" readOnly="true" inactivate="true">
      <header v="Giá trị ngầm định" e="Default Value"></header>
    </field>
    <field name="gia_tri_nd2" width="300" readOnly="true" inactivate="true">
      <header v="Giá trị ngầm định khác" e="Default Other Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_xu_ly"/>
      <field name="dien_giai%l"/>
      <field name="gia_tri"/>
      <field name="gia_tri2"/>
      <field name="gia_tri_nd"/>
      <field name="gia_tri_nd2"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDpODKMYnDEE3uZREQ2w0FUx5US3cNna9+PbApIlk/ZCZcUeKK+Sog5eCCI3M6LAcGDOwU+QrRbJBZ7eeDPzNw8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zz7n8YvLQ6cFuBFpJXwGBNPZa3fA6PcHw1lNAzFz4tgZLdsDoXAD8lRs0HUYc4TDU2Gf3XPFa9/DjPbVqtrM0E=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcm99KkJxRmEzQZuVFsc5IsxXPcTsR9p8F2vz4s+TPEzmmfCcXmVtFIc2o1kBkCotG2no/zQT8D33DPhcPotg5fW6xUWPI6NYSUud9/v8AzyiUxxJXOJ5GCA28W7oMugeqlFrH/jgtlsQCgIKFO3TkbykjbQa09NYQj95+HJxIX4SZNSGcLmWU8DaSHRr/Lo0MBG8PqQKfBbFfBXPfJKbtD6fU9qh9iXGy1pUSHmBcepBiRU1LBXTaEAom61FstfPaO9VM+EhMTWDgojuWoNtgsZFa2HpzH+MeZ/cR0+nniZkXjNZX95na/AD7+f9b/DzNfTmCvGnaHdOE26t7lVOTA=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6+1l5r4B2+cpPDe9T2Zng4iIkhf6ANVP5XepHuUUh8zQEO3gLZc2+IXkiNje56udLmkN9k8/UN6U7A59DYMGd/FgwvgnrxUAdQlPlH1yQ17aHyaXVwJ+0ce3k6f7sIGI0uiGyJ688EJ5UbS9eUl00Z0VlZkYVgw//HEQxO8m7FDt7Le8vjIrXVENETYlG2DMA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Reset">
      <title v="Lấy lại giá trị ngầm định$$90" e="Get Default Value$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>