<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdgthct" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt" width="60" readOnly="true" isPrimaryKey="true">
      <header v="Stt" e="No."/>
    </field>
    <field name="chi_tieu" readOnly="true" width="300">
      <header v="Chỉ tiêu" e="Criterion"></header>
    </field>
    <field name="muc_tieu" readOnly="true" width="100" type="Decimal" dataFormatString="@markViewFormat">
      <header v="Mục tiêu" e ="Objective"/>
      <items style="Numeric"></items>
    </field>
    <field name="trong_so" readOnly="true" width="100" type="Decimal" dataFormatString="@markViewFormat">
      <header v="Trọng số (%)" e ="Weight"/>
      <items style="Numeric"></items>
    </field>
    <field name="diem_nv_dg" width="100" type="Decimal" dataFormatString="@markInputFormat">
      <header v="Nhân viên đánh giá" e ="Self-Score"/>
      <handle key="[readonly_yn]!=1" field="readonly_yn"/>
      <items style="Numeric"></items>
    </field>
    <field name="diem_ql_dg" width="100" type="Decimal" dataFormatString="@markInputFormat">
      <header v="Quản lý đánh giá" e ="Appraiser Score"/>
      <handle key="[readonly_yn]!=1" field="readonly_yn"/>
      <items style="Numeric"></items>
    </field>

    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="dien_giai" width="300" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="bac" readOnly="true" width="0" hidden="true" type="Int32">
      <header v="" e =""/>
    </field>
    <field name="stt0" readOnly="true" width="0" hidden="true">
      <header v="" e =""/>
    </field>
    <field name="ma_loai" readOnly="true" width="0" hidden="true">
      <header v="" e =""/>
    </field>
    <field name="readonly_yn" type="Boolean" readOnly="true" width="0" hidden="true">
      <header v="" e =""/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="chi_tieu"/>
      <field name="muc_tieu"/>
      <field name="trong_so"/>
      <field name="diem_nv_dg"/>
      <field name="diem_ql_dg"/>
      <field name="ghi_chu"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="line_nbr"/>
      <field name="bac"/>
      <field name="stt0"/>
      <field name="ma_loai"/>
      <field name="readonly_yn"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kLDeym8xloFZHAXKgnrjfOmt7EsuHiwpyiyJb8b6q/hQBWl7d9mvmfHHytrOeNSPlS8Chk/ROb0qMjfGEyrLFOf2xLli4dW8D+J249F3l6UwVRp/Wnwmq0uuJcFT8zmVHOHMvztvN2xe8K/Yn4UJbI9zNsgIXjp6sttdLuQN4YFZIoqF4uTtc3BA2+mopcSrJPEjydK2wF2WTGHAEpll0MOA4auNjJEWyS5I2cCTO5lIssSnOeLKUWNo4Z/Dk5arfedtXe9rDfkewuNSqWRsdtiIXBiWiXpl6YgtUjFOC6BGvXSimRFHWHKldwEX7m9wwg9znlZa3ubVAJas40C6QJs18uKDbJJr/hQrH3UUE4qO2EFzrXpRp/yLuU0I9XnTEo96wLc5/2M/fPQ0TZ+F+gNmHAGd5+Gc2EMvkUljARgvzLMm73hZFcV0MV4PUjS9VIzOiRsTx9MZpvryACJKOQAel6QoMTzni/cUID9OqGKVVHxtLH+DYelLsjEVrgQB+o2zTHjZa7Ak8UaFzku8ixO6CvNMR958hC+euMw2PnuQcDXBsY7Xf06QmTVxn1KKBOZMZN8eRXKVgp8NxVEvLehWXsKubTs8S/MRvOHMiXuB2u0Dx4LjJWj65avcoDvucZEYLRkr+W9+CpjEhNt+uQn6XgSjUy1+O5XNZ+Oyp/H8s6W+P4wC/xF469G8ohmQVEr83aMc/u41qGlvWMitJcFYclRSbSPC8ALBoDY5sRBJktJ4il80lxSk5GPto0AuxsR1oBkXnCNqzIq2UyJ54/4ns1T2t3Pqs5NVR5Td2RPlO47twsmEz0/WtzOG8BFxrSRbGx7Mcr91rN5Qd9buyewAAA4CTjJ9Xajg1IY9vrCpybF46nP/9CnyLErFq+NBOAYL5k4SmD6zlHB8hi5SqM9a8gqvgAfASkqtqHbc2kHvL56+5GCSFLiyREuWlpmZwR4wIUq0WkrNb5lri90pxx7CWMIqwuoJ8oHXk/wFIt3AsGjzJVZcky60ehfuMt0rMqdk5vnQTYRV21AV0NaC2FMZ7RywQeLDKX4fCFAKtO9ggRLjCJ9D4DIeznqL4pcxqOLxR4douBat4E2MtyffY9Ev4FAl9LBLftCadn6y3om3ntgvM+VvRWXbJlA6wkGZFg==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK9AAYMKA2ZeQ3fcqzE6KYsevkk0RTG0hEYMPSJ4YreUSfcuG/hJoAiNmJ7ivyob75w/WNBfMba8cGk+kJuS4W1x</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7+/XCE7z/mLGd61/Qe1WGfBTjU0APHeFJWTd8NnieEfXsao9nu9SMBRpQ4QdfnM0GwylYclg3dfumT+WecJhCrjEzc8LYfXcY+g4PKIY9I58zqY5vOORDrjGhgriOpX39GySXGNDsBDAYSAXDDHEwrvAc7uBPoPj6rbphY8F06qyuy0LvVrJQ0Hqds8p7g33A1Sp2G/Fg+KfDLr8FmD5GCn9tJZUIsEPDtHCMeYgMAArWhkO14w0vLaBrHKf+HNsVXCw1kDeDXmYtppdbY2kAkiN4+6z8cwHIukRsljAOLk4mSt2KzKuB3PnFR8kwbAc97fMv0snyvqHVCnSsWsrRYrWiy0c5F9ydX+dnDP7BGm22z4OQVH8okGxGGH1n9GMOXKqQI+wLRm/N1Qh1QFGOxOi+EhDswISdp1pzp4PoEIRBXlHzDXaNWBatC/C6RG2oKg+wgvhL6pLIucMtsURIBTnpkRcVlTAjUTfuCZwetm</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Retrieve">
      <title v="Lấy số liệu từ khai báo chỉ tiêu đánh giá$$90" e="Extract Data from Appraisal Criteria$$120"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>