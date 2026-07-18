<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrrmcc" code="ma_hs" order="ma_hs, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_hs" isPrimaryKey="true" allowNulls="false" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="chung_chi" allowNulls="false" width="150">
      <header v="Tên chứng chỉ" e="Certificate Name"></header>
    </field>
    <field name="diem" width="100">
      <header v="Điểm" e="Score"></header>
    </field>
    <field name="xep_loai" width="100">
      <header v="Xếp loại" e="Grade"></header>
    </field>
    <field name="ngay_cap" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" width="100" align="left">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" width="100" align="left">
      <header v="Hiệu lực từ" e="Effective Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" width="100" align="left">
      <header v="Đến" e="To"></header>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec0" isPrimaryKey="true" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" width="0" allowContain="true" clientDefault="1" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_hs"/>
      <field name="chung_chi"/>
      <field name="diem"/>
      <field name="xep_loai"/>
      <field name="ngay_cap"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ghi_chu"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNsIAjfu32zMxP3tBgFqiSUagj/InsMRnfr6iYEvHIlk7LqPj0qWBGMP4bfPKvvR/anFV4hY88NNRavVmn+FE0aVmr0JL70ZpJ/Qmb485opE</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiLayK3XBm+OxojIiXi5gJOaXoLPjjT4Z/05QKkeddeY5IxnOf+Nt7OVawmWs1jGbucNJY4BclVUw09K0EWq9u2XOV5vymPKAx2o+LmOj7c7F</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%gq2ZSuGLKVqs1RidX1LnI+hraFsPxa+9sPXTaiUpZ6EkC4/8ldGbNBdb2qGxDN7wKBZKT+zIBx0SLfVYRtZXqz90s5brYhqbSEoKPT6GAfhTZQM24X1f1Xu7djhOpjIe2YkYkOCWmQNHoopTlRYWCcpWhTkESCDLr9Rex1eKlY6iTLGvCDvDH2qU5fZW4UEZcFaf6DTEKl2oOXCM9jub8iCCjqKp7wkpPh6F5qCf9oAqU2qjmaWXaP2mUgGtICzR2G1jHj4KaEscvl44SElXbjOU+YqlgQDzjMLcgoCo0Sdm3rUMDNhxF0BhO5tuuAmVNZJB0A/VtYqFlesbw8yR0ITaS3GAhFRzZoH5uyZ+Ot+IsEonYGlcsa/5C2iUo+cHGPnhXROplHzO/2oGzvlSk5IEbwBBqP0SdGGFExk3aM4=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoVw4MQWSymf2aqBlbdss5aKrTwOSh1SRR6QUoIgg+jyawlNbD7Lxaf3NHcgd7qUK9HO+oNeF0DwCs0/RAiTOEl</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>