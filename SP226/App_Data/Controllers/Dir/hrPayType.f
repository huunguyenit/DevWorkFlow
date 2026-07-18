<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY AfterUpdate "exec FastBusiness$HRM$UpdateSalary @@table, @form">

  
  <!ENTITY Check "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcMMP2F4PgIqBrN6rFZvF5sF+4PuNhw9Sm4TXRNho93N0FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8uFU727CuZ39Ew/s8c5yU1ZC/InRpuGP/kb9K9pHOvPUVJiw8DXpwQSxR5UloLSq/uCyu/TzXVhKD5kdmZt7s6vhYcyaof/NAG6lyMfpA+Utd2nC4mfU9U78ag8VPDdQKQ8ly2e+wYs0uApCgSyGSHEmXrxZLHxdAWJccC6eekZrrv4RncGxGkjlQ51JkYMIU3UNyTxfeig62KXgTL6/grAAnY78Z0adqU4UcoumSlPMeZd9dqnpU+jmjvd68DpLcMOLsi6NpOSTspKg98bRf7tGRQY1Fonop43f1g545tQ/+t2RaaJ629KcLG6xaVLbBa/azA1kATw6rKLBofnSP6KyMPZ0MxKoIly5M53/Dne09Yd6fkamakgZkyESNvltOlmbSdiYMaI8j6xSiCuLd/aJ6F5RHIRnzVZH7C+ZY9MSQqvt6YKB6kDtw6/Rl7FtlGWBouPcn+WWzTPQ1mUgP00nq8nKO6DDBJVD4Z56SlR1ddVpJQFgbIEXSJ+1XuFQDA==FastBusiness.Encryption.End">
  
]>

<dir table="hrloailuong" code="ma_loai_lg" order="ma_loai_lg" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo loại lương" e="Pay Type"></title>
  <fields>
    <field name="form" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="####0">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_loai_lg" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại lương" e="Pay Type Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai_lg" allowNulls="false">
      <header v="Tên loại lương" e="Description"></header>
    </field>
    <field name="ten_loai_lg2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
    </field>
    <field name="kieu" dataFormatString="1, 2, 3, 9" clientDefault="1" align="right">
      <header v="Kiểu" e="Style"></header>
      <footer v="0 - Hệ thống, 1 - Hệ số, 2 - Công thức, 3 - Chỉ tiêu lương, 9 - Khác" e="0 - System, 1 - Quantity, 2 - Formula, 3 - Data Source, 9 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_thuc" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>

    <field name="kieu_qd" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Kiểu quy đổi giá trị" e="Exchange Rate Type"></header>
      <footer v="1 - Theo tỷ giá lương, 2 - Tỷ giá bảo hiểm, 3 - Không, 4 - Theo chỉ tiêu lương" e="1 - Salary, 2 - Insurance, 3 – No Exchange, 4 – Salary Article"></footer>
      <items style="Mask"/>
    </field>

    <field name="lam_tron_gt_nt" dataFormatString="0, 1, 2" clientDefault="2" align="right">
      <header v="Làm tròn giá trị nt" e="FC Value Rounding"></header>
      <footer v="0 - Không số lẻ, 1 - Một số lẻ, 2 - Hai số lẻ" e="0 - Rounding to One, 1 - Rounding to Tenths, 2 – Rounding to Hundredths"></footer>
      <items style="Mask"/>
    </field>
    <field name="lam_tron_gt" dataFormatString="0, 1, 2" clientDefault="0" align="right">
      <header v="Làm tròn giá trị" e="Value Rounding"></header>
      <footer v="0 - Không số lẻ, 1 - Một số lẻ, 2 - Hai số lẻ" e="0 - Rounding to One, 1 - Rounding to Tenths, 2 – Rounding to Hundredths"></footer>
      <items style="Mask"/>
    </field>

    <field name="ghi_chu" clientDefault="Default">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="110--: [stt].Label, [stt]"/>
      <item value="11001: [ma_loai_lg].Label, [ma_loai_lg], [form]"/>
      <item value="11000: [ten_loai_lg].Label, [ten_loai_lg]"/>
      <item value="11000: [ten_loai_lg2].Label, [ten_loai_lg2]"/>
      <item value="1100-: [ten_ngan].Label, [ten_ngan]"/>
      <item value="1100-: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="11100: [kieu].Label, [kieu], [kieu].Description"/>
      <item value="11000: [cong_thuc].Label, [cong_thuc]"/>
      <item value="11100: [kieu_qd].Label, [kieu_qd], [kieu_qd].Description"/>
      <item value="11100: [lam_tron_gt_nt].Label, [lam_tron_gt_nt], [lam_tron_gt_nt].Description"/>
      <item value="11100: [lam_tron_gt].Label, [lam_tron_gt], [lam_tron_gt].Description"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAuFa06lylbnvTnt3hRjjx6pNfAuUMAC4QinBOWH4nQeFJicOkYzrVFxxltq6vyGPTVYWKdD0BNGENd8HihvSaQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKkAm+i31JKzrhASNgVSCGFqorfTwB38H9F8eFdWLvqQLzN2rUcnNO8ll9chIyXvuPBoSIBS4Vlo7m4yTyA/VCg=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPcs/ZG89OdVB9NMMX8JApM7GcGnPpXQduLb0ZzmTQoFz4mLg2ElHwvsF5mU37al70gy8ldkvxNwW5n16I0l6Rw=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbbmbt/lNErLxczWXaFfl/XsrBtgXuwRAb/gFOp6QR/UV7HMNFaPPHAw/soZlKi3hZWy3EZfW1JYBeXB/Q3DN2gb/ETVFPkwNxQX2PZtFhFDwPM5q9isPqH9l7aA+sxbigJRxEdDsSW0ykQbF2OMLLMtOTozdVMWBHjMbg2i35W+dgLyuIO4oAWumATJFrUUA40u95o8y4baOs6cLb6obUrRaC+TNGErXqjojHH38l6EfMjN2S2RQR8xeorXQl+LojMfH6Y3IKDlzJWlm7p4iC1rcef+RD/o/j98a7J5eDo/6ZGEypVt0O+hgEGeNUOF/s9ZOXwzHrILm4ssJZWDZS27A5R3d6teAdj0KA/sE+Xw4smLNOoos4CsmTHcYFDA0eBjS6a4vOStUqBHjFswLTCTfKTFQIeuzDReLTof+wIxROHr8wjC1BX3i+d0CmMdXr8+xRNB15jDKjjq20YVw9+TsNrWq3YeVfilx3w0kf7H8U8Pn+Yb9EzvwoEnt83YKX1tE58m4psEQZYwRE9/ItlIxa2ofy8t+u++aEGImz67reqc7U4IaRj++MUNKgWPxqBiMnsdLqSFSSehh6PWxI1NaN9FCnj/SraLE+7IzZ4gkKGDbu2Fk74nbAMdtHWA/P</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUV3wsUc+JIUzxQLP6X0YsPd2syzKfg4AfefYkgpQtvrq0bWe3g6/iDivlrnZwGvATlmFz948KNaRNJ+8eet2Ie4qG1MvcRoRhrjryneHQkYQwugbXuObbpos3Rgqjr0qxVfnROkp/L6F+mbo9h0P9ZXBm6YkGrcDl2nRj9chLkCE=</Encrypted>]]>&Check;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5TDp9gKkHvve57mgmSqrHVI=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLj1N/Yz/RmAHsYjFvZBNkI2Sauu35G/bhs/CAlSy+0a1P20XAWjlakE+KqQ+Ho0nq12Em9KAlqSb67YMDIgkhciLukY4md3ocd20/9DHksLMWI+HQ2VBxYobpWxrAciYwCdV7glEYzq9WC4ShsiaZVuiJJesRJl/FBR9z0Zf44kY=</Encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Updated">
      <text>
        &AfterUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV2S2dzwN6eJiRELvf0Nt+RH6bu6ZKplfSsHgkDdGB0+5H6GZY7R6euxnqvSI6jj9pQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CtcW259cW2X5eXJJH/m947khGSry8ATYIHGdJ3eEXhWT+1zMhj6M/Ex43CL6Vsax7IW4Ei9iddUxbgR2Mpz7St2pwrgGg8LbUtKG3wbhQ1g9sFisg+Gha5yOL+A+EXWLdNyNllltNJP9O0RRrXuBQ3GLjsah8/Pbfvqwcbw3It90bdY3d0CGyQe7JdJd+HsCSYud6kQ8FhXqyDK/uM0ZSBHKUVWaHgQGLjK09At4zE28=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkDp5YySFpnatCJ7F632SIfX/IvaUCxTlN8AcgisP+r15YGUDA1zXwp86speFQuPZ8dipU4bBBtnNf1ygXLp556G9DXkXHKwIcs0bUhtxSSmDfpnArOa2F5hEn16nH1PTwoqISrZi82+yW5FFvPyZssAo7nECVQ1bDsbAPfYkwEi3bB6qfYqKTaCe2iq8eFcoKCukl01aMsbW8fHtIjlCA9WnIdCKGMI5/h1Mi4qdoQsNouwkkC4X7RUFyH9H2tU7sPYGWUW1/ohVNlCxXJAQ+5r9nEBCFClrOHwgIuhaxMe55of4BQXEy5u92fPiUdG5RrSajUp1dBvvKX4MnCBRUc2YjQe5nGPyhCyzAyGHgRen3moDM25h7YFR3iwXGV33FYRFUIxCbFJv8ap1wcE5KU1serJ1zQtxwr3as1qQF5zcg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdVpVRfywUnXzo9HV4wfZcXiRg7ofkx7Od71fGcPefxjo0BjZx48UdMWdkFnkKX/QL98r7RCUytkDR3qCFrQosrLQBsjpmBe2G5EinbxCVdfZjty4HC6tvH2Plm/+Al4b01hr3oRT4zy/+o+pXp21VaGYgFIa4PNWDoedZfcMW9CPCJXUsOSoQj5JzORO7C6JdZc9GpOpfWSwA6bjFBBwS3AKqlSoishAdHUOzibsRm1z8d64tUvr9mft3mHzHo2IFWSoKcvxqczd46IydSxu5qZXFGqtVs2rmNVRaGKfrzU7rqI161cEUIoJv1c2f/8W2plw9MPo1wUkzucWrdockumnUnvKxBbRzw39ciAeHMbud49Ou/aloVK2DAeNqW26IYQ5Z1cPL90soYFBf3Q7TayyQ5hVzfxhI6/3CTw7fSGHPMeHnnPNsY9jmBrJnXpI3EK6OekRV9n1hzhu4pRNbEryoVX/Rd0U04Zi72e+SyklYlnFzVrUPB+59Q3AjDzySPRVb+ZeIWQAFhIvzlSa6dmzYa5sSadtZG3aDawYRQ3QhEhDd8xhh3yQFW3D1f6Mlc97xGYiNVi3cRDWb4EDZElMxfdPEUW1pzJuEOc8UfEuBblk6a/6NJmIsLEbk0137r/N4cvmCqOAc058XUaDyJeufVIJPm4te6ZP+tykwWhqSepngHLaPhttrqs/gniL65m8xQlm1LFft4QI9utD4jEpx6+sDeerRMnFbiKIkoAsh/s57XDGVCbZ8NQ7LsmpafYiKefQ44RL842gWEpeIsaJQrlw3dqaJ8KhfYENLKC02dtX1P263xCHEPeeQhitQGL7nIl0W1m7xaAcLFf7J1R4GHVum3RINpkm2jHfsoPEJQI0c7/KfiB2cKfoPTGhDNXtk1UzKwDv1on6l3HCG8T496OTembmPpbFG/fsImuKMQy19o2vSXZy9hbscRIjE0BYkhcpcGRlGk/b7RBvb3cceeXRoPT0KUdVN9DrQejwFISOJxYAcwLCMdB9Y2TIA==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>