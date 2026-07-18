<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnv" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin khác" e="Other Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nguoi_tiep_nhan">
      <header v="Người ký tiếp nhận" e="Recruited by"></header>
    </field>
    <field name="nguon_tuyen_dung">
      <header v="Nguồn tuyển dụng" e="Recruitment Source"></header>
    </field>
    <field name="nguoi_gioi_thieu">
      <header v="Người giới thiệu" e="Introduced by"></header>
    </field>
    <field name="ngay_nghi" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày nghỉ việc" e="Date of Leaving"></header>
    </field>
    <field name="ly_do_nghi">
      <header v="Lý do nghỉ" e="Reason for Leaving"></header>
      <items style="AutoComplete" controller="hrResigningReason" reference="ten_ldnv%l" key="status ='1'" check="1 = 1" information="ma_ldnv$hrdmldnv.ten_ldnv%l" new="Default"/>
    </field>
    <field name="ten_ldnv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu_tt" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="11000: [nguoi_tiep_nhan].Label, [nguoi_tiep_nhan]"/>
      <item value="11000: [nguon_tuyen_dung].Label, [nguon_tuyen_dung]"/>
      <item value="11000: [nguoi_gioi_thieu].Label, [nguoi_gioi_thieu]"/>
      <item value="110--1: [ngay_nghi].Label, [ngay_nghi], [stt_rec]"/>
      <item value="110100: [ly_do_nghi].Label, [ly_do_nghi], [ten_ldnv%l]"/>
      <item value="110000: [ghi_chu_tt].Label, [ghi_chu_tt]"/>
    </view>
  </views>

  <commands>
    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9zS0Mmcvz2bWbgmdo89rwOz6GTzio9sPl8TTvCkjlJyeoEBbMBNrV23+ccT/bLbHW06+d7sJmFby0OJUKzOPmC1j9qHZmBUMC9Iamwmh9vCjiXqtt5awyOHftLmhY9i7HDyNM652g6gtKMTLfULQFdz5v5Trmblhlbry+Mkaewkb6RVMY50PQKG4Aq/0EZ4GKOaFGktnQ+5D48ZPrQq169MJ5mgGrmJICLFmkBnIUoj5iyQeMMWjL+XdKoyoLJImebQfL1YO7MY+7rQRcuosXSlpgUCsjIv8EEuPMC/YjePQ4rw68rxjzBFauJ0BVRG9SKXFGjilWj5gaX9t1Jz3SorOLWcNXITe2Gak7MHdRL9Ts/PWls8UnxHp0cO63Jj/JLPd6IW3m9YlT960yvMN/cgH7tDKYR9Yptp4BSJNEDRKv2hs7qHEdq9/v6utpm1Gw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RprKKbd5HOe/Fhng97DmrLa2LGnbdplcpPscDx73W3Bo7Yn2Col/nd6LlAnji2U2GLWl6IY2KfKSLEBWqtSI0Uo/cs8/ZRRQIc12jFrb4w4IH9nDr1y/yWxEprhL6p+K/Qviq1M0oEFQXaS9xSrTAdWtTWbvcxJgszBfM2BVojX2G/3ZhDyD6YdhHmhdTlJbqHg5bDJjzvlYLOdcOTGrUkkcmwOn5wl9HwpfD+QtVCVf6wOE+o0a5ETFpKkle0rbxtuOvZj8oFTYi5oLi6h2fNb56ve41dXPbeXGl8wGQRZNzuUnzd999t7BXPrvnB/0SiUKLP/PqYdlh0P+8StpH7lVMTj/T6gDGODKAWKrhgP/B1kIxxDRY+9L0mv54sozqcm31oJHV6mWFR4NSuFIPOsOcLW7ngrEJCtM504vrzT</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>