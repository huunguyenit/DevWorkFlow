<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdtyctvt" code="ma_bp, ma_vtr, ma_mh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu đào tạo theo vị trí công việc" e="Training Requirement Input by Job Position"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" isPrimaryKey="true" allowNulls="false">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_mh" isPrimaryKey="true" allowNulls="false">
      <header v="Môn học" e="Subject"></header>
      <items style="AutoComplete" controller="hrTMSubjectList" reference="ten_mh%l" key="status = '1'" check="1 = 1" information="ma_mh$hrdmmh.ten_mh%l"/>
    </field>
    <field name="ten_mh%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"/>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_ref" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_vtr" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_mh" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0"/>
      <item value="11100: [ma_bp].Label, [ma_bp], [ten_bp%l], [stt_ref]"/>
      <item value="11100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l], [stt_vtr]"/>
      <item value="11100: [ma_mh].Label, [ma_mh], [ten_mh%l], [stt_mh]"/>
      <item value="111--: [ngay_hl].Description, [ngay_hl], [ngay_hh]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIfzMW4BIo4CWhuKlHVVBV2s9pQivRR/DJT80PN8neVhspwOoq0ja6969OmFj3KyGV23H1DxSWkIRlRAWj+PRuOHOAJ76LeZpOW4BjKItluNU4N94VgIgg3CqLia6Q0f8ZckNZUYPGBTbKinpn18zlOW6s3wFWyu/3efxZwrLYFCmRC8wHkvVDuJzk6uH3WjWadqbbRlu3vTMUXQoBEssXJX1BIKLkXPuEiX4YWkOZvsMZYZ3lQ7+BGpmWoJvEHtWkCq/oQquMVt15G3RjICH0HOL8n0OB16mh4EWqC6+JtzgxkgufeNVbegWtyB/ggWFclBJ6XqIM+yv+tNVbytDEmEdmrQQSnODIF3OLsAPGaVJWYUDwQtj/rrYkQ/ikmjLriPfW1skTf4Am6QWhJ8Qcysi7yZw5TAzf9wSsEDYOTbDHidcd/paz0/6nk3qOB5Px9JzNgLFQby3W4pcs9XTTWbbT55RUcURjgB0tA6+eV04o1fL+k/ORzupz5HjsOkvR</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUWqLFFxGGpudDEGPeV084lXs1mCTKrV2TQ1Wn53vIc4Udh0aXKzrfyDlpoYuCWzN0tdNv876b2El3ee+bkZZAKYYrtckbjB5F4oZJJdHpUWb09ytXxnbi/NL1Pn+x0P+WY9hOpX8if8z/RfMtR+CiNmakLORr5VDd3Xcg3XdlxG+70XDDWH0WxCigWTcoTYXSmw4qwhsWLejdFXcXbFAfIvHaqjEDVMWbd20yyrvgVW5rMm5VwfVO5KHLpwsaZTj+</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLYckH7FnokB58Km/cpKVFuydyqRWxo3adprEs7ikTHDJNZ1/Ngi5/9dIh1zYCIKqJ7NpFVtE/o8nylA/yFuWgMGY9rZsMAody56BySUc7uhzFlkfshy5rriYJCuNfLbT5+OYuwvBFkLrgdFW46hJcVivwfBFgU3oe4zbDORCahcjY9HI4cCc9D+aR+nug25RHirQ2qv7gwenyEEbssFbbnBPXZkrZt9++++86etX8ciNtQAuj0BURSRQDGRgoIkvdCe1OEnZgsmYYIanVnN2lrjd8PsKycZwxWFvvaXD+xU5m26MQE4nAQoN/AXC4VMMvahBmzeaURPHeyvmVibNmRxV/eLZ90tnNt0EDqRk8Czk=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV2p8vc0lzET3U//BRXudzUdQbdvGnZGJYIqmSkVaQnfu2QgK9BrY0+cyVDld7jjY9A==</Encrypted>]]>
      </text>
    </command>
  </commands>
</dir>