<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">

  <!ENTITY AfterUpdate "
declare @rate numeric(9, 2)
select @rate = he_so from dmqddvt where (ma_vt = @ma_vt or ma_vt = '*') and dvt = @dvt
select @rate = isnull(@rate, 1)
update @@prime$partition$current set he_so = @rate, status = 1 where stt_rec = @stt_rec
exec FastBusiness$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', '', 'stt_rec', @stt_rec, @@operation
exec FastBusiness$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec, 1
exec FastBusiness$App$Voucher$UpdateGeneral @@id, 'ms4$$partition$current', '', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">

  <!ENTITY Post "exec fs_PostS3Tran '@@prime$partition$current', @stt_rec">
]>

<dir table="ms4$000000" id="SF4" type="Voucher" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chuyển công đoạn" e="Move Transaction"></title>
  <partition table="cs4$000000" prime="ms4$" inquiry="is4$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_px" allowNulls="false">
      <header v="Phân xưởng đi" e="Sending Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NRlywhxPHh9ctUIoYiHbYYt2mIQSK1HwvoadAbxcMNlvYTYmZMQ8t2P4sijkweplkeEx+eJ9LRT19WH9NPzkuE=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" allowNulls="false" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_lsx" allowNulls="false">
      <header v="Ycsx chuyển đi" e="Sending Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NRlywhxPHh9ctUIoYiHbYYt2mIQSK1HwvoadAbxcMNlfQ1tDN37XKxMNlEF+ogw/jHTVYgVIww+KHFqGEYdcfo=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd_tu" allowNulls="false">
      <header v="Công đoạn chuyển đi" e="Sending Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd_tu%l" key="ma_lsx = '{$%c[ma_lsx]}' and td_chuyen = 0" check="ma_lsx = '{$%c[ma_lsx]}' and td_chuyen = 0" information="ma_cd$vsfctwo.ten_cd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NRlywhxPHh9ctUIoYiHbYYt2mIQSK1HwvoadAbxcMNlfQ1tDN37XKxMNlEF+ogw/jHTVYgVIww+KHFqGEYdcfo=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_cd_tu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_pxn" allowNulls="false">
      <header v="Phân xưởng đến" e="Receiving Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_pxn%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l" row="1"/>
    </field>
    <field name="ten_pxn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsxn" allowNulls="false">
      <header v="Ycsx chuyển đến" e="Receiving Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsxn%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NRlywhxPHh9ctUIoYiHbYYt2mIQSK1HwvoadAbxcMNlfQ1tDN37XKxMNlEF+ogw/jHTVYgVIww+KHFqGEYdcfo=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsxn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd_den" allowNulls="false">
      <header v="Công đoạn chuyển đến" e="Receiving Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd_den%l" key="ma_lsx = '{$%c[ma_lsxn]}'" check="ma_lsx = '{$%c[ma_lsxn]}'" information="ma_cd$vsfctwo.ten_cd%l" row="1"/>
    </field>
    <field name="ten_cd_den%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="SFCWIP" reference="ten_vt%l" key="ma_lsx = '{$%c[ma_lsx]}' and ma_cd = '{$%c[ma_cd_tu]}'" check="ma_lsx = '{$%c[ma_lsx]}' and ma_cd = '{$%c[ma_cd_tu]}'" information="ma_vt$vsfctdmwo.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&1xH15u/kHzW68O9DMcOYSOG2h6Ky6zMiKwVTboI5uXJgLXfiZBkV2lMrqobUcknrVmmf5zxHECPdbDyV8i3Xq3xuZ+o63gDaOX3Ktm5pHt9BTYA2tnKDx/LA6OE0I5t+</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" filterSource="Optional">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dvt" width="100" allowNulls="false" inactivate="true">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" allowNulls="false">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0"/>
      <item value="110-1: [ngay_ct].Label, [ngay_ct], [ma_dvcs]"/>
      <item value="110: [so_ct].Label, [so_ct]"/>
      <item value="1101: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="11011: [ma_lsx].Label, [ma_lsx], [ten_lsx%l], [stt_rec]"/>
      <item value="1101: [ma_cd_tu].Label, [ma_cd_tu], [ten_cd_tu%l]"/>
      <item value="1101: [ma_pxn].Label, [ma_pxn], [ten_pxn%l]"/>
      <item value="1101: [ma_lsxn].Label, [ma_lsxn], [ten_lsxn%l]"/>
      <item value="1101: [ma_cd_den].Label, [ma_cd_den], [ten_cd_den%l]"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="1101: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="110: [so_luong].Label, [so_luong]"/>
      <item value="1100: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAB+PUMsPM6mb2fF0N4RY0+ylW+cEVlsm27h8+YvtJE3+5fMTQvjOZyUAtLOu/h9nlPdI3ZDig64G8Hvs2qBu9k=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ioX2dlA71hiUG10e8IUM232bL0R53xmxxBG3dKiKlNtdW8p0DbJpSMoonwn5Uk7zjH4zzthCzlApktsCMvga2HEZfEp9MhnLRn8NiYc+PYjI=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iceJWCrTPGRjFUxD5VvLzfCh+hQVufziUosJnnWqUCtYV6a/azFP/b+/7W6ibHXkiwbnAesFI/Ln7k34ASGAjtA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaQO601YxJTKv5NbpFzB9cu2RClR7SOrjRuvwiMCX3/kvm0MUDsbCW4xlUYELcfsiVS0erqo3Jn4kDGD5Xc73yY//f7/iMZjqPErfIw/tdBhlmMLZGPQiQ0POrdL2vSr7g+io+gDbLwO1dox0ebg2Qtcp+FZ9Up5/hteKPA179gnp98TkBidUim5wigAw0D2knJn4oWx9gd5VXWZ36ro18C3k3LLNoPo/bQrXhDJghsfb0hgpBWTnYoTxQHAZHu8xcXUjRHeaQSrAu5D9mpVPlZZglYvR1eMpA4Nq3ogVQ0Mtn1zQrHx+WomgzzU2/mr+zYvLSmSAvEYl0o1/i7+9xoIm4/p5cBGEvhwX5XHbKejwDrerXFIXI6uMepw9v6xK0D3ptg1Vb90zuBVPLHBgi5we0ZuR7iui6lxjzkSGpak/S3qHQILESIHD74XwZUbaJE92YgxxO2jzkdVnO/4TnOIdkSedJd7RU+80Tu1l4YeBe8RyexO3NEmHxDmz42J3iRR+2j+vX9sCDJ/Jv8xR0E/k6zS1JOz7l6QiQkjzUxDcfWg8y3/elcXo4tnQ+IKoRRjN7iizQcrhqrmedV588euDKpnhcA0EsgXIBZMPwgmAvBYKDqBNUaXKrI1GFEqi8pGYmKEkOcHoe7Joy07cE=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH1iF68zePQPRGd2pykKeXZBcAn24M6PirJ62fdNKNa8PttYKRsd2WqHgY0mHpiAjTKDAkaVa77kASuiTXWONE+jT5H06S86F9xAkb4GtWj91zneLvjHVxzInlmVgHABXGTFF660AnnO3KPnrldCpU+BNer2KxA/co2fTpaT9mRsWfImX63C5j4rOtxUHECtdemPLz+Go/+YLhesCPh/u1sqai6BSGp2IH73rARQp4Chb9b6Zt2NiM9SFVo1eW7MQdWvztLzroeoSpk1tlKFHNcZAzoxorvfdMM0vzZJMADiPqluEmqj8KsUhHg2ya1EJ4RGRjk1Q+ZzDEzuS6ILaCTp5/qpif+jCYs4ydS8Kx68VWND5qx9cfIxqWuQ4zWnhlajRK5+DyjlCIVe9GKIfdWnfPF86JV8e/UcLZ4SD03quRHVjpocw3kq1m5Q0QMz6wol5KsB0QajgyerDglLIIH0PcZutbK6CxzFb68yVpfpsPjFxioUrTpNPrSw1MxwIG3Yn3tSC8uLIMpsbU6atr14A==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHMbfxGR/Opo76rCRmYWK9j8s8lSDvRpaEmSn4kWGDrUFkmFaUmor+9CJBOzJSZ+hSxUWfHvD19TpKbj9g0nb4dI633NnkTKSOY8cmvvyivLyYEbt0N/4bhXBYEZRfDN9xJzKVj+hVhXl9T9Tch/VPU5KFx5dGsl7X5NhzXPImi07TcyNP/2GqEWl8zvKe/28g==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
        &Post;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIqJooHwZPI80Wmvmq/1ZncftImTG1RxbAZlMm/pck3WjkAgP/NBBY/oYa8LY0Jiiym3JcQFmhbgkOzM84/btNIzWJFMSmw7QOq4pCsP2dn6</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ANj6ETYz4qNWgwYtO6TPGqXqtaJy1QkaxmwPDXtSFm/dbyRg0D8mlOcLzmOabxmjlii4JFNj5YtdfiQXTn1O2UdE/RrXhE+Us2yUXJxmmPPhdsUfobLVeUR9oMMhdwCZi4G8F05ZXvb9i3G2IeaVe8ca7FpZ3a6YjM5Muy1gZFbW1Ci/PreHDrerEV6R6kUpr2k6L9z0oy0d8FbiUpbuaZOcJHSnPk3P5dRcuqutgvXbwbEQmpANdFa/TOl/8Yg0DbMRhgUX9tm8WW/u1pC3utXhE8IUQDZZMTovaYDMN+vWXQ4HJiF8PbVnJnmTP397Fcr3qkAtJ5jKMxFWFrXV70nli06oPg1xgVFpQRk/Z5Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9XbUGEbF/cl48pokOw1xEmdC304iz/UuhC/L2K27lEM1z5ASG+Zlri3TAxhWJPHJowlzHOJGfjtK5PGJKFHB/cCf6s2340MBPw7+6T7PkYpI0vLEZbA2iWjvOhwLI9SQQ==</Encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIqJooHwZPI80Wmvmq/1ZncftImTG1RxbAZlMm/pck3WjkAgP/NBBY/oYa8LY0Jiiym3JcQFmhbgkOzM84/btNIzWJFMSmw7QOq4pCsP2dn6</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0Pvai1fnk5HLBxzw9qDS4pV/Zp7anABIOeIKzERPzZaA</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkD5SN7GNtWfBtsy81UKu3mfw+PNOVNpfDAg/MPP0wKQHGAVNHtgRy5tVVD4WWkWSGb+ULlujhsB3CyF8+RLKNfVnQMvJQR5uHIvnT8GJxrdqHAPTFQZygy+rPf51Sb42zstLlTDDA2Mr15nsj0epuwKf4O2zrlsNdf7PGo1dwKpQvjqeJxEm8y9Y/6ni/vR9VmNEi7q0TrFw18QsVWygZit2SLNw75wad3iv0WD9HHrP8w+M9Sd8+WbHtthQNcWpcE28nnCpgjzdeq16FqBqqHJa7jqNGotcnAZzcxH3O+Uo6hBdPjoSMC5QMpgbU9y8Ms4yZ29wUOTV/pcwolHenpHkaVWW24Yr/K0rf/xq+xP0nJqaD3PPiIOxk0kDo3GRwM=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtaZGXGKo6KI7IEyYZ3lA48ITrjIdG+j/AogSIJ5DmDdcV+GREEVGG72wUwJYqgQf8O8BAmSH4JRubpXYmVvGRu3M/UJ5giRDnrXzAJ3DUe82DXen3nJ/yDgfhvMhC8ugqddKmfy1TynY/l1fomz2q4zEIzf+/ICqdnPaeVCiEUHGm6LwiiPRsDpl/gcvppYYtDp7pzmJ9gHDjhRFtd04R6mshoPxSNkmDjIpivghvGHklMEYZA+RMCtPw92l8UmXoRbuyFisxolZZ+u1OP0++dv5rZ93B8Ef1QflPP/LZJu7WlB3IooAWaZ2BOIvlXx+/HCSUTMw1wdLrMUxJUzUvxLmJWup2ifme//lkuCaHjWu+4Zh475rHmFRO2PILazrGO+DLZiYLpCWfpqfkGxKswtlLWRWNOj5uciA02sUVUAPEAwkH0Y58xzbjj4VHMqDVfhbqUmjtPao+vowTdaOd0oBDFVf87zNVmTplRJKT9XoUOrmJhg0FGLgb0jA2bs10KfMfKMoiS/gOpihISF0B/kMrd9JqJ9OXxrMI0muuW/o51XAVbMbwXq3IyYqfILhUL3mIRXIdHjTfG0TNU8iikX5NgDZ/yPQOTPN0EAotxqhoCGfCbZZor+Rex5zNBqU6RPwh6WEbwBUq3sNw/XoK5yFwZfTy+5iSSKBOUKYLSeRTt9lurebrHtIJNcf2bBxMN/GaGYTJAxOkRcZiDxPh6Q4LvIDTDQsnn57lwAUcgVZLOo5VrpWDqMYEYlnvFoKVmwe646C9dqurGDspxADtdRX1Bf1zSUHu7Vb2rcEphQhQqo6tXuOv5eE0TYXNDluFR5j0u+iS2Q4i39rvbuGxnSxjhsMUtc0xsCmrTvUA37Amdkb1+A5F0M3Ujk9G1QeqcAndzwDfY9tPt+boqaDKpcmEbZKuRIIr8hhhZhhVXKpybCOIOWGpJU0HvyirvLxoPg41R4uVmOMEemrDjof1IRQIwX7aaT9XervbnHkaha66NZ+ogMfCvSVLjst+wD8LrNsR60nkD4Hfz9YLRlwsL5f6JX9npUZ/hEJN9usPdFcBOX4XQBpOOS9OetTDYuakT/8nZYept5CwJZHtRUIcBvK7MVARr2dMF4FRqSXRM30</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXNIu1i9vLplAyNQLu+wb4QUBhfHJi7sokThSj+grSf72+D5iTLMUPqShMKbR6KiBhIYh3Bc+I+EqAsAqCN9pwgSMbxEK5L6jxJHtkxLLcNWe4QIphOMfmBwYRsil8LyfKUiviroe+Xx69V5HwNpYbME=</Encrypted>]]>
      </text>
    </action>

    <action id="WorkOrder">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzAnykN8AcGe/OgsaRXAq8gX/YeRMZUNULLZlm2E2QRwJ0dTdZVoWEiEJqO9QaQ9/CuMpVLuCZPSdVGqL7doZLzRgRWzV0cZnJt9+RYOW4X5cwGU0U8QZJrrxGtaECGVhKn0SUyjsh5CMpSFY+f7kAaDfr8xSFRv0Gi1SdauNjIimb+PWWJtJrvdJuQYYab43sTZWmgv1aA5Tciy0GeAS4AvDiucjXf7knd74Et+zuau35PBm6i+7jfKRxrFewt6Vg==</Encrypted>]]>
      </text>
    </action>

    <action id="Suggestion">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4uFlgRi9l5jALmiuf2sDohbTFu9sQ+6SYapyT2HnmEwtbxZuh9qyFYga9zRv1lojXxO8DqgOzDDfSiR0t/luEsj9zHa5Q/hTemdL4SaUUH8V+AhRBArZlksHE5FB84a6Hppl6YVXSlwBf/dZmpSIIzVjqcKoUyb+389cado9blU4kNv4M5BzmAmv/BBGmpU4ggZQLGnIwJuOK079oZnrFCJSJd0iekGX+RzAcLWLLu8Q==</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>