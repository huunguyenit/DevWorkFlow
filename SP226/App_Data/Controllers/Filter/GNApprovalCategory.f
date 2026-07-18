<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="gndmkieuduyet" code="ma_kieu, loai_duyet" order="ma_kieu, loai_duyet" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="GNApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai_duyet%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [loai_duyet].Label, [loai_duyet], [ten_loai_duyet%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtcf/eMQ6JNuhKdkli442Ikf6M7l+c0YsGFLrH4N3/w69JMW9NirVFuLaPD7QgRVxegVOpfxoZCc3PNFRMMejW5oRacfJYcHiweKP/gY8DchHQ9JR/YXeFwbQY9EowH5CqgXw6aJBbc/XUCMWKaUHzmu7cxReTkdJbvHfF1pR8QKDxpUpLGvOhZrRDLo2D1NyMVlmyUeNfoxgAY1TJh8j8bO6uZBlUO8OMmvp2iDXIVTJW3UHbLQ1zEV3rnUv8ujvs=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPB9Tryi3R6MZO324Y+kH/CLjMQ5MdwVGvQC+yjxFPix3GpmNH1Msy/YxMKk/cHWNai9AacW78/93Y4KvqyZ1CEkWt0UEj2WYNB0JeWZEy9E9iZLsHJ7o//oiw+WYDIkd3x+x1xGvfcDNWhKbUjU7YXIK7YtB87F/6by0cv44FnwfOxnM/akU205Nik50/HJPWBKAlyxl5g69Xhtsq79mvVeGBwzcVY0E0EhWA5sjDV9KgjoI8+Z0vqhaTWAx76vD/mNYoG9+VP4adXPkTUUYxVDRjUvf6RzTB7XnKXuCsQuAcY+CrsQGn/wBHMRJap9HgdTTWZtJD+tULM+KKe0FcgAN3xhHb7VcWKbygB8jdX2y6r3HsG/SyCwemXfliT0BK1+mdM9wcaLSl7K912c9wWypRbe8mEE9GylmdI+pXoOKzb3tJHrvR/swiYhlGIzVMrzG6oYuuvGOh8nj1vkrTNVsr4RsK3jxrLvdNIPBrR0WFSC11f3WpZFmRbHJ2bag6UMzUi7y+0HmCgoBoRwc7YYJYPnZ+D34ieFh0hhn6GZ7FWxbZUH6Z5UhwGkedvTq6d9DIDy2sdb+Vo9b7HYSjZXgUoVVmIqUu7mfj9BNddc/Qi6+HhpTS5/462a0s3COjWiIwc6kE+qko7PvVSO21KzFZMC0bnSWnlMAZLzwRMTTDqQd9vsgXEFYci1/l75W2</Encrypted>]]>
    </text>
  </script>
</dir>